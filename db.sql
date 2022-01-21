--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: act_evt_log; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE act_evt_log (
    log_nr_ integer NOT NULL,
    type_ character varying(64),
    proc_def_id_ character varying(64),
    proc_inst_id_ character varying(64),
    execution_id_ character varying(64),
    task_id_ character varying(64),
    time_stamp_ timestamp without time zone NOT NULL,
    user_id_ character varying(255),
    data_ bytea,
    lock_owner_ character varying(255),
    lock_time_ timestamp without time zone,
    is_processed_ smallint DEFAULT 0
);


ALTER TABLE act_evt_log OWNER TO alfresco;

--
-- Name: act_evt_log_log_nr__seq; Type: SEQUENCE; Schema: public; Owner: alfresco
--

CREATE SEQUENCE act_evt_log_log_nr__seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE act_evt_log_log_nr__seq OWNER TO alfresco;

--
-- Name: act_evt_log_log_nr__seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alfresco
--

ALTER SEQUENCE act_evt_log_log_nr__seq OWNED BY act_evt_log.log_nr_;


--
-- Name: act_ge_bytearray; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE act_ge_bytearray (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    name_ character varying(255),
    deployment_id_ character varying(64),
    bytes_ bytea,
    generated_ boolean
);


ALTER TABLE act_ge_bytearray OWNER TO alfresco;

--
-- Name: act_ge_property; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE act_ge_property (
    name_ character varying(64) NOT NULL,
    value_ character varying(300),
    rev_ integer
);


ALTER TABLE act_ge_property OWNER TO alfresco;

--
-- Name: act_hi_actinst; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE act_hi_actinst (
    id_ character varying(64) NOT NULL,
    proc_def_id_ character varying(64) NOT NULL,
    proc_inst_id_ character varying(64) NOT NULL,
    execution_id_ character varying(64) NOT NULL,
    act_id_ character varying(255) NOT NULL,
    task_id_ character varying(64),
    call_proc_inst_id_ character varying(64),
    act_name_ character varying(255),
    act_type_ character varying(255) NOT NULL,
    assignee_ character varying(255),
    start_time_ timestamp without time zone NOT NULL,
    end_time_ timestamp without time zone,
    duration_ bigint,
    tenant_id_ character varying(255) DEFAULT ''::character varying
);


ALTER TABLE act_hi_actinst OWNER TO alfresco;

--
-- Name: act_hi_attachment; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE act_hi_attachment (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    user_id_ character varying(255),
    name_ character varying(255),
    description_ character varying(4000),
    type_ character varying(255),
    task_id_ character varying(64),
    proc_inst_id_ character varying(64),
    url_ character varying(4000),
    content_id_ character varying(64),
    time_ timestamp without time zone
);


ALTER TABLE act_hi_attachment OWNER TO alfresco;

--
-- Name: act_hi_comment; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE act_hi_comment (
    id_ character varying(64) NOT NULL,
    type_ character varying(255),
    time_ timestamp without time zone NOT NULL,
    user_id_ character varying(255),
    task_id_ character varying(64),
    proc_inst_id_ character varying(64),
    action_ character varying(255),
    message_ character varying(4000),
    full_msg_ bytea
);


ALTER TABLE act_hi_comment OWNER TO alfresco;

--
-- Name: act_hi_detail; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE act_hi_detail (
    id_ character varying(64) NOT NULL,
    type_ character varying(255) NOT NULL,
    proc_inst_id_ character varying(64),
    execution_id_ character varying(64),
    task_id_ character varying(64),
    act_inst_id_ character varying(64),
    name_ character varying(255) NOT NULL,
    var_type_ character varying(64),
    rev_ integer,
    time_ timestamp without time zone NOT NULL,
    bytearray_id_ character varying(64),
    double_ double precision,
    long_ bigint,
    text_ character varying(4000),
    text2_ character varying(4000)
);


ALTER TABLE act_hi_detail OWNER TO alfresco;

--
-- Name: act_hi_identitylink; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE act_hi_identitylink (
    id_ character varying(64) NOT NULL,
    group_id_ character varying(255),
    type_ character varying(255),
    user_id_ character varying(255),
    task_id_ character varying(64),
    proc_inst_id_ character varying(64)
);


ALTER TABLE act_hi_identitylink OWNER TO alfresco;

--
-- Name: act_hi_procinst; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE act_hi_procinst (
    id_ character varying(64) NOT NULL,
    proc_inst_id_ character varying(64) NOT NULL,
    business_key_ character varying(255),
    proc_def_id_ character varying(64) NOT NULL,
    start_time_ timestamp without time zone NOT NULL,
    end_time_ timestamp without time zone,
    duration_ bigint,
    start_user_id_ character varying(255),
    start_act_id_ character varying(255),
    end_act_id_ character varying(255),
    super_process_instance_id_ character varying(64),
    delete_reason_ character varying(4000),
    tenant_id_ character varying(255) DEFAULT ''::character varying,
    name_ character varying(255)
);


ALTER TABLE act_hi_procinst OWNER TO alfresco;

--
-- Name: act_hi_taskinst; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE act_hi_taskinst (
    id_ character varying(64) NOT NULL,
    proc_def_id_ character varying(64),
    task_def_key_ character varying(255),
    proc_inst_id_ character varying(64),
    execution_id_ character varying(64),
    name_ character varying(255),
    parent_task_id_ character varying(64),
    description_ character varying(4000),
    owner_ character varying(255),
    assignee_ character varying(255),
    start_time_ timestamp without time zone NOT NULL,
    claim_time_ timestamp without time zone,
    end_time_ timestamp without time zone,
    duration_ bigint,
    delete_reason_ character varying(4000),
    priority_ integer,
    due_date_ timestamp without time zone,
    form_key_ character varying(255),
    category_ character varying(255),
    tenant_id_ character varying(255) DEFAULT ''::character varying
);


ALTER TABLE act_hi_taskinst OWNER TO alfresco;

--
-- Name: act_hi_varinst; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE act_hi_varinst (
    id_ character varying(64) NOT NULL,
    proc_inst_id_ character varying(64),
    execution_id_ character varying(64),
    task_id_ character varying(64),
    name_ character varying(255) NOT NULL,
    var_type_ character varying(100),
    rev_ integer,
    bytearray_id_ character varying(64),
    double_ double precision,
    long_ bigint,
    text_ character varying(4000),
    text2_ character varying(4000),
    create_time_ timestamp without time zone,
    last_updated_time_ timestamp without time zone
);


ALTER TABLE act_hi_varinst OWNER TO alfresco;

--
-- Name: act_id_group; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE act_id_group (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    name_ character varying(255),
    type_ character varying(255)
);


ALTER TABLE act_id_group OWNER TO alfresco;

--
-- Name: act_id_info; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE act_id_info (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    user_id_ character varying(64),
    type_ character varying(64),
    key_ character varying(255),
    value_ character varying(255),
    password_ bytea,
    parent_id_ character varying(255)
);


ALTER TABLE act_id_info OWNER TO alfresco;

--
-- Name: act_id_membership; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE act_id_membership (
    user_id_ character varying(64) NOT NULL,
    group_id_ character varying(64) NOT NULL
);


ALTER TABLE act_id_membership OWNER TO alfresco;

--
-- Name: act_id_user; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE act_id_user (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    first_ character varying(255),
    last_ character varying(255),
    email_ character varying(255),
    pwd_ character varying(255),
    picture_id_ character varying(64)
);


ALTER TABLE act_id_user OWNER TO alfresco;

--
-- Name: act_procdef_info; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE act_procdef_info (
    id_ character varying(64) NOT NULL,
    proc_def_id_ character varying(64) NOT NULL,
    rev_ integer,
    info_json_id_ character varying(64)
);


ALTER TABLE act_procdef_info OWNER TO alfresco;

--
-- Name: act_re_deployment; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE act_re_deployment (
    id_ character varying(64) NOT NULL,
    name_ character varying(255),
    category_ character varying(255),
    tenant_id_ character varying(255) DEFAULT ''::character varying,
    deploy_time_ timestamp without time zone
);


ALTER TABLE act_re_deployment OWNER TO alfresco;

--
-- Name: act_re_model; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE act_re_model (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    name_ character varying(255),
    key_ character varying(255),
    category_ character varying(255),
    create_time_ timestamp without time zone,
    last_update_time_ timestamp without time zone,
    version_ integer,
    meta_info_ character varying(4000),
    deployment_id_ character varying(64),
    editor_source_value_id_ character varying(64),
    editor_source_extra_value_id_ character varying(64),
    tenant_id_ character varying(255) DEFAULT ''::character varying
);


ALTER TABLE act_re_model OWNER TO alfresco;

--
-- Name: act_re_procdef; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE act_re_procdef (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    category_ character varying(255),
    name_ character varying(255),
    key_ character varying(255) NOT NULL,
    version_ integer NOT NULL,
    deployment_id_ character varying(64),
    resource_name_ character varying(4000),
    dgrm_resource_name_ character varying(4000),
    description_ character varying(4000),
    has_start_form_key_ boolean,
    has_graphical_notation_ boolean,
    suspension_state_ integer,
    tenant_id_ character varying(255) DEFAULT ''::character varying
);


ALTER TABLE act_re_procdef OWNER TO alfresco;

--
-- Name: act_ru_event_subscr; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE act_ru_event_subscr (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    event_type_ character varying(255) NOT NULL,
    event_name_ character varying(255),
    execution_id_ character varying(64),
    proc_inst_id_ character varying(64),
    activity_id_ character varying(64),
    configuration_ character varying(255),
    created_ timestamp without time zone NOT NULL,
    proc_def_id_ character varying(64),
    tenant_id_ character varying(255) DEFAULT ''::character varying
);


ALTER TABLE act_ru_event_subscr OWNER TO alfresco;

--
-- Name: act_ru_execution; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE act_ru_execution (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    proc_inst_id_ character varying(64),
    business_key_ character varying(255),
    parent_id_ character varying(64),
    proc_def_id_ character varying(64),
    super_exec_ character varying(64),
    act_id_ character varying(255),
    is_active_ boolean,
    is_concurrent_ boolean,
    is_scope_ boolean,
    is_event_scope_ boolean,
    suspension_state_ integer,
    cached_ent_state_ integer,
    tenant_id_ character varying(255) DEFAULT ''::character varying,
    name_ character varying(255),
    lock_time_ timestamp without time zone
);


ALTER TABLE act_ru_execution OWNER TO alfresco;

--
-- Name: act_ru_identitylink; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE act_ru_identitylink (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    group_id_ character varying(255),
    type_ character varying(255),
    user_id_ character varying(255),
    task_id_ character varying(64),
    proc_inst_id_ character varying(64),
    proc_def_id_ character varying(64)
);


ALTER TABLE act_ru_identitylink OWNER TO alfresco;

--
-- Name: act_ru_job; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE act_ru_job (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    type_ character varying(255) NOT NULL,
    lock_exp_time_ timestamp without time zone,
    lock_owner_ character varying(255),
    exclusive_ boolean,
    execution_id_ character varying(64),
    process_instance_id_ character varying(64),
    proc_def_id_ character varying(64),
    retries_ integer,
    exception_stack_id_ character varying(64),
    exception_msg_ character varying(4000),
    duedate_ timestamp without time zone,
    repeat_ character varying(255),
    handler_type_ character varying(255),
    handler_cfg_ character varying(4000),
    tenant_id_ character varying(255) DEFAULT ''::character varying
);


ALTER TABLE act_ru_job OWNER TO alfresco;

--
-- Name: act_ru_task; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE act_ru_task (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    execution_id_ character varying(64),
    proc_inst_id_ character varying(64),
    proc_def_id_ character varying(64),
    name_ character varying(255),
    parent_task_id_ character varying(64),
    description_ character varying(4000),
    task_def_key_ character varying(255),
    owner_ character varying(255),
    assignee_ character varying(255),
    delegation_ character varying(64),
    priority_ integer,
    create_time_ timestamp without time zone,
    due_date_ timestamp without time zone,
    category_ character varying(255),
    suspension_state_ integer,
    tenant_id_ character varying(255) DEFAULT ''::character varying,
    form_key_ character varying(255)
);


ALTER TABLE act_ru_task OWNER TO alfresco;

--
-- Name: act_ru_variable; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE act_ru_variable (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    type_ character varying(255) NOT NULL,
    name_ character varying(255) NOT NULL,
    execution_id_ character varying(64),
    proc_inst_id_ character varying(64),
    task_id_ character varying(64),
    bytearray_id_ character varying(64),
    double_ double precision,
    long_ bigint,
    text_ character varying(4000),
    text2_ character varying(4000)
);


ALTER TABLE act_ru_variable OWNER TO alfresco;

--
-- Name: alf_access_control_entry; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE alf_access_control_entry (
    id bigint NOT NULL,
    version bigint NOT NULL,
    permission_id bigint NOT NULL,
    authority_id bigint NOT NULL,
    allowed boolean NOT NULL,
    applies integer NOT NULL,
    context_id bigint
);


ALTER TABLE alf_access_control_entry OWNER TO alfresco;

--
-- Name: alf_access_control_entry_seq; Type: SEQUENCE; Schema: public; Owner: alfresco
--

CREATE SEQUENCE alf_access_control_entry_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE alf_access_control_entry_seq OWNER TO alfresco;

--
-- Name: alf_access_control_list; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE alf_access_control_list (
    id bigint NOT NULL,
    version bigint NOT NULL,
    acl_id character varying(36) NOT NULL,
    latest boolean NOT NULL,
    acl_version bigint NOT NULL,
    inherits boolean NOT NULL,
    inherits_from bigint,
    type integer NOT NULL,
    inherited_acl bigint,
    is_versioned boolean NOT NULL,
    requires_version boolean NOT NULL,
    acl_change_set bigint
);


ALTER TABLE alf_access_control_list OWNER TO alfresco;

--
-- Name: alf_access_control_list_seq; Type: SEQUENCE; Schema: public; Owner: alfresco
--

CREATE SEQUENCE alf_access_control_list_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE alf_access_control_list_seq OWNER TO alfresco;

--
-- Name: alf_ace_context; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE alf_ace_context (
    id bigint NOT NULL,
    version bigint NOT NULL,
    class_context character varying(1024),
    property_context character varying(1024),
    kvp_context character varying(1024)
);


ALTER TABLE alf_ace_context OWNER TO alfresco;

--
-- Name: alf_ace_context_seq; Type: SEQUENCE; Schema: public; Owner: alfresco
--

CREATE SEQUENCE alf_ace_context_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE alf_ace_context_seq OWNER TO alfresco;

--
-- Name: alf_acl_change_set; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE alf_acl_change_set (
    id bigint NOT NULL,
    commit_time_ms bigint
);


ALTER TABLE alf_acl_change_set OWNER TO alfresco;

--
-- Name: alf_acl_change_set_seq; Type: SEQUENCE; Schema: public; Owner: alfresco
--

CREATE SEQUENCE alf_acl_change_set_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE alf_acl_change_set_seq OWNER TO alfresco;

--
-- Name: alf_acl_member; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE alf_acl_member (
    id bigint NOT NULL,
    version bigint NOT NULL,
    acl_id bigint NOT NULL,
    ace_id bigint NOT NULL,
    pos integer NOT NULL
);


ALTER TABLE alf_acl_member OWNER TO alfresco;

--
-- Name: alf_acl_member_seq; Type: SEQUENCE; Schema: public; Owner: alfresco
--

CREATE SEQUENCE alf_acl_member_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE alf_acl_member_seq OWNER TO alfresco;

--
-- Name: alf_activity_feed; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE alf_activity_feed (
    id bigint NOT NULL,
    post_id bigint,
    post_date timestamp without time zone NOT NULL,
    activity_summary character varying(1024),
    feed_user_id character varying(255),
    activity_type character varying(255) NOT NULL,
    site_network character varying(255),
    app_tool character varying(36),
    post_user_id character varying(255) NOT NULL,
    feed_date timestamp without time zone NOT NULL
);


ALTER TABLE alf_activity_feed OWNER TO alfresco;

--
-- Name: alf_activity_feed_control; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE alf_activity_feed_control (
    id bigint NOT NULL,
    feed_user_id character varying(255) NOT NULL,
    site_network character varying(255),
    app_tool character varying(36),
    last_modified timestamp without time zone NOT NULL
);


ALTER TABLE alf_activity_feed_control OWNER TO alfresco;

--
-- Name: alf_activity_feed_control_seq; Type: SEQUENCE; Schema: public; Owner: alfresco
--

CREATE SEQUENCE alf_activity_feed_control_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE alf_activity_feed_control_seq OWNER TO alfresco;

--
-- Name: alf_activity_feed_seq; Type: SEQUENCE; Schema: public; Owner: alfresco
--

CREATE SEQUENCE alf_activity_feed_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE alf_activity_feed_seq OWNER TO alfresco;

--
-- Name: alf_activity_post; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE alf_activity_post (
    sequence_id bigint NOT NULL,
    post_date timestamp without time zone NOT NULL,
    status character varying(10) NOT NULL,
    activity_data character varying(1024) NOT NULL,
    post_user_id character varying(255) NOT NULL,
    job_task_node integer NOT NULL,
    site_network character varying(255),
    app_tool character varying(36),
    activity_type character varying(255) NOT NULL,
    last_modified timestamp without time zone NOT NULL
);


ALTER TABLE alf_activity_post OWNER TO alfresco;

--
-- Name: alf_activity_post_seq; Type: SEQUENCE; Schema: public; Owner: alfresco
--

CREATE SEQUENCE alf_activity_post_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE alf_activity_post_seq OWNER TO alfresco;

--
-- Name: alf_applied_patch; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE alf_applied_patch (
    id character varying(64) NOT NULL,
    description character varying(1024),
    fixes_from_schema integer,
    fixes_to_schema integer,
    applied_to_schema integer,
    target_schema integer,
    applied_on_date timestamp without time zone,
    applied_to_server character varying(64),
    was_executed boolean,
    succeeded boolean,
    report character varying(1024)
);


ALTER TABLE alf_applied_patch OWNER TO alfresco;

--
-- Name: alf_audit_app; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE alf_audit_app (
    id bigint NOT NULL,
    version integer NOT NULL,
    app_name_id bigint NOT NULL,
    audit_model_id bigint NOT NULL,
    disabled_paths_id bigint NOT NULL
);


ALTER TABLE alf_audit_app OWNER TO alfresco;

--
-- Name: alf_audit_app_seq; Type: SEQUENCE; Schema: public; Owner: alfresco
--

CREATE SEQUENCE alf_audit_app_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE alf_audit_app_seq OWNER TO alfresco;

--
-- Name: alf_audit_entry; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE alf_audit_entry (
    id bigint NOT NULL,
    audit_app_id bigint NOT NULL,
    audit_time bigint NOT NULL,
    audit_user_id bigint,
    audit_values_id bigint
);


ALTER TABLE alf_audit_entry OWNER TO alfresco;

--
-- Name: alf_audit_entry_seq; Type: SEQUENCE; Schema: public; Owner: alfresco
--

CREATE SEQUENCE alf_audit_entry_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE alf_audit_entry_seq OWNER TO alfresco;

--
-- Name: alf_audit_model; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE alf_audit_model (
    id bigint NOT NULL,
    content_data_id bigint NOT NULL,
    content_crc bigint NOT NULL
);


ALTER TABLE alf_audit_model OWNER TO alfresco;

--
-- Name: alf_audit_model_seq; Type: SEQUENCE; Schema: public; Owner: alfresco
--

CREATE SEQUENCE alf_audit_model_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE alf_audit_model_seq OWNER TO alfresco;

--
-- Name: alf_auth_status; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE alf_auth_status (
    id bigint NOT NULL,
    username character varying(100) NOT NULL,
    deleted boolean NOT NULL,
    authorized boolean NOT NULL,
    checksum bytea NOT NULL,
    authaction character varying(10) NOT NULL
);


ALTER TABLE alf_auth_status OWNER TO alfresco;

--
-- Name: alf_auth_status_seq; Type: SEQUENCE; Schema: public; Owner: alfresco
--

CREATE SEQUENCE alf_auth_status_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE alf_auth_status_seq OWNER TO alfresco;

--
-- Name: alf_authority; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE alf_authority (
    id bigint NOT NULL,
    version bigint NOT NULL,
    authority character varying(100),
    crc bigint
);


ALTER TABLE alf_authority OWNER TO alfresco;

--
-- Name: alf_authority_alias; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE alf_authority_alias (
    id bigint NOT NULL,
    version bigint NOT NULL,
    auth_id bigint NOT NULL,
    alias_id bigint NOT NULL
);


ALTER TABLE alf_authority_alias OWNER TO alfresco;

--
-- Name: alf_authority_alias_seq; Type: SEQUENCE; Schema: public; Owner: alfresco
--

CREATE SEQUENCE alf_authority_alias_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE alf_authority_alias_seq OWNER TO alfresco;

--
-- Name: alf_authority_seq; Type: SEQUENCE; Schema: public; Owner: alfresco
--

CREATE SEQUENCE alf_authority_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE alf_authority_seq OWNER TO alfresco;

--
-- Name: alf_child_assoc; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE alf_child_assoc (
    id bigint NOT NULL,
    version bigint NOT NULL,
    parent_node_id bigint NOT NULL,
    type_qname_id bigint NOT NULL,
    child_node_name_crc bigint NOT NULL,
    child_node_name character varying(50) NOT NULL,
    child_node_id bigint NOT NULL,
    qname_ns_id bigint NOT NULL,
    qname_localname character varying(255) NOT NULL,
    qname_crc bigint NOT NULL,
    is_primary boolean,
    assoc_index integer
);


ALTER TABLE alf_child_assoc OWNER TO alfresco;

--
-- Name: alf_child_assoc_seq; Type: SEQUENCE; Schema: public; Owner: alfresco
--

CREATE SEQUENCE alf_child_assoc_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE alf_child_assoc_seq OWNER TO alfresco;

--
-- Name: alf_content_data; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE alf_content_data (
    id bigint NOT NULL,
    version bigint NOT NULL,
    content_url_id bigint,
    content_mimetype_id bigint,
    content_encoding_id bigint,
    content_locale_id bigint
);


ALTER TABLE alf_content_data OWNER TO alfresco;

--
-- Name: alf_content_data_seq; Type: SEQUENCE; Schema: public; Owner: alfresco
--

CREATE SEQUENCE alf_content_data_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE alf_content_data_seq OWNER TO alfresco;

--
-- Name: alf_content_url; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE alf_content_url (
    id bigint NOT NULL,
    content_url character varying(255) NOT NULL,
    content_url_short character varying(12) NOT NULL,
    content_url_crc bigint NOT NULL,
    content_size bigint NOT NULL,
    orphan_time bigint
);


ALTER TABLE alf_content_url OWNER TO alfresco;

--
-- Name: alf_content_url_enc_seq; Type: SEQUENCE; Schema: public; Owner: alfresco
--

CREATE SEQUENCE alf_content_url_enc_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE alf_content_url_enc_seq OWNER TO alfresco;

--
-- Name: alf_content_url_encryption; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE alf_content_url_encryption (
    id bigint NOT NULL,
    content_url_id bigint NOT NULL,
    algorithm character varying(10) NOT NULL,
    key_size integer NOT NULL,
    encrypted_key bytea NOT NULL,
    master_keystore_id character varying(20) NOT NULL,
    master_key_alias character varying(15) NOT NULL,
    unencrypted_file_size bigint
);


ALTER TABLE alf_content_url_encryption OWNER TO alfresco;

--
-- Name: alf_content_url_seq; Type: SEQUENCE; Schema: public; Owner: alfresco
--

CREATE SEQUENCE alf_content_url_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE alf_content_url_seq OWNER TO alfresco;

--
-- Name: alf_encoding; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE alf_encoding (
    id bigint NOT NULL,
    version bigint NOT NULL,
    encoding_str character varying(100) NOT NULL
);


ALTER TABLE alf_encoding OWNER TO alfresco;

--
-- Name: alf_encoding_seq; Type: SEQUENCE; Schema: public; Owner: alfresco
--

CREATE SEQUENCE alf_encoding_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE alf_encoding_seq OWNER TO alfresco;

--
-- Name: alf_locale; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE alf_locale (
    id bigint NOT NULL,
    version bigint NOT NULL,
    locale_str character varying(20) NOT NULL
);


ALTER TABLE alf_locale OWNER TO alfresco;

--
-- Name: alf_locale_seq; Type: SEQUENCE; Schema: public; Owner: alfresco
--

CREATE SEQUENCE alf_locale_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE alf_locale_seq OWNER TO alfresco;

--
-- Name: alf_lock; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE alf_lock (
    id bigint NOT NULL,
    version bigint NOT NULL,
    shared_resource_id bigint NOT NULL,
    excl_resource_id bigint NOT NULL,
    lock_token character varying(36) NOT NULL,
    start_time bigint NOT NULL,
    expiry_time bigint NOT NULL
);


ALTER TABLE alf_lock OWNER TO alfresco;

--
-- Name: alf_lock_resource; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE alf_lock_resource (
    id bigint NOT NULL,
    version bigint NOT NULL,
    qname_ns_id bigint NOT NULL,
    qname_localname character varying(255) NOT NULL
);


ALTER TABLE alf_lock_resource OWNER TO alfresco;

--
-- Name: alf_lock_resource_seq; Type: SEQUENCE; Schema: public; Owner: alfresco
--

CREATE SEQUENCE alf_lock_resource_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE alf_lock_resource_seq OWNER TO alfresco;

--
-- Name: alf_lock_seq; Type: SEQUENCE; Schema: public; Owner: alfresco
--

CREATE SEQUENCE alf_lock_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE alf_lock_seq OWNER TO alfresco;

--
-- Name: alf_mimetype; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE alf_mimetype (
    id bigint NOT NULL,
    version bigint NOT NULL,
    mimetype_str character varying(100) NOT NULL
);


ALTER TABLE alf_mimetype OWNER TO alfresco;

--
-- Name: alf_mimetype_seq; Type: SEQUENCE; Schema: public; Owner: alfresco
--

CREATE SEQUENCE alf_mimetype_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE alf_mimetype_seq OWNER TO alfresco;

--
-- Name: alf_namespace; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE alf_namespace (
    id bigint NOT NULL,
    version bigint NOT NULL,
    uri character varying(100) NOT NULL
);


ALTER TABLE alf_namespace OWNER TO alfresco;

--
-- Name: alf_namespace_seq; Type: SEQUENCE; Schema: public; Owner: alfresco
--

CREATE SEQUENCE alf_namespace_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE alf_namespace_seq OWNER TO alfresco;

--
-- Name: alf_node; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE alf_node (
    id bigint NOT NULL,
    version bigint NOT NULL,
    store_id bigint NOT NULL,
    uuid character varying(36) NOT NULL,
    transaction_id bigint NOT NULL,
    type_qname_id bigint NOT NULL,
    locale_id bigint NOT NULL,
    acl_id bigint,
    audit_creator character varying(255),
    audit_created character varying(30),
    audit_modifier character varying(255),
    audit_modified character varying(30),
    audit_accessed character varying(30)
);


ALTER TABLE alf_node OWNER TO alfresco;

--
-- Name: alf_node_aspects; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE alf_node_aspects (
    node_id bigint NOT NULL,
    qname_id bigint NOT NULL
);


ALTER TABLE alf_node_aspects OWNER TO alfresco;

--
-- Name: alf_node_assoc; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE alf_node_assoc (
    id bigint NOT NULL,
    version bigint NOT NULL,
    source_node_id bigint NOT NULL,
    target_node_id bigint NOT NULL,
    type_qname_id bigint NOT NULL,
    assoc_index bigint NOT NULL
);


ALTER TABLE alf_node_assoc OWNER TO alfresco;

--
-- Name: alf_node_assoc_seq; Type: SEQUENCE; Schema: public; Owner: alfresco
--

CREATE SEQUENCE alf_node_assoc_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE alf_node_assoc_seq OWNER TO alfresco;

--
-- Name: alf_node_properties; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE alf_node_properties (
    node_id bigint NOT NULL,
    actual_type_n integer NOT NULL,
    persisted_type_n integer NOT NULL,
    boolean_value boolean,
    long_value bigint,
    float_value real,
    double_value double precision,
    string_value character varying(1024),
    serializable_value bytea,
    qname_id bigint NOT NULL,
    list_index integer NOT NULL,
    locale_id bigint NOT NULL
);


ALTER TABLE alf_node_properties OWNER TO alfresco;

--
-- Name: alf_node_seq; Type: SEQUENCE; Schema: public; Owner: alfresco
--

CREATE SEQUENCE alf_node_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE alf_node_seq OWNER TO alfresco;

--
-- Name: alf_permission; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE alf_permission (
    id bigint NOT NULL,
    version bigint NOT NULL,
    type_qname_id bigint NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE alf_permission OWNER TO alfresco;

--
-- Name: alf_permission_seq; Type: SEQUENCE; Schema: public; Owner: alfresco
--

CREATE SEQUENCE alf_permission_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE alf_permission_seq OWNER TO alfresco;

--
-- Name: alf_prop_class; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE alf_prop_class (
    id bigint NOT NULL,
    java_class_name character varying(255) NOT NULL,
    java_class_name_short character varying(32) NOT NULL,
    java_class_name_crc bigint NOT NULL
);


ALTER TABLE alf_prop_class OWNER TO alfresco;

--
-- Name: alf_prop_class_seq; Type: SEQUENCE; Schema: public; Owner: alfresco
--

CREATE SEQUENCE alf_prop_class_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE alf_prop_class_seq OWNER TO alfresco;

--
-- Name: alf_prop_date_value; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE alf_prop_date_value (
    date_value bigint NOT NULL,
    full_year integer NOT NULL,
    half_of_year smallint NOT NULL,
    quarter_of_year smallint NOT NULL,
    month_of_year smallint NOT NULL,
    week_of_year smallint NOT NULL,
    week_of_month smallint NOT NULL,
    day_of_year integer NOT NULL,
    day_of_month smallint NOT NULL,
    day_of_week smallint NOT NULL
);


ALTER TABLE alf_prop_date_value OWNER TO alfresco;

--
-- Name: alf_prop_double_value; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE alf_prop_double_value (
    id bigint NOT NULL,
    double_value double precision NOT NULL
);


ALTER TABLE alf_prop_double_value OWNER TO alfresco;

--
-- Name: alf_prop_double_value_seq; Type: SEQUENCE; Schema: public; Owner: alfresco
--

CREATE SEQUENCE alf_prop_double_value_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE alf_prop_double_value_seq OWNER TO alfresco;

--
-- Name: alf_prop_link; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE alf_prop_link (
    root_prop_id bigint NOT NULL,
    prop_index bigint NOT NULL,
    contained_in bigint NOT NULL,
    key_prop_id bigint NOT NULL,
    value_prop_id bigint NOT NULL
);


ALTER TABLE alf_prop_link OWNER TO alfresco;

--
-- Name: alf_prop_root; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE alf_prop_root (
    id bigint NOT NULL,
    version integer NOT NULL
);


ALTER TABLE alf_prop_root OWNER TO alfresco;

--
-- Name: alf_prop_root_seq; Type: SEQUENCE; Schema: public; Owner: alfresco
--

CREATE SEQUENCE alf_prop_root_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE alf_prop_root_seq OWNER TO alfresco;

--
-- Name: alf_prop_serializable_value; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE alf_prop_serializable_value (
    id bigint NOT NULL,
    serializable_value bytea NOT NULL
);


ALTER TABLE alf_prop_serializable_value OWNER TO alfresco;

--
-- Name: alf_prop_serializable_value_seq; Type: SEQUENCE; Schema: public; Owner: alfresco
--

CREATE SEQUENCE alf_prop_serializable_value_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE alf_prop_serializable_value_seq OWNER TO alfresco;

--
-- Name: alf_prop_string_value; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE alf_prop_string_value (
    id bigint NOT NULL,
    string_value character varying(1024) NOT NULL,
    string_end_lower character varying(16) NOT NULL,
    string_crc bigint NOT NULL
);


ALTER TABLE alf_prop_string_value OWNER TO alfresco;

--
-- Name: alf_prop_string_value_seq; Type: SEQUENCE; Schema: public; Owner: alfresco
--

CREATE SEQUENCE alf_prop_string_value_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE alf_prop_string_value_seq OWNER TO alfresco;

--
-- Name: alf_prop_unique_ctx; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE alf_prop_unique_ctx (
    id bigint NOT NULL,
    version integer NOT NULL,
    value1_prop_id bigint NOT NULL,
    value2_prop_id bigint NOT NULL,
    value3_prop_id bigint NOT NULL,
    prop1_id bigint
);


ALTER TABLE alf_prop_unique_ctx OWNER TO alfresco;

--
-- Name: alf_prop_unique_ctx_seq; Type: SEQUENCE; Schema: public; Owner: alfresco
--

CREATE SEQUENCE alf_prop_unique_ctx_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE alf_prop_unique_ctx_seq OWNER TO alfresco;

--
-- Name: alf_prop_value; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE alf_prop_value (
    id bigint NOT NULL,
    actual_type_id bigint NOT NULL,
    persisted_type smallint NOT NULL,
    long_value bigint NOT NULL
);


ALTER TABLE alf_prop_value OWNER TO alfresco;

--
-- Name: alf_prop_value_seq; Type: SEQUENCE; Schema: public; Owner: alfresco
--

CREATE SEQUENCE alf_prop_value_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE alf_prop_value_seq OWNER TO alfresco;

--
-- Name: alf_qname; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE alf_qname (
    id bigint NOT NULL,
    version bigint NOT NULL,
    ns_id bigint NOT NULL,
    local_name character varying(200) NOT NULL
);


ALTER TABLE alf_qname OWNER TO alfresco;

--
-- Name: alf_qname_seq; Type: SEQUENCE; Schema: public; Owner: alfresco
--

CREATE SEQUENCE alf_qname_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE alf_qname_seq OWNER TO alfresco;

--
-- Name: alf_server; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE alf_server (
    id bigint NOT NULL,
    version bigint NOT NULL,
    ip_address character varying(39) NOT NULL
);


ALTER TABLE alf_server OWNER TO alfresco;

--
-- Name: alf_server_seq; Type: SEQUENCE; Schema: public; Owner: alfresco
--

CREATE SEQUENCE alf_server_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE alf_server_seq OWNER TO alfresco;

--
-- Name: alf_store; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE alf_store (
    id bigint NOT NULL,
    version bigint NOT NULL,
    protocol character varying(50) NOT NULL,
    identifier character varying(100) NOT NULL,
    root_node_id bigint
);


ALTER TABLE alf_store OWNER TO alfresco;

--
-- Name: alf_store_seq; Type: SEQUENCE; Schema: public; Owner: alfresco
--

CREATE SEQUENCE alf_store_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE alf_store_seq OWNER TO alfresco;

--
-- Name: alf_subscriptions; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE alf_subscriptions (
    user_node_id bigint NOT NULL,
    node_id bigint NOT NULL
);


ALTER TABLE alf_subscriptions OWNER TO alfresco;

--
-- Name: alf_tenant; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE alf_tenant (
    tenant_domain character varying(75) NOT NULL,
    version bigint NOT NULL,
    enabled boolean NOT NULL,
    tenant_name character varying(75),
    content_root character varying(255),
    db_url character varying(255)
);


ALTER TABLE alf_tenant OWNER TO alfresco;

--
-- Name: alf_transaction; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE alf_transaction (
    id bigint NOT NULL,
    version bigint NOT NULL,
    server_id bigint,
    change_txn_id character varying(56) NOT NULL,
    commit_time_ms bigint
);


ALTER TABLE alf_transaction OWNER TO alfresco;

--
-- Name: alf_transaction_seq; Type: SEQUENCE; Schema: public; Owner: alfresco
--

CREATE SEQUENCE alf_transaction_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE alf_transaction_seq OWNER TO alfresco;

--
-- Name: alf_usage_delta; Type: TABLE; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE TABLE alf_usage_delta (
    id bigint NOT NULL,
    version bigint NOT NULL,
    node_id bigint NOT NULL,
    delta_size bigint NOT NULL
);


ALTER TABLE alf_usage_delta OWNER TO alfresco;

--
-- Name: alf_usage_delta_seq; Type: SEQUENCE; Schema: public; Owner: alfresco
--

CREATE SEQUENCE alf_usage_delta_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE alf_usage_delta_seq OWNER TO alfresco;

--
-- Name: log_nr_; Type: DEFAULT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY act_evt_log ALTER COLUMN log_nr_ SET DEFAULT nextval('act_evt_log_log_nr__seq'::regclass);


--
-- Data for Name: act_evt_log; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY act_evt_log (log_nr_, type_, proc_def_id_, proc_inst_id_, execution_id_, task_id_, time_stamp_, user_id_, data_, lock_owner_, lock_time_, is_processed_) FROM stdin;
\.


--
-- Name: act_evt_log_log_nr__seq; Type: SEQUENCE SET; Schema: public; Owner: alfresco
--

SELECT pg_catalog.setval('act_evt_log_log_nr__seq', 1, false);


--
-- Data for Name: act_ge_bytearray; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY act_ge_bytearray (id_, rev_, name_, deployment_id_, bytes_, generated_) FROM stdin;
2	1	f81e9ad4-2296-4cc3-8cf4-abd116e755f2bpmn20.xml	1	\\x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d3822203f3e0d0a0d0a3c646566696e6974696f6e7320786d6c6e733d22687474703a2f2f7777772e6f6d672e6f72672f737065632f42504d4e2f32303130303532342f4d4f44454c220d0a202020786d6c6e733a7873693d22687474703a2f2f7777772e77332e6f72672f323030312f584d4c536368656d612d696e7374616e63652220786d6c6e733a61637469766974693d22687474703a2f2f61637469766974692e6f72672f62706d6e220d0a202020786d6c6e733a62706d6e64693d22687474703a2f2f7777772e6f6d672e6f72672f737065632f42504d4e2f32303130303532342f44492220786d6c6e733a6f6d6764633d22687474703a2f2f7777772e6f6d672e6f72672f737065632f44442f32303130303532342f4443220d0a202020786d6c6e733a6f6d6764693d22687474703a2f2f7777772e6f6d672e6f72672f737065632f44442f32303130303532342f44492220747970654c616e67756167653d22687474703a2f2f7777772e77332e6f72672f323030312f584d4c536368656d61220d0a20202065787072657373696f6e4c616e67756167653d22687474703a2f2f7777772e77332e6f72672f313939392f585061746822207461726765744e616d6573706163653d22687474703a2f2f616c66726573636f2e6f7267223e0d0a0d0a202020203c70726f6365737320697345786563757461626c653d2274727565222069643d2261637469766974694164686f6322206e616d653d224164686f632041637469766974692050726f63657373223e0d0a0d0a20202020202020203c73746172744576656e742069643d227374617274220d0a20202020202020202020202061637469766974693a666f726d4b65793d2277663a7375626d69744164686f635461736b22202f3e0d0a20202020202020203c73657175656e6365466c6f772069643d27666c6f773127200d0a202020202020202020202020736f757263655265663d277374617274270d0a2020202020202020202020207461726765745265663d276164686f635461736b27202f3e0d0a0d0a20202020202020203c757365725461736b2069643d226164686f635461736b22206e616d653d224164686f63205461736b220d0a20202020202020202020202061637469766974693a666f726d4b65793d2277663a6164686f635461736b223e0d0a20202020202020202020203c657874656e73696f6e456c656d656e74733e0d0a2020202020202020202020202020203c61637469766974693a7461736b4c697374656e6572206576656e743d226372656174652220636c6173733d226f72672e616c66726573636f2e7265706f2e776f726b666c6f772e61637469766974692e7461736b6c697374656e65722e5363726970745461736b4c697374656e6572223e0d0a2020202020202020202020202020202020203c61637469766974693a6669656c64206e616d653d22736372697074223e0d0a2020202020202020202020202020202020202020203c61637469766974693a737472696e673e0d0a2020202020202020202020202020202020202020202069662028747970656f662062706d5f776f726b666c6f774475654461746520213d2027756e646566696e65642729207461736b2e64756544617465203d2062706d5f776f726b666c6f77447565446174650d0a2020202020202020202020202020202020202020202069662028747970656f662062706d5f776f726b666c6f775072696f7269747920213d2027756e646566696e65642729207461736b2e7072696f72697479203d2062706d5f776f726b666c6f775072696f726974793b0d0a2020202020202020202020202020202020202020203c2f61637469766974693a737472696e673e0d0a2020202020202020202020202020202020203c2f61637469766974693a6669656c643e0d0a2020202020202020202020202020203c2f61637469766974693a7461736b4c697374656e65723e0d0a20202020202020202020203c2f657874656e73696f6e456c656d656e74733e0d0a2020202020202020202020203c68756d616e506572666f726d65723e0d0a202020202020202020202020202020203c7265736f7572636541737369676e6d656e7445787072657373696f6e3e0d0a20202020202020202020202020202020202020203c666f726d616c45787072657373696f6e3e247b62706d5f61737369676e65652e70726f706572746965732e757365724e616d657d3c2f666f726d616c45787072657373696f6e3e0d0a202020202020202020202020202020203c2f7265736f7572636541737369676e6d656e7445787072657373696f6e3e0d0a2020202020202020202020203c2f68756d616e506572666f726d65723e0d0a20202020202020203c2f757365725461736b3e0d0a0d0a20202020202020203c73657175656e6365466c6f772069643d27666c6f773227200d0a2020202020202020736f757263655265663d276164686f635461736b270d0a2020202020202020202020207461726765745265663d277665726966795461736b446f6e6527202f3e0d0a0d0a20202020202020203c757365725461736b2069643d227665726966795461736b446f6e6522206e616d653d22566572696679204164686f63205461736b20436f6d706c657465642e220d0a20202020202020202020202061637469766974693a666f726d4b65793d2277663a636f6d706c657465644164686f635461736b22203e0d0a2020202020202020202020203c646f63756d656e746174696f6e3e0d0a2020202020202020202020202020202056657269667920746865207461736b2077617320636f6d706c657465642e0d0a2020202020202020202020203c2f646f63756d656e746174696f6e3e0d0a2020202020202020202020203c657874656e73696f6e456c656d656e74733e0d0a2020202020202020202020202020203c61637469766974693a7461736b4c697374656e6572206576656e743d226372656174652220636c6173733d226f72672e616c66726573636f2e7265706f2e776f726b666c6f772e61637469766974692e7461736b6c697374656e65722e5363726970745461736b4c697374656e6572223e0d0a2020202020202020202020202020202020203c61637469766974693a6669656c64206e616d653d22736372697074223e0d0a2020202020202020202020202020202020202020203c61637469766974693a737472696e673e0d0a20202020202020202020202020202020202020202020202069662028747970656f662062706d5f776f726b666c6f774475654461746520213d2027756e646566696e65642729207461736b2e64756544617465203d2062706d5f776f726b666c6f77447565446174650d0a20202020202020202020202020202020202020202020202069662028747970656f662062706d5f776f726b666c6f775072696f7269747920213d2027756e646566696e65642729207461736b2e7072696f72697479203d2062706d5f776f726b666c6f775072696f726974793b0d0a2020202020202020202020202020202020202020202020200d0a2020202020202020202020202020202020202020202020206966202877665f6e6f746966794d65290d0a0909092020202020202020202020207b0d0a090909202020202020202020202020202020766172206d61696c203d20616374696f6e732e63726561746528226d61696c22293b0d0a0909092020202020202020202020202020206d61696c2e706172616d65746572732e746f203d20696e69746961746f722e70726f706572746965732e656d61696c3b0d0a0909092020202020202020202020202020206d61696c2e706172616d65746572732e7375626a656374203d20224164686f63205461736b2022202b2062706d5f776f726b666c6f774465736372697074696f6e3b0d0a0909092020202020202020202020202020206d61696c2e706172616d65746572732e66726f6d203d2062706d5f61737369676e65652e70726f706572746965732e656d61696c3b0d0a0909092020202020202020202020202020206d61696c2e706172616d65746572732e74657874203d20224974277320646f6e65223b0d0a0909092020202020202020202020202020206d61696c2e657865637574652862706d5f7061636b616765293b0d0a0909092020202020202020202020207d0d0a2020202020202020202020202020202020202020203c2f61637469766974693a737472696e673e0d0a2020202020202020202020202020202020203c2f61637469766974693a6669656c643e0d0a2020202020202020202020202020203c2f61637469766974693a7461736b4c697374656e65723e0d0a20202020202020202020203c2f657874656e73696f6e456c656d656e74733e0d0a2020202020202020202020203c68756d616e506572666f726d65723e0d0a202020202020202020202020202020203c7265736f7572636541737369676e6d656e7445787072657373696f6e3e0d0a20202020202020202020202020202020202020203c666f726d616c45787072657373696f6e3e247b696e69746961746f722e6578697374732829203f20696e69746961746f722e70726f706572746965732e757365724e616d65203a202761646d696e277d3c2f666f726d616c45787072657373696f6e3e0d0a202020202020202020202020202020203c2f7265736f7572636541737369676e6d656e7445787072657373696f6e3e0d0a2020202020202020202020203c2f68756d616e506572666f726d65723e0d0a20202020202020203c2f757365725461736b3e0d0a0d0a20202020202020203c73657175656e6365466c6f772069643d27666c6f77332720736f757263655265663d277665726966795461736b446f6e65270d0a2020202020202020202020207461726765745265663d27746865456e6427202f3e0d0a0d0a20202020202020203c656e644576656e742069643d22746865456e6422202f3e0d0a0d0a2020203c2f70726f636573733e0d0a0d0a2020203c212d2d2047726170686963616c20726570726573656e7461696f6e206f66206469616772616d202d2d3e0d0a2020203c62706d6e64693a42504d4e4469616772616d2069643d2242504d4e4469616772616d5f61637469766974694164686f63223e0d0a2020202020203c62706d6e64693a42504d4e506c616e652062706d6e456c656d656e743d2261637469766974694164686f63222069643d2242504d4e506c616e655f61637469766974694164686f63223e0d0a2020202020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d227374617274220d0a20202020202020202020202069643d2242504d4e53686170655f7374617274223e0d0a2020202020202020202020203c6f6d6764633a426f756e6473206865696768743d223335222077696474683d2233352220783d2233302220793d22323030223e3c2f6f6d6764633a426f756e64733e0d0a2020202020202020203c2f62706d6e64693a42504d4e53686170653e0d0a2020202020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d226164686f635461736b220d0a20202020202020202020202069643d2242504d4e53686170655f6164686f635461736b223e0d0a2020202020202020202020203c6f6d6764633a426f756e6473206865696768743d223535222077696474683d223130352220783d22313330220d0a202020202020202020202020202020793d22313930223e3c2f6f6d6764633a426f756e64733e0d0a2020202020202020203c2f62706d6e64693a42504d4e53686170653e0d0a2020202020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d227665726966795461736b446f6e65220d0a20202020202020202020202069643d2242504d4e53686170655f7665726966795461736b446f6e65223e0d0a2020202020202020202020203c6f6d6764633a426f756e6473206865696768743d223535222077696474683d223130352220783d22323930220d0a202020202020202020202020202020793d22313930223e3c2f6f6d6764633a426f756e64733e0d0a2020202020202020203c2f62706d6e64693a42504d4e53686170653e0d0a2020202020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d22746865456e64220d0a20202020202020202020202069643d2242504d4e53686170655f746865456e64223e0d0a2020202020202020202020203c6f6d6764633a426f756e6473206865696768743d223335222077696474683d2233352220783d223435352220793d22323030223e3c2f6f6d6764633a426f756e64733e0d0a2020202020202020203c2f62706d6e64693a42504d4e53686170653e0d0a2020202020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22666c6f7731222069643d2242504d4e456467655f666c6f7731223e0d0a2020202020202020202020203c6f6d6764693a776179706f696e7420783d2236352220793d22323137223e3c2f6f6d6764693a776179706f696e743e0d0a2020202020202020202020203c6f6d6764693a776179706f696e7420783d223133302220793d22323137223e3c2f6f6d6764693a776179706f696e743e0d0a2020202020202020203c2f62706d6e64693a42504d4e456467653e0d0a2020202020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22666c6f7732222069643d2242504d4e456467655f666c6f7732223e0d0a2020202020202020202020203c6f6d6764693a776179706f696e7420783d223233352220793d22323137223e3c2f6f6d6764693a776179706f696e743e0d0a2020202020202020202020203c6f6d6764693a776179706f696e7420783d223239302220793d22323137223e3c2f6f6d6764693a776179706f696e743e0d0a2020202020202020203c2f62706d6e64693a42504d4e456467653e0d0a2020202020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22666c6f7733222069643d2242504d4e456467655f666c6f7733223e0d0a2020202020202020202020203c6f6d6764693a776179706f696e7420783d223339352220793d22323137223e3c2f6f6d6764693a776179706f696e743e0d0a2020202020202020202020203c6f6d6764693a776179706f696e7420783d223435352220793d22323137223e3c2f6f6d6764693a776179706f696e743e0d0a2020202020202020203c2f62706d6e64693a42504d4e456467653e0d0a2020202020203c2f62706d6e64693a42504d4e506c616e653e0d0a2020203c2f62706d6e64693a42504d4e4469616772616d3e0d0a0d0a3c2f646566696e6974696f6e733e	f
3	1	f81e9ad4-2296-4cc3-8cf4-abd116e755f2activitiAdhoc.png	1	\\x89504e470d0a1a0a0000000d49484452000001f4000000ff0806000000076624fd000010424944415478daeddd7b6c55759e007013c7b84613c7648c1ac7a8d98d31c61863c63889abf18fc91a93711da350c5a2a88088f511230aab0603125c34590c561c2741258a6b1c11243e7601798581083aac823a3a88882d486519655814d0b3e77bd2d39c5edadac7ededbdede793fc727b1fdc9673bff7fb3dbfc739e7b0c30000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000802a9724c9cf3efbecb397d7ae5dfbc3d2a54b93c58b176b55d0962c5992ac5cb9f2ebb4d58b3f4dfc013f2992e9aa55ab929d3b7726df7fffbd5645ada5a52559b162c5376972bd5afc69e20fe852f48c24d3aa4eaadfa73da68fc49f26fe802ec530a7c455dd2d4da807c49f26fe802ec57c99a455f50935117f9af803ca9250fffeb7edc967eb9e49362d9992b5f8391e93f02454f127fe801a49a87b7637251bffebc1e47f5e9fd0aec563f19ca427a18a3ff107d44042ddb6e9b5439269debedcb448d29350c59ff8036a21a17eb4ecdf3b4da8f19ca427a18a3ff107d44042ddb8f8a14e136a3c27e949a8e24ffc0d45d75e7bed2feaeaeaae493d9ab66569db96b6a4d0b6a76d4dfa9a3fa4af1d9dfe7cda90dd580f3df4d0cf1b1b1b1f9e3a75eafa071f7cb065fcf8f1fbafbbeebab68d3576ecd883f7de7befee2953a66c78f2c9277fffc0030ffca31093502554f1a789bffe347cf8f0dfa445fad5b40eed2b29e03fd50e44814fdba84b2eb9e4674362634d9b36edd2c99327ffb9bebefec7b490270b162c48de7ffffdec6c52070f1e4c72bb76ed4a3efef8e3e4adb7de4a1e7becb1245e9f16f86de9bf193b64365605126aac2aee2ca1c673929e842afec4df509016e25fa56d5d0f8b7867eda3e8b50fda8d75d75d779d3669d2a40da3478ffef1e5975fce0a764fecdfbf3f59bd7a7592f6d47f4c7bf33bc68c19f3af42b0ef09f5d3d54f749a50e339494f42157fe26f080caf4f6fed61b715e518319e3e7d7a12f56ad3a64dc9f6eddb937dfbf6b5d5a3e8847ef2c927c9fcf9f3b3d78d1c39b2a3c2fe66fa3ebf1c541b2bed5537dc7cf3cd079e7beeb964efdebd495fad5bb72e490bfafe71e3c62d18366cd831c2b1f7097557d3fbc9c6ff9e7ce87067fa583c27e949a8e24ffc0d56513f5ae7c7db8af0a851a392e79f7f3e2bd83d11b52d469cd3ce6bbba25e5757b73bbdbd64506cb0891327fefeb6db6e3bf8eebbef26e5f4edb7df268d8d8dfbd38ddf9c7e28272adfbd4ba8d1b6ac9f7b48428dc7243c0955fc89bf415ecc57158b6f4c03474fbc2f62eaf88d37de488a6bc2d2b6276d57d77c316f6868f8a1a77b3a3d316fdebc1feaebebbf493f9c7f52c27b9150bffb2ef9f44fb30f1dee4c1f8be7243d0955fc89bf413a67deae671e43ebc5755c7dd5d4d4944c9830a158d4f7a5bdf5dfd6ec307bf4ccfbb398e7162e5cf85d5ad49bf4d47b9650e34c5c9fac9ed5e91c663ce76c5d12aaf8137f8374cebcadd8ae5dbbb65f6a53ccb9c7fc7ab1a79efeee336b6a63c502b89833dfb0614352292fbcf042f38811235eb302be1b0935edf96cfff4ede483b7feadd3649ab7784dbc566f4942157fe26f90f4cc7f555c00173df3fe140be8a64d9bd6eef8f538c6bd9686da3f8805709576e79d7736d7d5d53528e59d27d49fea15e92d49a8e24ffc0d66698df87371cebc9cc3ec5dadf91a33664c71a1dc7fd4c4c68ae3cce3d0b472ac66efc59cc5c1b497febf35b5f753e184da9d5e5157bd25495042157fe2af56c549638aabd9fbba00ae27626178c922b9d3aa7e83c54963e2b8bc81f2c8238f6c8af911e5bce384dadb649a37495042157fe2af8687db17e545350e4dabb438495aa1a83f5ad51b2b4ee71a6774ebe94963cadc4bdf9916f4afcda577ffb0214d42157fe26fb08b91dbfc74ae71485925166c97dabc7973bbe3d3478d1af5f3aadd60b367cf9e1e731203edd65b6ffd4bfae1fdb3822ea14aa8e24f53d05be7ceafc98b69ac3c1f28c513cfa475ea7755bbc1e2422b8b162d1af0823e73e6ccd58379d83dfdbf2deece0e8b842aa18a3f6d2814f4eec464eb55d32ab2b2bd2b2fbdf4526d2c8e8baba6c5855606dadab56b37c4490306f13c50be77b7380d885f4ba812aaf8d3867241ef4e4c164f241317fe1ac0fa54eca12faeda8d1a97401d887989523b76ec88ebd46e1fec05bd7801808ef64e25540955fc6943a9a0771593c5eb995772757ba92fbef8a2dd31e955bb5163a141258ee9eb8ed85843a8a0b7eded158358429550c59f36440bfa2131597c3cbf6ada408813cd14ff96aadea8d5622816f4e2de690c3b49a812aaf8d38672412fc664f17e35d4a7aa2fe8d5d6431fea4d42adfe26fe34f157f9a6875e4373e82d2d2dcd436c0e3d6febe26a3ef931f8fd9550cf39e79c08c2ac6dd9b2a5d3d7e5af29fdb9dc2d7fefd2d6d7f7d343aacef88b76fae9a7b78bbf58e414f74f3df5d43e7fe671c291134e382139fcf0c3938b2fbeb8dfbf1b7ae895894973e83d74fffdf77fbd69d3a66a59e5be6a0815f47689b43fe730d7af5fdfae683ef5d453035ed0cb9d2415f4ea8dbfbcd5d7d7679f5114dfb83f67ce9cec7e3cded7f73ee28823b2f7fae69b6fb29e5c7f7f3714f4cac4a455ee3d14c7a1c785ddabe138f4aa3fad5e7982774d9c98a0b3b3e2f54742bde38e3bb24414e7418edbe1c387b73d175f9273cf3d3739eaa8a3929b6ebaa9c3823e7efcf8e4c8238fcc7a4073e7cecd9e8b330bde72cb2dd9bf8be7c68d1b9725d3786eebd6ad49faffcb92ec99679e99ac59b3a6474972c58a15c959679d95fdfbf89dcf3efb6cf6f8c2850b93b3cf3e3b7b3c7e6ff4c4e22c4ea5ef3363c68cece774675542ad82f8cb5b14f262011f316244763f8fa9969696e4faebafcfe2293edfabaeba2af9f2cb2fdb7dbef1999f7ffef9ed1e8bd7178bf285175e98ddc6e1b8f1bab88dfb175c7041d9be1b0a7a6562327d6e56351c871ebfbbf0f7ceaada8ddad8d8f8585c266ea03534346c4c37d42583b8a077d823eaef841abd95e38f3f3e39e9a493e2d0c02c214582ca7b315178e3b1575f7d352b981d15f4783c1f1e8df78ae7a298c7fd79f3e665c11e3f47518fe72ebbecb2ec7e14f2b88d21cd9e14f428e6efbcf34eb26ddbb6ecb9638f3d367b3c6ef361d1783e7e2e4deed1c38adb48c012eac0c75fb1c5ce577188fd94534ec9eee73b6579517defbdf792b88c73fc7ce9a597b6fb7c972e5d9a34373777399a143159dca19b34695276ffe9a79f2edb774341af4c4ca685bebe1ace143761c2846241bfba6a376afa879e78c30d370cc895d60ac7a0c7b9dcff9e7ea1ffe1b021aedc09f595575ec992d07df7dd97dd3fefbcf3b2fbf9efc97b3791c4a27535e41e3fc71c6567ff2e1e2b3ed7dba1f228d8f1f746b12e3e9ff7bca2871e3b0de9ce68d6abeb684efef1c71f9750ab20fe4a5b5ec457ad5a95dd9e7cf2c96dcf95f6b48b3195df2f0ea77716abf19a78df7cc721e6ee8f3beeb864cf9e3d65fb6e28e8155bb4fdcbe2b9dce392a6033c7fbeafeaaf0c9a06f45f972f5f3e6005fd89279e589feea9fde130ca9e502fbffcf20e179fe549aca7053dbf1f3d99d27f77f4d14797a5a0c7307d3c16a7242e4dd4b17d6298342f0c679c7146bbf7696868c8feb6189a9750abafa0e7c3ec575c7145761bf74b0b7a4773e01dc54957b13a79f2e4ec7e5c292b6ee35cdce5fc6e28e815edc9b7cda30fc4554167cf9e5d2ce8cf54fd069b3871e2b5f7dc73cf0f0371f8dadebd7b0fc4f5d0634f4c392f6f428d61c4e8515f79e5956d8fe50b91626e30eec790663eac980f9d77a7a0e7c3a3c521f7986b2f0eb9af5ebdba5743ee79228da1d7e2f331079a0fe5c7b06bb187577c5dbef86ad9b265126a9515f43cfef216f74b8b7d0c8de79ffd45175dd4ab821e73ef3192934fd36cdcb8b1dfbe1b87557821e9502be8c561f7c831953c7cada9a9291b19c87f7f1aa3e7d6c4464b37d48e1806abb4a953a7be5fd58b0c6a38a1ce9a352b4b2e7135bde2429f3ce9c4e2b598bf8c821bc96ff4e8d1dd2ee8b1282e5e1fc5375a7cd1f2457131641ec537de337aca31dfdd93821e43e9f19ea50b91e2ef8d041c3df078ef18928f0574a5eff3faebaf1fb2c04942ad8e825e8cbf681f7ef861bb221b3b8af942cb28a8f199f7a6a0478b0576f158cc85f7e7774341ef5fad87af7d9017d5050b1654ac3e4d9932a5785196576b66a38d1d3bf65fc68c19b37ff7eedd15db58e95ef8a7e9ded75f870d1b768c525e9984aa49a8833dfea207176b2b62457c3ea223fe064f2f3d7acc9f7ffe79bfd7a738faab30d47e202de867d7d4461b376edc1f67ce9c79a01243efcdcdcd7b63a83ded45fd461957d02554f157ae16c3ecd1c38ff515f9218fe26f50cca52fca0becdd77df9df4e742ee982e2c0eb5a76d5c4d0e6ddc78e38d5be6ce9dbbbf3f8bf9ce9d3b0f8e1a35aa39ddebba4b0957d02554f1a789bf9f326cd8b013d3c2da9217d938dc3a4ec9da1fc53ca67e6a6a215c17431bbf183972e4aef9f3e77fdf5f3df3d6623e5df996502554f1a789bfee8a0b08a56d775e6c638e3bd6f3947398bda467fe66cd4f09c78af3fafafaa63973e6ec28f79c790cb3eb994ba812aaf8d3c45f2f3b9dbfcb8f4d8f16bde938356b5f57b3c7a18ea5577b1b34ebbba2a79e16dfd762f5fbd6ad5bbfebeba169b19a3d16c0993397502554f1a789bfbe883a9216dc3dc5021c6792ebe9f9dee3a431719c7949af3c1b661f948bb5ebeaea1ad2c2fed5c30f3ffcc1e6cd9b7bd4638f33c0353636ae8b5e79ba81665bcd2ea14aa8e24f137f65ea749e59bc1a5bde6ebffdf6e4c5175fccce4618abe1f379f6b88d021ebdf938af409c40a8830bc41ca8c905703d5c8c704cfa9f7c2836ded8b163ff3263c68c35cb962d7b2fdd385b8b057cd7ae5d5fc555d3e2422b716ef6389d6b9c01ce496324540955fc69e2af3f6a53acc72aedadf7a6c571e63577685a391625b416f737d3b6a5758fa6ed3ab171e59cb86a5a5c68c5b9d925540955fc69e2afbfb59ef37d6a71c15c375bccc53f533367804342d52454f127fe8682e844b6ceaf3fdadae92c1d92df1ed7338fb393a6c5ff9aaabfd00a12aa26a18a3ff10748a89a82ae893f40429550c59f26fe00095542157f9a820e12aa26a18a3ff1075485a54b974a5ad5ddf6a509f580f8d3c41fd0a5952b576edfb973a7c455a5ada9a9e93fd384fa91f8d3c41fd0a5b7df7efb8ae5cb97ffedabafbefa3f09acba7a46914c972c59b2356d578b3f4dfc013f29fdc2fe36dd0b5f17436b315fa655458bcfe2a3a1904cc59ff80300000000000000000000000000000000000afe1f54cbebbd502e2be60000000049454e44ae426082	t
6	1	79c528c4-7186-43ae-9ee8-9b146a01a769bpmn20.xml	5	\\x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d3822203f3e0d0a0d0a3c646566696e6974696f6e7320786d6c6e733d22687474703a2f2f7777772e6f6d672e6f72672f737065632f42504d4e2f32303130303532342f4d4f44454c220d0a202020786d6c6e733a7873693d22687474703a2f2f7777772e77332e6f72672f323030312f584d4c536368656d612d696e7374616e63652220786d6c6e733a61637469766974693d22687474703a2f2f61637469766974692e6f72672f62706d6e220d0a202020786d6c6e733a62706d6e64693d22687474703a2f2f7777772e6f6d672e6f72672f737065632f42504d4e2f32303130303532342f44492220786d6c6e733a6f6d6764633d22687474703a2f2f7777772e6f6d672e6f72672f737065632f44442f32303130303532342f4443220d0a202020786d6c6e733a6f6d6764693d22687474703a2f2f7777772e6f6d672e6f72672f737065632f44442f32303130303532342f44492220747970654c616e67756167653d22687474703a2f2f7777772e77332e6f72672f323030312f584d4c536368656d61220d0a20202065787072657373696f6e4c616e67756167653d22687474703a2f2f7777772e77332e6f72672f313939392f585061746822207461726765744e616d6573706163653d22687474703a2f2f616c66726573636f2e6f7267223e0d0a0d0a202020203c70726f6365737320697345786563757461626c653d2274727565222069643d22616374697669746952657669657722206e616d653d2252657669657720416e6420417070726f76652041637469766974692050726f63657373223e0d0a0d0a20202020202020203c73746172744576656e742069643d227374617274220d0a20202020202020202020202061637469766974693a666f726d4b65793d2277663a7375626d69745265766965775461736b22202f3e0d0a0d0a20202020202020203c73657175656e6365466c6f772069643d27666c6f773127200d0a202020202020202020202020736f757263655265663d277374617274270d0a2020202020202020202020207461726765745265663d277265766965775461736b27202f3e0d0a0d0a20202020202020203c757365725461736b2069643d227265766965775461736b22206e616d653d22526576696577205461736b220d0a20202020202020202020202061637469766974693a666f726d4b65793d2277663a61637469766974695265766965775461736b223e0d0a20202020202020202020203c657874656e73696f6e456c656d656e74733e0d0a2020202020202020202020202020203c61637469766974693a7461736b4c697374656e6572206576656e743d226372656174652220636c6173733d226f72672e616c66726573636f2e7265706f2e776f726b666c6f772e61637469766974692e7461736b6c697374656e65722e5363726970745461736b4c697374656e6572223e0d0a2020202020202020202020202020202020203c61637469766974693a6669656c64206e616d653d22736372697074223e0d0a2020202020202020202020202020202020202020203c61637469766974693a737472696e673e0d0a20202020202020202020202020202020202020202020202069662028747970656f662062706d5f776f726b666c6f774475654461746520213d2027756e646566696e65642729207461736b2e64756544617465203d2062706d5f776f726b666c6f77447565446174650d0a20202020202020202020202020202020202020202020202069662028747970656f662062706d5f776f726b666c6f775072696f7269747920213d2027756e646566696e65642729207461736b2e7072696f72697479203d2062706d5f776f726b666c6f775072696f726974793b0d0a2020202020202020202020202020202020202020203c2f61637469766974693a737472696e673e0d0a2020202020202020202020202020202020203c2f61637469766974693a6669656c643e0d0a2020202020202020202020202020203c2f61637469766974693a7461736b4c697374656e65723e0d0a2020202020202020202020202020203c61637469766974693a7461736b4c697374656e6572206576656e743d22636f6d706c6574652220636c6173733d226f72672e616c66726573636f2e7265706f2e776f726b666c6f772e61637469766974692e7461736b6c697374656e65722e5363726970745461736b4c697374656e6572223e0d0a2020202020202020202020202020202020203c61637469766974693a6669656c64206e616d653d22736372697074223e0d0a2020202020202020202020202020202020202020203c61637469766974693a737472696e673e0d0a202020202020202020202020202020202020202020202009657865637574696f6e2e7365745661726961626c65282777665f7265766965774f7574636f6d65272c207461736b2e6765745661726961626c65282777665f7265766965774f7574636f6d652729293b0d0a2020202020202020202020202020202020202020203c2f61637469766974693a737472696e673e0d0a2020202020202020202020202020202020203c2f61637469766974693a6669656c643e0d0a2020202020202020202020202020203c2f61637469766974693a7461736b4c697374656e65723e0d0a20202020202020202020203c2f657874656e73696f6e456c656d656e74733e0d0a2020202020202020202020203c68756d616e506572666f726d65723e0d0a202020202020202020202020202020203c7265736f7572636541737369676e6d656e7445787072657373696f6e3e0d0a20202020202020202020202020202020202020203c666f726d616c45787072657373696f6e3e247b62706d5f61737369676e65652e70726f706572746965732e757365724e616d657d3c2f666f726d616c45787072657373696f6e3e0d0a202020202020202020202020202020203c2f7265736f7572636541737369676e6d656e7445787072657373696f6e3e0d0a2020202020202020202020203c2f68756d616e506572666f726d65723e0d0a20202020202020203c2f757365725461736b3e0d0a0d0a20202020202020203c73657175656e6365466c6f772069643d27666c6f773227200d0a2020202020202020736f757263655265663d277265766965775461736b270d0a2020202020202020202020207461726765745265663d277265766965774465636973696f6e27202f3e0d0a0d0a20202020202020203c6578636c757369766547617465776179202069643d227265766965774465636973696f6e22206e616d653d22526576696577204465636973696f6e22202f3e200d0a0d0a20202020202020203c73657175656e6365466c6f772069643d27666c6f77332720736f757263655265663d277265766965774465636973696f6e27207461726765745265663d27617070726f76656427203e0d0a2020202020202020202020203c636f6e646974696f6e45787072657373696f6e207873693a747970653d2274466f726d616c45787072657373696f6e223e247b77665f7265766965774f7574636f6d65203d3d2027417070726f7665277d3c2f636f6e646974696f6e45787072657373696f6e3e0d0a20202020202020203c2f73657175656e6365466c6f773e0d0a0d0a20202020202020203c73657175656e6365466c6f772069643d27666c6f773427200d0a2020202020202020736f757263655265663d277265766965774465636973696f6e270d0a2020202020202020202020207461726765745265663d2772656a656374656427202f3e0d0a0d0a202020202020203c757365725461736b2069643d22617070726f76656422206e616d653d22446f63756d656e7420417070726f766564220d0a20202020202020202020202061637469766974693a666f726d4b65793d2277663a617070726f7665645461736b22203e0d0a2020202020202020202020203c646f63756d656e746174696f6e3e0d0a2020202020202020202020202020202054686520646f63756d656e742077617320726576696577656420616e6420617070726f7665642e0d0a2020202020202020202020203c2f646f63756d656e746174696f6e3e0d0a2020202020202020202020203c657874656e73696f6e456c656d656e74733e0d0a2020202020202020202020202020203c61637469766974693a7461736b4c697374656e6572206576656e743d226372656174652220636c6173733d226f72672e616c66726573636f2e7265706f2e776f726b666c6f772e61637469766974692e7461736b6c697374656e65722e5363726970745461736b4c697374656e6572223e0d0a2020202020202020202020202020202020203c61637469766974693a6669656c64206e616d653d22736372697074223e0d0a2020202020202020202020202020202020202020203c61637469766974693a737472696e673e0d0a20202020202020202020202020202020202020202020202069662028747970656f662062706d5f776f726b666c6f774475654461746520213d2027756e646566696e65642729207461736b2e64756544617465203d2062706d5f776f726b666c6f77447565446174650d0a20202020202020202020202020202020202020202020202069662028747970656f662062706d5f776f726b666c6f775072696f7269747920213d2027756e646566696e65642729207461736b2e7072696f72697479203d2062706d5f776f726b666c6f775072696f726974793b0d0a2020202020202020202020202020202020202020203c2f61637469766974693a737472696e673e0d0a2020202020202020202020202020202020203c2f61637469766974693a6669656c643e0d0a2020202020202020202020202020203c2f61637469766974693a7461736b4c697374656e65723e0d0a2020202020202020202020203c2f657874656e73696f6e456c656d656e74733e0d0a2020202020202020202020203c68756d616e506572666f726d65723e0d0a202020202020202020202020202020203c7265736f7572636541737369676e6d656e7445787072657373696f6e3e0d0a20202020202020202020202020202020202020203c666f726d616c45787072657373696f6e3e247b696e69746961746f722e6578697374732829203f20696e69746961746f722e70726f706572746965732e757365724e616d65203a202761646d696e277d3c2f666f726d616c45787072657373696f6e3e0d0a202020202020202020202020202020203c2f7265736f7572636541737369676e6d656e7445787072657373696f6e3e0d0a2020202020202020202020203c2f68756d616e506572666f726d65723e0d0a20202020202020203c2f757365725461736b3e0d0a20202020202020200d0a20202020202020203c757365725461736b2069643d2272656a656374656422206e616d653d22446f63756d656e742052656a6563746564220d0a20202020202020202020202061637469766974693a666f726d4b65793d2277663a72656a65637465645461736b22203e0d0a2020202020202020202020203c646f63756d656e746174696f6e3e0d0a2020202020202020202020202020202054686520646f63756d656e742077617320726576696577656420616e642072656a65637465642e0d0a2020202020202020202020203c2f646f63756d656e746174696f6e3e0d0a2020202020202020202020203c657874656e73696f6e456c656d656e74733e0d0a2020202020202020202020202020203c61637469766974693a7461736b4c697374656e6572206576656e743d226372656174652220636c6173733d226f72672e616c66726573636f2e7265706f2e776f726b666c6f772e61637469766974692e7461736b6c697374656e65722e5363726970745461736b4c697374656e6572223e0d0a2020202020202020202020202020202020203c61637469766974693a6669656c64206e616d653d22736372697074223e0d0a2020202020202020202020202020202020202020203c61637469766974693a737472696e673e0d0a20202020202020202020202020202020202020202020202069662028747970656f662062706d5f776f726b666c6f774475654461746520213d2027756e646566696e65642729207461736b2e64756544617465203d2062706d5f776f726b666c6f77447565446174650d0a20202020202020202020202020202020202020202020202069662028747970656f662062706d5f776f726b666c6f775072696f7269747920213d2027756e646566696e65642729207461736b2e7072696f72697479203d2062706d5f776f726b666c6f775072696f726974793b0d0a2020202020202020202020202020202020202020203c2f61637469766974693a737472696e673e0d0a2020202020202020202020202020202020203c2f61637469766974693a6669656c643e0d0a2020202020202020202020202020203c2f61637469766974693a7461736b4c697374656e65723e0d0a2020202020202020202020203c2f657874656e73696f6e456c656d656e74733e0d0a2020202020202020202020203c68756d616e506572666f726d65723e0d0a202020202020202020202020202020203c7265736f7572636541737369676e6d656e7445787072657373696f6e3e0d0a20202020202020202020202020202020202020203c666f726d616c45787072657373696f6e3e247b696e69746961746f722e6578697374732829203f20696e69746961746f722e70726f706572746965732e757365724e616d65203a202761646d696e277d3c2f666f726d616c45787072657373696f6e3e0d0a202020202020202020202020202020203c2f7265736f7572636541737369676e6d656e7445787072657373696f6e3e0d0a2020202020202020202020203c2f68756d616e506572666f726d65723e0d0a20202020202020203c2f757365725461736b3e0d0a0d0a20202020202020203c73657175656e6365466c6f772069643d27666c6f77352720736f757263655265663d27617070726f766564270d0a2020202020202020202020207461726765745265663d27656e6427202f3e0d0a0d0a20202020202020203c73657175656e6365466c6f772069643d27666c6f77362720736f757263655265663d2772656a6563746564270d0a2020202020202020202020207461726765745265663d27656e6427202f3e0d0a0d0a20202020202020203c656e644576656e742069643d22656e6422202f3e0d0a0d0a202020203c2f70726f636573733e0d0a202020200d0a2020203c212d2d2047726170686963616c20726570726573656e7461696f6e206f66206469616772616d202d2d3e0d0a2020203c62706d6e64693a42504d4e4469616772616d2069643d2242504d4e4469616772616d5f6163746976697469526576696577223e0d0a2020202020203c62706d6e64693a42504d4e506c616e652062706d6e456c656d656e743d226163746976697469526576696577220d0a20202020202020202069643d2242504d4e506c616e655f6163746976697469526576696577223e0d0a2020202020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d227374617274220d0a20202020202020202020202069643d2242504d4e53686170655f7374617274223e0d0a2020202020202020202020203c6f6d6764633a426f756e6473206865696768743d223335222077696474683d2233352220783d2233302220793d22323030223e3c2f6f6d6764633a426f756e64733e0d0a2020202020202020203c2f62706d6e64693a42504d4e53686170653e0d0a2020202020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d227265766965775461736b220d0a20202020202020202020202069643d2242504d4e53686170655f7265766965775461736b223e0d0a2020202020202020202020203c6f6d6764633a426f756e6473206865696768743d223535222077696474683d223130352220783d22313235220d0a202020202020202020202020202020793d22313930223e3c2f6f6d6764633a426f756e64733e0d0a2020202020202020203c2f62706d6e64693a42504d4e53686170653e0d0a2020202020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d227265766965774465636973696f6e220d0a20202020202020202020202069643d2242504d4e53686170655f7265766965774465636973696f6e223e0d0a2020202020202020202020203c6f6d6764633a426f756e6473206865696768743d223430222077696474683d2234302220783d223239302220793d22313937223e3c2f6f6d6764633a426f756e64733e0d0a2020202020202020203c2f62706d6e64693a42504d4e53686170653e0d0a2020202020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d22617070726f766564220d0a20202020202020202020202069643d2242504d4e53686170655f617070726f766564223e0d0a2020202020202020202020203c6f6d6764633a426f756e6473206865696768743d223535222077696474683d223130352220783d22333930220d0a202020202020202020202020202020793d223937223e3c2f6f6d6764633a426f756e64733e0d0a2020202020202020203c2f62706d6e64693a42504d4e53686170653e0d0a2020202020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d2272656a6563746564220d0a20202020202020202020202069643d2242504d4e53686170655f72656a6563746564223e0d0a2020202020202020202020203c6f6d6764633a426f756e6473206865696768743d223535222077696474683d223130352220783d22333930220d0a202020202020202020202020202020793d22323937223e3c2f6f6d6764633a426f756e64733e0d0a2020202020202020203c2f62706d6e64693a42504d4e53686170653e0d0a2020202020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d22656e64222069643d2242504d4e53686170655f656e64223e0d0a2020202020202020202020203c6f6d6764633a426f756e6473206865696768743d223335222077696474683d2233352220783d223535352220793d22333037223e3c2f6f6d6764633a426f756e64733e0d0a2020202020202020203c2f62706d6e64693a42504d4e53686170653e0d0a2020202020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22666c6f7731222069643d2242504d4e456467655f666c6f7731223e0d0a2020202020202020202020203c6f6d6764693a776179706f696e7420783d2236352220793d22323137223e3c2f6f6d6764693a776179706f696e743e0d0a2020202020202020202020203c6f6d6764693a776179706f696e7420783d223132352220793d22323137223e3c2f6f6d6764693a776179706f696e743e0d0a2020202020202020203c2f62706d6e64693a42504d4e456467653e0d0a2020202020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22666c6f7732222069643d2242504d4e456467655f666c6f7732223e0d0a2020202020202020202020203c6f6d6764693a776179706f696e7420783d223233302220793d22323137223e3c2f6f6d6764693a776179706f696e743e0d0a2020202020202020202020203c6f6d6764693a776179706f696e7420783d223239302220793d22323137223e3c2f6f6d6764693a776179706f696e743e0d0a2020202020202020203c2f62706d6e64693a42504d4e456467653e0d0a2020202020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22666c6f7733222069643d2242504d4e456467655f666c6f7733223e0d0a2020202020202020202020203c6f6d6764693a776179706f696e7420783d223331302220793d22313937223e3c2f6f6d6764693a776179706f696e743e0d0a2020202020202020202020203c6f6d6764693a776179706f696e7420783d223331302220793d22313234223e3c2f6f6d6764693a776179706f696e743e0d0a2020202020202020202020203c6f6d6764693a776179706f696e7420783d223339302220793d22313234223e3c2f6f6d6764693a776179706f696e743e0d0a2020202020202020203c2f62706d6e64693a42504d4e456467653e0d0a2020202020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22666c6f7734222069643d2242504d4e456467655f666c6f7734223e0d0a2020202020202020202020203c6f6d6764693a776179706f696e7420783d223331302220793d22323337223e3c2f6f6d6764693a776179706f696e743e0d0a2020202020202020202020203c6f6d6764693a776179706f696e7420783d223331302220793d22333234223e3c2f6f6d6764693a776179706f696e743e0d0a2020202020202020202020203c6f6d6764693a776179706f696e7420783d223339302220793d22333234223e3c2f6f6d6764693a776179706f696e743e0d0a2020202020202020203c2f62706d6e64693a42504d4e456467653e0d0a2020202020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22666c6f7735222069643d2242504d4e456467655f666c6f7735223e0d0a2020202020202020202020203c6f6d6764693a776179706f696e7420783d223439352220793d22313234223e3c2f6f6d6764693a776179706f696e743e0d0a2020202020202020202020203c6f6d6764693a776179706f696e7420783d223537322220793d22313234223e3c2f6f6d6764693a776179706f696e743e0d0a2020202020202020202020203c6f6d6764693a776179706f696e7420783d223537322220793d22333037223e3c2f6f6d6764693a776179706f696e743e0d0a2020202020202020203c2f62706d6e64693a42504d4e456467653e0d0a2020202020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22666c6f7736222069643d2242504d4e456467655f666c6f7736223e0d0a2020202020202020202020203c6f6d6764693a776179706f696e7420783d223439352220793d22333234223e3c2f6f6d6764693a776179706f696e743e0d0a2020202020202020202020203c6f6d6764693a776179706f696e7420783d223535352220793d22333234223e3c2f6f6d6764693a776179706f696e743e0d0a2020202020202020203c2f62706d6e64693a42504d4e456467653e0d0a2020202020203c2f62706d6e64693a42504d4e506c616e653e0d0a2020203c2f62706d6e64693a42504d4e4469616772616d3e0d0a0d0a3c2f646566696e6974696f6e733e	f
7	1	79c528c4-7186-43ae-9ee8-9b146a01a769activitiReview.png	5	\\x89504e470d0a1a0a0000000d49484452000002580000016a0806000000c63c24e700001c424944415478daeddd7d8c54e5a13f70efad864b28a12435b46949dbfc7e690821a431b7c1a42fe10f732b09b94a2bac0ba8db96b76e29250d545a25182db155136990d2cbedaf5242690d57440d68bbbbbc2ca110502f5508542e50c405d9958b40b7bcdae7779e931d32fbc6eeeceb999dcf2779b233736666613c7ce7eb739e3973d34d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000c52e8470f3d1a347d7efdebdfbc39a9a9a50555565646054575787dadadaf79331dd5e0a00452696ab1d3b7684fafafa70f9f2652343a3a1a1216cdfbefd5c52b6eeb1a7024011893357ca55a64bd6e5aaaaaa83f654002822f1b0a02293ed9114acabf65400282271bd8f1293f98215eca90030000bd6df3e38158eee7d361ca87e341df172bc4d0152b000802e14ac0b67ebc2fe3f2c0e7fdeb4b0d988b7c56d4a908205001458b04e1c78a955b9ca8d770fbcac0429580040a105ebe0d69fb55bb0e2362548c102000a2c58fbab1e69b760c56d4a9082050028580a1600d0bf052b7e6ab0bd8215b729410a16005060c13abcf399760b56dca604295800408105eb4cdd9b61ff1f97b43e3c98dc16b729410a16005060c18ae3d86b6b5a15ac789b02a46001005d2958972e85c37f5ad9faf060725bdca6042958004001052b9ea9fded9dcbdb5d8315b7399bbb82050074a6605dba144e1dde12de7af5c7ed96abdc88f789f7359ba5600100ed14ac8e66adcc66295800408105ab33b356379acd528a142c0050b05abca177b55ce58652a460018082a5c428580040c7cacbcbab92f165054bc102007ac8bdf7de1be28845abacacec76054bc102007aa860e58d57da9ad152b0142c00a0eb05ebfa8c567ed152b0142c00a09b052b7f462b1e3a54b0142c00e84a91306e3014acec0ffb69d7867404e866c1f22a14543cf79695954d1c3f7efccdf17e0a96192cb9008020ed7ac16a56ac72faab6025bffafa183a746898376f5e686c6c54a8142cb90020488ba260ed2a2f2fbfbb65b1ca4ac18a97972d5b965e5eb0608142a560c90500419ae9d7a5cd19ab2c16ac0b172ea497478e1c995e3f73e64c983d7b76183c7870183468509833674e3877ee5cbaedf8f1e321f93b855b6eb9258c1a352aecdab5abd5f3b5bc9ebb7cdb6db7a58f8b33664b962c0993264d4a9f7fc4881161eddab50a965c004090f68c2c14acdcf5587ee2e558aee2f575ebd685f5ebd7a79763c98adb264c98905e8fc52afe1c3b766ca70bd6f3cf3f1f8e1d3b76fd7a7ceec3870fa797870f1fae60c9050004e9c02d587156295ebf78f1623ae2e5785bfeb6ce3c5fcb82d599fb2a58720100413a200a56ee10e1e8d1a3d3ebf1d060cb823564c810050bb900204815acce16ac55ab56a5971f7ae8a1f47a454545ab4384959595cd0e11eedcb9b3d921c25b6fbd35bdbe7ffffeb069d3a62e17acce5c56b0e402802025d305eba6a6d334cc9f3ffffab6b8c87dc68c19e96c551cb15ce516b9c73554e3c68d4b0f278e193326ecd9b327bd7df5ead561d8b061e9ec577c2e054b2e7815000469c9152c43c1920b008254c132142cb900204851b0142cb900802055b00c054b2e00085205cb50b0e402802045c152b0e402008254c132142cb9002048152c43c1920b008254c15262142cb900802055b0142ce402802055b00c054b2e00085205cb50b0e402802045c152b0900b008254c132142cb9002048152c43c1920b0082940ed5d4d42831d91e17938275d59e2a1700046911a9adad3d555f5fafc86474d4d5d5fd3e295807eda97201409016912d5bb6dcb56ddbb60f4e9f3efd7785265b3357b15c5557571f4fc63df654b90020488b4cf2063eb1aaaa6a6f3c1415d7fb189918f1bfc541e54a2e000852402e000852402e00204801b900204801b900204801b9002048bd0a805c0010a4805c0010a4805c0010a4805c0040900272014090027201409002720100410ac80500410ac80500410ac805000429201700042920170004292017000429805c0010a4805c0010a4805c0010a4805c0040900272014090027201409002720100410ac80500410ac80500410ac805000429201700042920170004292017000429805c0010a4805c0010a4805c0010a4805c0040900272014090027281521242b8f9e8d1a3eb77efdefd614d4d4da8aaaa323230aaabab436d6dedfbc9986e2f15a4805ca0c8c472b563c78e505f5f1f2e5fbe6c646834343484eddbb79f4bcad63df654410ac8058a489cb952ae325db22e5755551db4a70a52402e5044e261414526db23295857eda98214900b1491b8de4789c97cc112048214900b0cc482f5b70f4e85a37b9f0d07aa1f4d47bc1c6f5380142c410ac805e842c1ba70b62eecffc3e2f0e74d0b9b8d785bdca60429588214900b5060c13a71e0a556e52a37de3df0b212a46065d99d4d417aa7970250b0c854c13ab8f567ed16acb84d0952b032ea8e649c4dc6d34d3f277a4900058bcc14acfd558fb45bb0e2362548c1ca70b9ca95aa3883d5a064010a563b1e79e4918fad58b1e2278f3df6d86b8b172f6ea8acacbc326ddab4105fac3866cd9a75ed873ffce1d9471f7d74df2f7ef18bff78f8e187ff8f574dc152b04aba5c75743ba06095aea54b977e6dc99225ff3d7dfaf47f24c52a6cdcb831bcf9e69be919c8af5dbb1672ce9c39130e1d3a145e7df5d5f0d4534f8578ffa4709d481e336bfcf8f1377b250b2f58f15383ed15acb84d0952b032e4ce0e4a546ebb3559a06095b6f9f3e77ff6473ffad1be193366fc63fdfaf569812ac4952b57c2ce9d3bc3c30f3ffc8fcacacaf766ce9cf9ef76adc20ad6e19dcfb45bb0e2362548c1ca58b9eaa83c99c90205abb47375f1e2c573bffded6f5ffdcd6f7e131a1b1b4377edddbb372405ebca9c3973364e9e3cf9a376b1ce15ac33756f86fd7f5cd2faf060725bdca604295819704781335385de1f50b00686458b16fdc777bffbdd6bafbffe7ae849e7cf9f0f2b56acb8525151713229599f50b03a77a2d163afad6955b0e26d0a908295a17235b10b8fbba06481825552e56aeedcb9e99710f79675ebd67d387dfaf47349c9fabf0a56076ff2972e85c37f5ad9faf060725bdca60429584558ae7aeaf18082551ce261c13873d59be52ae7c5175fbc9494acba529ec9eaa860c533b5bfbd7379bb6bb0e236677357b0fa49470bdafbfa7900052b9be282f6b8e66adfbe7da1affcf6b7bf3d3975ead4974af51386ed16ac4b97c2a9c35bc25baffeb8dd72951bf13ef1be66b314ac7e28573d7578cf4c16285803d7a2458bde8a0bdafbdaf7bffffd936565657315accecd5a99cd52b0fa59cb05eaff948c079a7e16a2e5e32c7c07056be089e7b98aa762e8894f0b16aaaeaeeedad4a953ffb7bcbcfce30ad6e54ecd5add68364b2952b0faa05c4dcc2b49ff2f19a1e967674b567b8f53b240c11a58e24944376cd810facb4f7ffad30349c17a5cc1badce572951b4a9182d547e5eaa6a619a890373a53b2f2cb556edc9fb7dd9a2c50b00686f8f537f18ceb859e44b48767b1ea9382f57ea9adc5eaec691a0c05ab9fb5577ada2a4b372a596dddff576ddcdf9a2c50b08adfca952b1f8f5f7fd3dfbef39deffc2529595f56b00c05abe725ffb6aabaf8efaba305ed9d2d599d2d572d4b96c385a06015a7f8c5cd2fbffc72bf17ac65cb96ed1c2887093bfb66a66029587d196871c47db3acacecf64e3eacb325a7a3925568b9cafffd0d66b240c12a4a8b172f6e885fdcdcdf76efdebd2f79d1b796d29b9982a560f5f53e99375ee9e07f020a3d4cd75ec9fae72e96ab9633684a162858c5a5b2b2f24a5f9c58b423efbdf7dea9e4453f554a6f660a9682d58ffbe4f5ff096863dfecea1aa8b64ad65fba51aebafbe70114acfe336ddab470eddab5900503e545efec9b9982a560f5f73e99ff3f014db3addd9d316aab6475a75cb52c59d6648182553c7fd1ac18e805abe59b998295fdd189ff9603667cfdeb5fcf15a1a7bbf94fe09fdb98b9fa4bd3edddf174d3737dcc5b14285866b00a2c58a534142c33581928fd7b93b23f31ef1429ddfd1a9c1bcd60157232523358a06015b7acacc16a6868383980d760b5f966d653052bff4dec965b6e099ffffce7434d4d4db79faf370a4b3b6fbc99fcb30ef082d5b258b52c33176eea9d35585d2959d6608182557c1e7ae8a1f70f1c3890954f11ee28a537b39e2e58f1f2a14387d2cba3468dcaf4cc504f152305abe07d72577979f9dd9d38a96fa13346ed9d8aa1ad4f111652b27c8a1014ace214cf83b579f3e64c9c072b79d19f2ca537b3de2858b9eb71262b5e6e686808f7df7f7f18346850183c7870f8c637be11de7df7ddb06eddbaf47ed3a74f4fef17ef13afaf5dbbb6d9f3b5f7f8b86dc4881161f6ecd9e9e55ffef297e9637efef39fa7d7e7cc9913860e1d5a5031dabe7d7b183d7a74fa678fcfbd7af5eaf4f6175f7c318c193326bd3dfe19befad5af8623478eb47a9e279e7822bd9cfc4f8382d57a9fbcd18c5577678e3a3acf55a1677ccff9d79b9c070b14ac62b562c58aa7962e5ddaef056beedcb9fb93177d7c29bd99f546c17ae38d37d2cb63c78e4daf575454a4d7e3edfbf6ed4b2f7fed6b5f0b274f9e4c2f7fe6339f49eff7b9cf7d2ebd7ee2c48966cfd7dee3e3b6499326854f7ef293e9e52f7de94be9b671e3c6a5d73ff5a94f85bbeebaaba08215cbd59e3d7baeff19860d1b96de1e7fc6ebc78e1d4bb7c7cb5ffce2179b3d4faee07deb5bdf3283d5b33a9a41eaec49440b2d59b9c394777b3b0205ab282d5cb8f0130f3cf0c03f1a1b1bfbf31c58f1bb08ff96bc99ff4b29ed64bdb1062b8e2f7ce10b61d7ae5de9b638f3d4727bbc2d6e8bb342f1fad6ad5bd39fb1e0b42c3f377a7c9c29ca9ff5ca15a1dcf5dcec56670b562c500f3ef8605a9ef2b7e7ca5b9cc19a30614248fea7209d596bebef9e9b4153b07a547b3359859ea1bdb3252bf7fb942b50b08a5bf2a6f63fdbb66debb782f5cc33cfbc565656f69fa5b693f5c60cd6dcb973c3902143c2a64d9b9a15a48b172fb67a5c656565ba2dce34e517a2b60a565b8f5fbf7e7dba2dce56c59fbffad5af9a5d5fb3664d41052bae1b8bb7c5af6ecadf1e7f777cade6cd9b17468e1c99de1e17f2e73f4ffc7bc7c387b1342a58bd3693d5f270dd0337157e9eabb64ad6fd05cc98010a56f158b46851f982050b3eec8fd3353436365e9d3a75eaff4e9b36edd30a56f70b562c23b17c0c1f3e3c3dd496bcb6e9b655ab565d3f7cf895af7ca559418a3343f1e773cf3dd7eaf96ef4f8e3c78f379b358bb7e5cf3edde8938c6d15ac5c99cbfd9edcf678d8315e8eb372b9439bb1c4b57c9eb89e2c3723a760f55ac9ca5ff89e5f960a3989687b8f732a0650b0069ecacacaf776ecd8d1e705ebb1c71e7b3379b19797e24ed65b8bdc5f78e185f4fa942953e2e1d7741d559cdd890526ae9f8ac528deefdcb973e1231ff9487adff8b3e561b778f9468f8f23ce96c5fb2e5fbe3cbd1e0fdfe51e1f0f3b1752b0e263e3ef88eba8f2b7c7df17d77bc53f432c83b1c4c505f12d9f27cedae5fede0a56af6979b8f09f9a66a00a3df542cbc775f7fc5b8082954db366cdfab79933675e397bf66c9f95ab37de78e3707979f9ff4c9e3cf9a30a96e144a3455bb27a6266cca70541c11ab8e6cc99f35fcb962dbbda17870a4f9e3cd9180f0d4e9932e58e52ddc9142c054bc972125150b04a403cadc037bff9cd636bd6acb9d29be5aabebefe5a4545c5c9f2f2f2f9a5bc9329580a5691ebee613d870541c12a1d49e9f9f87df7dd7766c3860d977b6be6aaa95c3d5eea3b9982a5600da09255e80c9405eda060959ef889bee9d3a7d7fdfad7bf7eafa7d75cc5c382a53e73a5602958034ca187f91c160405ab74c599aca40cbd143f5d78fcf8f14bdd3d1543fcb4605cd05eca6bae142c054bc94abffec619da41c1a2acac6c6e52b44effe4273f79ebc89123ef157a86f6152b56ec8db356c90bbab2543f2da860295825e2cea6f274e70db6372857a06079159ac46294bc208f24e3c4ac59b3fef2c4134fecdaba75eb1befbcf3cef1fc4275e6cc99d3bb77efde17bfb8397eb760fcfa9b7886f6523c89a882a56099c9ead20c17a06095ec8cd6ed4d65eb95641c4bc6d5f862358d53c9d8958c27e3173797da770b2a580a166d9629e50a50b050b00c05ab074bd6d3ca15a060a160190a56cfb9b329489d8a0150b050b00c054b9002720105cb50b00429201740c152b00429201740c152b010a4805ca018d4d4d42831d91e17938275d59e2a4801b94011a9adad3d555f5fafc86474d4d5d5fd3e295807eda98214900b14912d5bb6dcb56ddbb60f4e9f3efd7785265b3357b15c5557571f4fc63df654410ac8058a4cf2063eb1aaaa6a6f3c1415d7fb189918f1bfc541e54a900272014090027201409002720100410ac80500410ac80500410ac8050004292017000429201700042920170010a4805c0010a4805c0010a4805c0010a4805c900b008214900b008214900b008214900b000852402e000852402e000852402e00204801b900204801b900204801b9002048052920170004292017000429201700042920170010a4805c0010a4805c0010a4805c0040900272014090027201409002720100410ac80500410ac80500410ac80500410a20170004292017000429201700042920170010a4805c0010a4805c0010a4805c0040900272014090027201409002720100410ac80500410ac80500410ac80500410a20170004292017000429201700042920170010a47d298470f3d1a347d7efdebdfbc39a9a9a50555565646054575787dadadaf79331dd5eda6106bc1c73a083b1d72b05a060f59958ae76ecd811eaebebc3e5cb978d0c8d868686b07dfbf67349d9bac79e7ac30cf8d7645cbd51c12a2b2b9be8950250b0fa4c9cb952ae325db22e5755551db4a7769803afdca060ed1a3f7efccd5e250005abcfc4c3828a4cb64752b0aeda533b358bd566c12a2f2fbfdb2b04a060f5a9b8de4789c97cc1b28f772e0bda5a8bb5d7ec15808295d982f5b70f4e85a37b9f0d07aa1f4d47bc1c6f538014ac8ccd625db5f60a40c12a8a8275e16c5dd8ff87c5e1cf9b16361bf1b6b84d0952b0b22229542f98bd0250b08aa2609d38f052ab72951bef1e78590952b0b254b06ecf5b7b75a7570440c1ca6cc13ab8f567ed16acb84d0952b0329609e95a2cb357000a56a60bd6feaa47da2d58719b12a460f597f2f2f28f979595253170ef93c9d89a8c132d16b99f8aa76948eef39fc97d6724973feb550350b0142c43c16ac3942953ee685a6f75b1136771cf1f7111fcae645498e10250b0fab560c54f0db657b0e2362548c1eac37feff193827b0b2c55ed8d837156cbab0aa060f54bc13abcf399760b56dca60429587d2129438fb73c0dc3b469d3c2e38f3f1ed6af5f1f0e1c38104e9d3a152e5ebc18a22b57aea45f01f5f6db6f870d1b36a4f7bbefbefbda2a5aaf24cff369af308082d5a705eb4cdd9b61ff1f97b43e3c98dc16b729410a566f9a3c79f2479bd6575d2f4515151561eddab569812a44636363d8b87163983f7f7ecbef2a3c9bfc1c2f110014ac3e2b58711c7b6d4dab82156f538014ac3e28573bf2cbd0e2c58bd399aaeeb876ed5ad8bc79733a0396f7dc1792e18bb50114ac3e2a58972e85c37f5ad9faf060725bdca6042958bdf8efbbd9cc553c1418cb514fa9abab0b0b172ecc2f59179dfd1d40c1eaf58215cfd4fef6cee5edaec18adb9ccd5dc1ea0d4d6baeae979fddbb7787de10d76cc5f559f93359c9ef1e251d00058b9e2f58972e855387b784b75efd71bbe52a37e27de27dcd6629583df8efbad9f70ac699abde1417c42f5dbab4d9f9b3e239b62404a060d16305aba3592bb3590a566f2b2b2bfbeffc35573d7958b03de7cf9f0f3367cecc5ff8feb48400142c7aac607566d6ea46b3594a9182d51df124a2f99f16ecee82f642bcfefaeb2d17bd7f564a000a163d52b0ba5aae72432952b0baf96ffae55cc989a762e86b4f3df5547ec97a524a000a163d52b00c05abbfc4754fb9afbf89a75028f43c573de1c89123cdce8f555151f13149012858e4dea8aa92f165054bc12a264d5fdc9c969bf8c9befe927f22d2e4dfd1dd120550b0b8feba34bd3954256f5ab72b580a563194fe7848aeaf3e397823cf3df79cc5ee8022e15568bf60e57fdf5a5b6f6e0a968295a5d29f7f62d143870ef55bc18ae7dccafff34a1440c1a2bd8275fdcd22bf6829580a56964a7f72db89dcf6befcf4604befbcf34eb37362491440c1e286052bffcd2dce2228580a56964a7ffeedf10cebfd259e7834ffcf22510045c2286828580a56964a7ffef5fea6600150c89bd9def865b6e3c78fbf39de4fc1cafe28d5f26f060b80622858cd8a554e7f15ace4575f1f43870e0df3e6cd0b8d8d8d0a5569ce605ddf37adc102a058decc76c5f3f8b42c56592958f1f2b265cbd2cb0b162c50a84aab60b52afd3e450840d6dfccda9cb1ca62c1ba70e1427a79e4c891e9f53367ce84d9b36787c1830787418306853973e68473e7cea5db8e1f3f1e92bf53b8e5965bc2a851a3c2ae5dbb5a3d5fcbebb9cbb7dd765bfab83863b664c9923069d2a4f4f9478c18917e258b82d5ffa53fd9b63c0be7c18abf3befcfbb5ca20050902c14acdcf5587ee2e558aee2f575ebd6a56f74f1722c5971db840913d2ebb158c59f63c78eed74c17afef9e7c3b163c7ae5f8fcf7df8f0e1f4f2f0e1c315ac0c94fea4784dcfc299dc172e5c985fb0ee911400147dc18ab34af17a5ce41c47bc1c6fcbdfd699e76b59b03a735f05ab7f4d9b36edd3f9df4578fefcf9fe5e7f75317e3fa2a400a0e80a56ee10e1e8d1a3d3ebf1d060cb823564c81005ab44e4afc3dab061439f17ac952b57e617ac67a504004559b056ad5a955e7ee8a187d2eb151515ad0e11565656363b44b873e7ce6687086fbdf5d6f4fafefdfbc3a64d9bba5cb03a7359c1ea5df98709e37ff7be3c5d435d5d5d3a7396fbfd53a74efd829400a0e80ad64d4da769983f7ffef56d7191fb8c1933d2d9aa38e29b6c6e917b5c43356edcb8f470e2983163c29e3d7bd2db57af5e1d860d1b96ce7ec5e752b08a57d3e91adeca959c8d1b37f659c17af4d147f3bfe4f90509014051152c43c1eaec2c569c51faeb5fffdaebe56af3e6cdf98706af26056b8c840040c152b00694a4e4bc9c2b3c3ff8c10fd213d1f69678c839ffd06032e6480700142c056bc0993c79f22792a2d3902b3d4b972e4dbfc2a637ca555cf767613b000a96825512cacaca6e4fc6d95cf9896ba4e21abd9e3c2cd862e6ea95a4d87d543200a0602958035a3ceb7beedc5871c4d9a6f85536ddfdb4603c9b7f8bafee51ae0050b014acd23165ca943b92027421bf10c533bd17fa7d85f124a2f13c572d66add2c382ca15000a9682558a3359a3922274a2e597467fef7bdf0bbffbddefc28e1d3bd24f1be6d669c59fb150c5d9ae783eb5071f7c30b4f185d3572d680740c152b04a5a9c654a8ad6e32d67b3ba32e279ae9c8a0100054bc1a249d377163e96bf00be9323aee57ad619da0150b0142c05ab1d151515ffd2b43eebc9b848bd8d4388a7cacbcbab929fcb933276af2f6e0640c132142c0050b00c050b0050b0142c0040c152b0000005cb50b000a0b4d4d4d42831d91e17938275d59e0a0045a4b6b6f6547d7dbd2293d1515757f7fba4601db4a7024011d9b265cb5ddbb66dfbe0f4e9d37f5768b2357315cb557575f5f164dc634f05802293bc814facaaaada1b0f45c5f53e462646fc6f7150b9020000000000000000000000000000000000000000e823ff1ff1068bddf62f1bc20000000049454e44ae426082	t
10	1	3f5431b3-a3c9-45e2-a2a4-ed0786ab90ddbpmn20.xml	9	\\x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d3822203f3e0d0a0d0a3c646566696e6974696f6e7320786d6c6e733d22687474703a2f2f7777772e6f6d672e6f72672f737065632f42504d4e2f32303130303532342f4d4f44454c220d0a202020786d6c6e733a7873693d22687474703a2f2f7777772e77332e6f72672f323030312f584d4c536368656d612d696e7374616e63652220786d6c6e733a61637469766974693d22687474703a2f2f61637469766974692e6f72672f62706d6e220d0a202020786d6c6e733a62706d6e64693d22687474703a2f2f7777772e6f6d672e6f72672f737065632f42504d4e2f32303130303532342f44492220786d6c6e733a6f6d6764633d22687474703a2f2f7777772e6f6d672e6f72672f737065632f44442f32303130303532342f4443220d0a202020786d6c6e733a6f6d6764693d22687474703a2f2f7777772e6f6d672e6f72672f737065632f44442f32303130303532342f44492220747970654c616e67756167653d22687474703a2f2f7777772e77332e6f72672f323030312f584d4c536368656d61220d0a20202065787072657373696f6e4c616e67756167653d22687474703a2f2f7777772e77332e6f72672f313939392f585061746822207461726765744e616d6573706163653d22687474703a2f2f616c66726573636f2e6f7267223e0d0a0d0a202020203c70726f6365737320697345786563757461626c653d2274727565222069643d226163746976697469526576696577506f6f6c656422206e616d653d22506f6f6c65642052657669657720416e6420417070726f76652041637469766974692050726f63657373223e0d0a0d0a20202020202020203c73746172744576656e742069643d227374617274220d0a20202020202020202020202061637469766974693a666f726d4b65793d2277663a7375626d697447726f75705265766965775461736b22202f3e0d0a0d0a20202020202020203c73657175656e6365466c6f772069643d27666c6f773127200d0a202020202020202020202020736f757263655265663d277374617274270d0a2020202020202020202020207461726765745265663d277265766965775461736b27202f3e0d0a0d0a20202020202020203c757365725461736b2069643d227265766965775461736b22206e616d653d22526576696577205461736b220d0a20202020202020202020202061637469766974693a666f726d4b65793d2277663a61637469766974695265766965775461736b223e0d0a20202020202020202020203c657874656e73696f6e456c656d656e74733e0d0a2020202020202020202020202020203c61637469766974693a7461736b4c697374656e6572206576656e743d226372656174652220636c6173733d226f72672e616c66726573636f2e7265706f2e776f726b666c6f772e61637469766974692e7461736b6c697374656e65722e5363726970745461736b4c697374656e6572223e0d0a2020202020202020202020202020202020203c61637469766974693a6669656c64206e616d653d22736372697074223e0d0a2020202020202020202020202020202020202020203c61637469766974693a737472696e673e0d0a20202020202020202020202020202020202020202020202069662028747970656f662062706d5f776f726b666c6f774475654461746520213d2027756e646566696e65642729207461736b2e64756544617465203d2062706d5f776f726b666c6f77447565446174650d0a20202020202020202020202020202020202020202020202069662028747970656f662062706d5f776f726b666c6f775072696f7269747920213d2027756e646566696e65642729207461736b2e7072696f72697479203d2062706d5f776f726b666c6f775072696f726974793b0d0a2020202020202020202020202020202020202020203c2f61637469766974693a737472696e673e0d0a2020202020202020202020202020202020203c2f61637469766974693a6669656c643e0d0a2020202020202020202020202020203c2f61637469766974693a7461736b4c697374656e65723e0d0a2020202020202020202020202020203c61637469766974693a7461736b4c697374656e6572206576656e743d22636f6d706c6574652220636c6173733d226f72672e616c66726573636f2e7265706f2e776f726b666c6f772e61637469766974692e7461736b6c697374656e65722e5363726970745461736b4c697374656e6572223e0d0a2020202020202020202020202020202020203c61637469766974693a6669656c64206e616d653d22736372697074223e0d0a2020202020202020202020202020202020202020203c61637469766974693a737472696e673e0d0a202020202020202020202020202020202020202020202009657865637574696f6e2e7365745661726961626c65282777665f7265766965774f7574636f6d65272c207461736b2e6765745661726961626c65282777665f7265766965774f7574636f6d652729293b0d0a2020202020202020202020202020202020202020203c2f61637469766974693a737472696e673e0d0a2020202020202020202020202020202020203c2f61637469766974693a6669656c643e0d0a2020202020202020202020202020203c2f61637469766974693a7461736b4c697374656e65723e0d0a20202020202020202020202020200d0a20202020202020202020203c2f657874656e73696f6e456c656d656e74733e0d0a20202020202020202020203c706f74656e7469616c4f776e65723e0d0a09092020202020203c7265736f7572636541737369676e6d656e7445787072657373696f6e3e0d0a090920202020202020203c666f726d616c45787072657373696f6e3e247b62706d5f67726f757041737369676e65652e70726f706572746965732e617574686f726974794e616d657d3c2f666f726d616c45787072657373696f6e3e0d0a09092020202020203c2f7265736f7572636541737369676e6d656e7445787072657373696f6e3e0d0a09092020203c2f706f74656e7469616c4f776e65723e0d0a20202020202020203c2f757365725461736b3e0d0a0d0a20202020202020203c73657175656e6365466c6f772069643d27666c6f773227200d0a2020202020202020736f757263655265663d277265766965775461736b270d0a2020202020202020202020207461726765745265663d277265766965774465636973696f6e27202f3e0d0a0d0a20202020202020203c6578636c757369766547617465776179202069643d227265766965774465636973696f6e22206e616d653d22526576696577204465636973696f6e22202f3e200d0a0d0a20202020202020203c73657175656e6365466c6f772069643d27666c6f77332720736f757263655265663d277265766965774465636973696f6e27207461726765745265663d27617070726f76656427203e0d0a2020202020202020202020203c636f6e646974696f6e45787072657373696f6e207873693a747970653d2274466f726d616c45787072657373696f6e223e247b77665f7265766965774f7574636f6d65203d3d2027417070726f7665277d3c2f636f6e646974696f6e45787072657373696f6e3e0d0a20202020202020203c2f73657175656e6365466c6f773e0d0a0d0a20202020202020203c73657175656e6365466c6f772069643d27666c6f773427200d0a2020202020202020736f757263655265663d277265766965774465636973696f6e270d0a2020202020202020202020207461726765745265663d2772656a656374656427202f3e0d0a0d0a202020202020203c757365725461736b2069643d22617070726f76656422206e616d653d22446f63756d656e7420417070726f766564220d0a20202020202020202020202061637469766974693a666f726d4b65793d2277663a617070726f7665645461736b22203e0d0a2020202020202020202020203c646f63756d656e746174696f6e3e0d0a2020202020202020202020202020202054686520646f63756d656e742077617320726576696577656420616e6420617070726f7665642e0d0a2020202020202020202020203c2f646f63756d656e746174696f6e3e0d0a2020202020202020202020203c657874656e73696f6e456c656d656e74733e0d0a2020202020202020202020202020203c61637469766974693a7461736b4c697374656e6572206576656e743d226372656174652220636c6173733d226f72672e616c66726573636f2e7265706f2e776f726b666c6f772e61637469766974692e7461736b6c697374656e65722e5363726970745461736b4c697374656e6572223e0d0a2020202020202020202020202020202020203c61637469766974693a6669656c64206e616d653d22736372697074223e0d0a2020202020202020202020202020202020202020203c61637469766974693a737472696e673e0d0a20202020202020202020202020202020202020202020202069662028747970656f662062706d5f776f726b666c6f774475654461746520213d2027756e646566696e65642729207461736b2e64756544617465203d2062706d5f776f726b666c6f77447565446174650d0a20202020202020202020202020202020202020202020202069662028747970656f662062706d5f776f726b666c6f775072696f7269747920213d2027756e646566696e65642729207461736b2e7072696f72697479203d2062706d5f776f726b666c6f775072696f726974793b0d0a2020202020202020202020202020202020202020203c2f61637469766974693a737472696e673e0d0a2020202020202020202020202020202020203c2f61637469766974693a6669656c643e0d0a2020202020202020202020202020203c2f61637469766974693a7461736b4c697374656e65723e0d0a2020202020202020202020202020203c61637469766974693a7461736b4c697374656e6572206576656e743d22636f6d706c6574652220636c6173733d226f72672e616c66726573636f2e7265706f2e776f726b666c6f772e61637469766974692e7461736b6c697374656e65722e5363726970745461736b4c697374656e6572223e0d0a2020202020202020202020202020202020203c61637469766974693a6669656c64206e616d653d22736372697074223e0d0a2020202020202020202020202020202020202020203c61637469766974693a737472696e673e0d0a202020202020202020202020202020202020202020202020657865637574696f6e2e7365745661726961626c65282762706d5f61737369676e6565272c20706572736f6e293b0d0a2020202020202020202020202020202020202020203c2f61637469766974693a737472696e673e0d0a2020202020202020202020202020202020203c2f61637469766974693a6669656c643e0d0a2020202020202020202020202020203c2f61637469766974693a7461736b4c697374656e65723e0d0a2020202020202020202020203c2f657874656e73696f6e456c656d656e74733e0d0a2020202020202020202020203c68756d616e506572666f726d65723e0d0a202020202020202020202020202020203c7265736f7572636541737369676e6d656e7445787072657373696f6e3e0d0a20202020202020202020202020202020202020203c666f726d616c45787072657373696f6e3e247b696e69746961746f722e6578697374732829203f20696e69746961746f722e70726f706572746965732e757365724e616d65203a202761646d696e277d3c2f666f726d616c45787072657373696f6e3e0d0a202020202020202020202020202020203c2f7265736f7572636541737369676e6d656e7445787072657373696f6e3e0d0a2020202020202020202020203c2f68756d616e506572666f726d65723e0d0a20202020202020203c2f757365725461736b3e0d0a20202020202020200d0a20202020202020203c757365725461736b2069643d2272656a656374656422206e616d653d22446f63756d656e742052656a6563746564220d0a20202020202020202020202061637469766974693a666f726d4b65793d2277663a72656a65637465645461736b22203e0d0a2020202020202020202020203c646f63756d656e746174696f6e3e0d0a2020202020202020202020202020202054686520646f63756d656e742077617320726576696577656420616e642072656a65637465642e0d0a2020202020202020202020203c2f646f63756d656e746174696f6e3e0d0a2020202020202020202020203c657874656e73696f6e456c656d656e74733e0d0a2020202020202020202020202020203c61637469766974693a7461736b4c697374656e6572206576656e743d226372656174652220636c6173733d226f72672e616c66726573636f2e7265706f2e776f726b666c6f772e61637469766974692e7461736b6c697374656e65722e5363726970745461736b4c697374656e6572223e0d0a2020202020202020202020202020202020203c61637469766974693a6669656c64206e616d653d22736372697074223e0d0a2020202020202020202020202020202020202020203c61637469766974693a737472696e673e0d0a20202020202020202020202020202020202020202020202069662028747970656f662062706d5f776f726b666c6f774475654461746520213d2027756e646566696e65642729207461736b2e64756544617465203d2062706d5f776f726b666c6f77447565446174650d0a20202020202020202020202020202020202020202020202069662028747970656f662062706d5f776f726b666c6f775072696f7269747920213d2027756e646566696e65642729207461736b2e7072696f72697479203d2062706d5f776f726b666c6f775072696f726974793b0d0a2020202020202020202020202020202020202020203c2f61637469766974693a737472696e673e0d0a2020202020202020202020202020202020203c2f61637469766974693a6669656c643e0d0a2020202020202020202020202020203c2f61637469766974693a7461736b4c697374656e65723e0d0a2020202020202020202020202020203c61637469766974693a7461736b4c697374656e6572206576656e743d22636f6d706c6574652220636c6173733d226f72672e616c66726573636f2e7265706f2e776f726b666c6f772e61637469766974692e7461736b6c697374656e65722e5363726970745461736b4c697374656e6572223e0d0a2020202020202020202020202020202020203c61637469766974693a6669656c64206e616d653d22736372697074223e0d0a2020202020202020202020202020202020202020203c61637469766974693a737472696e673e0d0a202020202020202020202020202020202020202020202020657865637574696f6e2e7365745661726961626c65282762706d5f61737369676e6565272c20706572736f6e293b0d0a2020202020202020202020202020202020202020203c2f61637469766974693a737472696e673e0d0a2020202020202020202020202020202020203c2f61637469766974693a6669656c643e0d0a2020202020202020202020202020203c2f61637469766974693a7461736b4c697374656e65723e0d0a2020202020202020202020203c2f657874656e73696f6e456c656d656e74733e0d0a2020202020202020202020203c68756d616e506572666f726d65723e0d0a202020202020202020202020202020203c7265736f7572636541737369676e6d656e7445787072657373696f6e3e0d0a20202020202020202020202020202020202020203c666f726d616c45787072657373696f6e3e247b696e69746961746f722e6578697374732829203f20696e69746961746f722e70726f706572746965732e757365724e616d65203a202761646d696e277d3c2f666f726d616c45787072657373696f6e3e0d0a202020202020202020202020202020203c2f7265736f7572636541737369676e6d656e7445787072657373696f6e3e0d0a2020202020202020202020203c2f68756d616e506572666f726d65723e0d0a20202020202020203c2f757365725461736b3e0d0a0d0a20202020202020203c73657175656e6365466c6f772069643d27666c6f77352720736f757263655265663d27617070726f766564270d0a2020202020202020202020207461726765745265663d27656e6427202f3e0d0a0d0a20202020202020203c73657175656e6365466c6f772069643d27666c6f77362720736f757263655265663d2772656a6563746564270d0a2020202020202020202020207461726765745265663d27656e6427202f3e0d0a0d0a20202020202020203c656e644576656e742069643d22656e6422202f3e0d0a0d0a202020203c2f70726f636573733e0d0a202020200d0a2020203c212d2d2047726170686963616c20726570726573656e7461696f6e206f66206469616772616d202d2d3e0d0a2020203c62706d6e64693a42504d4e4469616772616d2069643d2242504d4e4469616772616d5f6163746976697469526576696577506f6f6c6564223e0d0a2020202020203c62706d6e64693a42504d4e506c616e652062706d6e456c656d656e743d226163746976697469526576696577506f6f6c6564220d0a20202020202020202069643d2242504d4e506c616e655f6163746976697469526576696577506f6f6c6564223e0d0a2020202020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d227374617274220d0a20202020202020202020202069643d2242504d4e53686170655f7374617274223e0d0a2020202020202020202020203c6f6d6764633a426f756e6473206865696768743d223335222077696474683d2233352220783d2233302220793d22323030223e3c2f6f6d6764633a426f756e64733e0d0a2020202020202020203c2f62706d6e64693a42504d4e53686170653e0d0a2020202020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d227265766965775461736b220d0a20202020202020202020202069643d2242504d4e53686170655f7265766965775461736b223e0d0a2020202020202020202020203c6f6d6764633a426f756e6473206865696768743d223535222077696474683d223130352220783d22313235220d0a202020202020202020202020202020793d22313930223e3c2f6f6d6764633a426f756e64733e0d0a2020202020202020203c2f62706d6e64693a42504d4e53686170653e0d0a2020202020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d227265766965774465636973696f6e220d0a20202020202020202020202069643d2242504d4e53686170655f7265766965774465636973696f6e223e0d0a2020202020202020202020203c6f6d6764633a426f756e6473206865696768743d223430222077696474683d2234302220783d223239302220793d22313937223e3c2f6f6d6764633a426f756e64733e0d0a2020202020202020203c2f62706d6e64693a42504d4e53686170653e0d0a2020202020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d22617070726f766564220d0a20202020202020202020202069643d2242504d4e53686170655f617070726f766564223e0d0a2020202020202020202020203c6f6d6764633a426f756e6473206865696768743d223535222077696474683d223130352220783d22333930220d0a202020202020202020202020202020793d223937223e3c2f6f6d6764633a426f756e64733e0d0a2020202020202020203c2f62706d6e64693a42504d4e53686170653e0d0a2020202020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d2272656a6563746564220d0a20202020202020202020202069643d2242504d4e53686170655f72656a6563746564223e0d0a2020202020202020202020203c6f6d6764633a426f756e6473206865696768743d223535222077696474683d223130352220783d22333930220d0a202020202020202020202020202020793d22323937223e3c2f6f6d6764633a426f756e64733e0d0a2020202020202020203c2f62706d6e64693a42504d4e53686170653e0d0a2020202020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d22656e64222069643d2242504d4e53686170655f656e64223e0d0a2020202020202020202020203c6f6d6764633a426f756e6473206865696768743d223335222077696474683d2233352220783d223535352220793d22333037223e3c2f6f6d6764633a426f756e64733e0d0a2020202020202020203c2f62706d6e64693a42504d4e53686170653e0d0a2020202020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22666c6f7731222069643d2242504d4e456467655f666c6f7731223e0d0a2020202020202020202020203c6f6d6764693a776179706f696e7420783d2236352220793d22323137223e3c2f6f6d6764693a776179706f696e743e0d0a2020202020202020202020203c6f6d6764693a776179706f696e7420783d223132352220793d22323137223e3c2f6f6d6764693a776179706f696e743e0d0a2020202020202020203c2f62706d6e64693a42504d4e456467653e0d0a2020202020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22666c6f7732222069643d2242504d4e456467655f666c6f7732223e0d0a2020202020202020202020203c6f6d6764693a776179706f696e7420783d223233302220793d22323137223e3c2f6f6d6764693a776179706f696e743e0d0a2020202020202020202020203c6f6d6764693a776179706f696e7420783d223239302220793d22323137223e3c2f6f6d6764693a776179706f696e743e0d0a2020202020202020203c2f62706d6e64693a42504d4e456467653e0d0a2020202020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22666c6f7733222069643d2242504d4e456467655f666c6f7733223e0d0a2020202020202020202020203c6f6d6764693a776179706f696e7420783d223331302220793d22313937223e3c2f6f6d6764693a776179706f696e743e0d0a2020202020202020202020203c6f6d6764693a776179706f696e7420783d223331302220793d22313234223e3c2f6f6d6764693a776179706f696e743e0d0a2020202020202020202020203c6f6d6764693a776179706f696e7420783d223339302220793d22313234223e3c2f6f6d6764693a776179706f696e743e0d0a2020202020202020203c2f62706d6e64693a42504d4e456467653e0d0a2020202020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22666c6f7734222069643d2242504d4e456467655f666c6f7734223e0d0a2020202020202020202020203c6f6d6764693a776179706f696e7420783d223331302220793d22323337223e3c2f6f6d6764693a776179706f696e743e0d0a2020202020202020202020203c6f6d6764693a776179706f696e7420783d223331302220793d22333234223e3c2f6f6d6764693a776179706f696e743e0d0a2020202020202020202020203c6f6d6764693a776179706f696e7420783d223339302220793d22333234223e3c2f6f6d6764693a776179706f696e743e0d0a2020202020202020203c2f62706d6e64693a42504d4e456467653e0d0a2020202020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22666c6f7735222069643d2242504d4e456467655f666c6f7735223e0d0a2020202020202020202020203c6f6d6764693a776179706f696e7420783d223439352220793d22313234223e3c2f6f6d6764693a776179706f696e743e0d0a2020202020202020202020203c6f6d6764693a776179706f696e7420783d223537322220793d22313234223e3c2f6f6d6764693a776179706f696e743e0d0a2020202020202020202020203c6f6d6764693a776179706f696e7420783d223537322220793d22333037223e3c2f6f6d6764693a776179706f696e743e0d0a2020202020202020203c2f62706d6e64693a42504d4e456467653e0d0a2020202020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22666c6f7736222069643d2242504d4e456467655f666c6f7736223e0d0a2020202020202020202020203c6f6d6764693a776179706f696e7420783d223439352220793d22333234223e3c2f6f6d6764693a776179706f696e743e0d0a2020202020202020202020203c6f6d6764693a776179706f696e7420783d223535352220793d22333234223e3c2f6f6d6764693a776179706f696e743e0d0a2020202020202020203c2f62706d6e64693a42504d4e456467653e0d0a2020202020203c2f62706d6e64693a42504d4e506c616e653e0d0a2020203c2f62706d6e64693a42504d4e4469616772616d3e0d0a0d0a3c2f646566696e6974696f6e733e	f
11	1	3f5431b3-a3c9-45e2-a2a4-ed0786ab90ddactivitiReviewPooled.png	9	\\x89504e470d0a1a0a0000000d49484452000002580000016a0806000000c63c24e700001c424944415478daeddd7d8c54e5a13f70efad864b28a12435b46949dbfc7e690821a431b7c1a42fe10f732b09b94a2bac0ba8db96b76e29250d545a25182db155136990d2cbedaf5242690d57440d68bbbbbc2ca110502f5508542e50c405d9958b40b7bcdae7779e931d32fbc6eeeceb999dcf2779b233736666613c7ce7eb739e3973d34d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000c52e8470f3d1a347d7efdebdfbc39a9a9a50555565646054575787dadadaf79331dd5e0a00452696ab1d3b7684fafafa70f9f2652343a3a1a1216cdfbefd5c52b6eeb1a7024011893357ca55a64bd6e5aaaaaa83f654002822f1b0a02293ed9114acabf65400282271bd8f1293f98215eca90030000bd6df3e38158eee7d361ca87e341df172bc4d0152b000802e14ac0b67ebc2fe3f2c0e7fdeb4b0d988b7c56d4a908205001458b04e1c78a955b9ca8d770fbcac0429580040a105ebe0d69fb55bb0e2362548c102000a2c58fbab1e69b760c56d4a9082050028580a1600d0bf052b7e6ab0bd8215b729410a16005060c13abcf399760b56dca604295800408105eb4cdd9b61ff1f97b43e3c98dc16b729410a16005060c18ae3d86b6b5a15ac789b02a46001005d2958972e85c37f5ad9faf060725bdca6042958004001052b9ea9fded9dcbdb5d8315b7399bbb82050074a6605dba144e1dde12de7af5c7ed96abdc88f789f7359ba5600100ed14ac8e66adcc66295800408105ab33b356379acd528a142c0050b05abca177b55ce58652a460018082a5c428580040c7cacbcbab92f165054bc102007ac8bdf7de1be28845abacacec76054bc102007aa860e58d57da9ad152b0142c00a0eb05ebfa8c567ed152b0142c00a09b052b7f462b1e3a54b0142c00e84a91306e3014acec0ffb69d7867404e866c1f22a14543cf79695954d1c3f7efccdf17e0a96192cb9008020ed7ac16a56ac72faab6025bffafa183a746898376f5e686c6c54a8142cb90020488ba260ed2a2f2fbfbb65b1ca4ac18a97972d5b965e5eb0608142a560c90500419ae9d7a5cd19ab2c16ac0b172ea497478e1c995e3f73e64c983d7b76183c7870183468509833674e3877ee5cbaedf8f1e321f93b855b6eb9258c1a352aecdab5abd5f3b5bc9ebb7cdb6db7a58f8b33664b962c0993264d4a9f7fc4881161eddab50a965c004090f68c2c14acdcf5587ee2e558aee2f575ebd685f5ebd7a79763c98adb264c98905e8fc52afe1c3b766ca70bd6f3cf3f1f8e1d3b76fd7a7ceec3870fa797870f1fae60c9050004e9c02d587156295ebf78f1623ae2e5785bfeb6ce3c5fcb82d599fb2a58720100413a200a56ee10e1e8d1a3d3ebf1d060cb823564c810050bb900204815acce16ac55ab56a5971f7ae8a1f47a454545ab4384959595cd0e11eedcb9b3d921c25b6fbd35bdbe7ffffeb069d3a62e17acce5c56b0e402802025d305eba6a6d334cc9f3ffffab6b8c87dc68c19e96c551cb15ce516b9c73554e3c68d4b0f278e193326ecd9b327bd7df5ead561d8b061e9ec577c2e054b2e7815000469c9152c43c1920b008254c132142cb900204851b0142cb900802055b00c054b2e00085205cb50b0e402802045c152b0e402008254c132142cb9002048152c43c1920b008254c15262142cb900802055b0142ce402802055b00c054b2e00085205cb50b0e402802045c152b0900b008254c132142cb9002048152c43c1920b0082940ed5d4d42831d91e17938275d59e2a1700046911a9adad3d555f5fafc86474d4d5d5fd3e295807eda97201409016912d5bb6dcb56ddbb60f4e9f3efd7785265b3357b15c5557571f4fc63df654b90020488b4cf2063eb1aaaa6a6f3c1415d7fb189918f1bfc541e54a2e000852402e000852402e00204801b900204801b900204801b9002048bd0a805c0010a4805c0010a4805c0010a4805c0040900272014090027201409002720100410ac80500410ac80500410ac805000429201700042920170004292017000429805c0010a4805c0010a4805c0010a4805c0040900272014090027201409002720100410ac80500410ac80500410ac805000429201700042920170004292017000429805c0010a4805c0010a4805c0010a4805c0040900272014090027281521242b8f9e8d1a3eb77efdefd614d4d4da8aaaa323230aaabab436d6dedfbc9986e2f15a4805ca0c8c472b563c78e505f5f1f2e5fbe6c646834343484eddbb79f4bcad63df654410ac8058a489cb952ae325db22e5755551db4a70a52402e5044e261414526db23295857eda98214900b1491b8de4789c97cc112048214900b0cc482f5b70f4e85a37b9f0d07aa1f4d47bc1c6f5380142c410ac805e842c1ba70b62eecffc3e2f0e74d0b9b8d785bdca60429588214900b5060c13a71e0a556e52a37de3df0b212a46065d99d4d417aa7970250b0c854c13ab8f567ed16acb84d0952b032ea8e649c4dc6d34d3f277a4900058bcc14acfd558fb45bb0e2362548c1ca70b9ca95aa3883d5a064010a563b1e79e4918fad58b1e2278f3df6d86b8b172f6ea8acacbc326ddab4105fac3866cd9a75ed873ffce1d9471f7d74df2f7ef18bff78f8e187ff8f574dc152b04aba5c75743ba06095aea54b977e6dc99225ff3d7dfaf47f24c52a6cdcb831bcf9e69be919c8af5dbb1672ce9c39130e1d3a145e7df5d5f0d4534f8578ffa4709d481e336bfcf8f1377b250b2f58f15383ed15acb84d0952b032e4ce0e4a546ebb3559a06095b6f9f3e77ff6473ffad1be193366fc63fdfaf569812ac4952b57c2ce9d3bc3c30f3ffc8fcacacaf766ce9cf9ef76adc20ad6e19dcfb45bb0e2362548c1ca58b9eaa83c99c90205abb47375f1e2c573bffded6f5ffdcd6f7e131a1b1b4377edddbb372405ebca9c3973364e9e3cf9a376b1ce15ac33756f86fd7f5cd2faf060725bdca604295819704781335385de1f50b00686458b16fdc777bffbdd6bafbffe7ae849e7cf9f0f2b56acb8525151713229599f50b03a77a2d163afad6955b0e26d0a908295a17235b10b8fbba06481825552e56aeedcb9e99710f79675ebd67d387dfaf47349c9fabf0a56076ff2972e85c37f5ad9faf060725bdca60429584558ae7aeaf18082551ce261c13873d59be52ae7c5175fbc9494acba529ec9eaa860c533b5bfbd7379bb6bb0e236677357b0fa49470bdafbfa7900052b9be282f6b8e66adfbe7da1affcf6b7bf3d3975ead4974af51386ed16ac4b97c2a9c35bc25baffeb8dd72951bf13ef1be66b314ac7e28573d7578cf4c16285803d7a2458bde8a0bdafbdaf7bffffd936565657315accecd5a99cd52b0fa59cb05eaff948c079a7e16a2e5e32c7c07056be089e7b98aa762e8894f0b16aaaeaeeedad4a953ffb7bcbcfce30ad6e54ecd5add68364b2952b0faa05c4dcc2b49ff2f19a1e967674b567b8f53b240c11a58e24944376cd810facb4f7ffad30349c17a5cc1badce572951b4a9182d547e5eaa6a619a890373a53b2f2cb556edc9fb7dd9a2c50b00686f8f537f18ceb859e44b48767b1ea9382f57ea9adc5eaec691a0c05ab9fb5577ada2a4b372a596dddff576ddcdf9a2c50b08adfca952b1f8f5f7fd3dfbef39deffc2529595f56b00c05abe725ffb6aabaf8efaba305ed9d2d599d2d572d4b96c385a06015a7f8c5cd2fbffc72bf17ac65cb96ed1c2887093bfb66a66029587d196871c47db3acacecf64e3eacb325a7a3925568b9cafffd0d66b240c12a4a8b172f6e885fdcdcdf76efdebd2f79d1b796d29b9982a560f5f53e99375ee9e07f020a3d4cd75ec9fae72e96ab9633684a162858c5a5b2b2f24a5f9c58b423efbdf7dea9e4453f554a6f660a9682d58ffbe4f5ff096863dfecea1aa8b64ad65fba51aebafbe70114acfe336ddab470eddab5900503e545efec9b9982a560f5f73e99ff3f014db3addd9d316aab6475a75cb52c59d6648182553c7fd1ac18e805abe59b998295fdd189ff9603667cfdeb5fcf15a1a7bbf94fe09fdb98b9fa4bd3edddf174d3737dcc5b14285866b00a2c58a534142c33581928fd7b93b23f31ef1429ddfd1a9c1bcd60157232523358a06015b7acacc16a6868383980d760b5f966d653052bff4dec965b6e099ffffce7434d4d4db79faf370a4b3b6fbc99fcb30ef082d5b258b52c33176eea9d35585d2959d6608182557c1e7ae8a1f70f1c3890954f11ee28a537b39e2e58f1f2a14387d2cba3468dcaf4cc504f152305abe07d72577979f9dd9d38a96fa13346ed9d8aa1ad4f111652b27c8a1014ace214cf83b579f3e64c9c072b79d19f2ca537b3de2858b9eb71262b5e6e686808f7df7f7f18346850183c7870f8c637be11de7df7ddb06eddbaf47ed3a74f4fef17ef13afaf5dbbb6d9f3b5f7f8b86dc4881161f6ecd9e9e55ffef297e9637efef39fa7d7e7cc9913860e1d5a5031dabe7d7b183d7a74fa678fcfbd7af5eaf4f6175f7c318c193326bd3dfe19befad5af8623478eb47a9e279e7822bd9cfc4f8382d57a9fbcd18c5577678e3a3acf55a1677ccff9d79b9c070b14ac62b562c58aa7962e5ddaef056beedcb9fb93177d7c29bd99f546c17ae38d37d2cb63c78e4daf575454a4d7e3edfbf6ed4b2f7fed6b5f0b274f9e4c2f7fe6339f49eff7b9cf7d2ebd7ee2c48966cfd7dee3e3b6499326854f7ef293e9e52f7de94be9b671e3c6a5d73ff5a94f85bbeebaaba08215cbd59e3d7baeff19860d1b96de1e7fc6ebc78e1d4bb7c7cb5ffce2179b3d4faee07deb5bdf3283d5b33a9a41eaec49440b2d59b9c394777b3b0205ab282d5cb8f0130f3cf0c03f1a1b1bfbf31c58f1bb08ff96bc99ff4b29ed64bdb1062b8e2f7ce10b61d7ae5de9b638f3d4727bbc2d6e8bb342f1fad6ad5bd39fb1e0b42c3f377a7c9c29ca9ff5ca15a1dcf5dcec56670b562c500f3ef8605a9ef2b7e7ca5b9cc19a30614248fea7209d596bebef9e9b4153b07a547b3359859ea1bdb3252bf7fb942b50b08a5bf2a6f63fdbb66debb782f5cc33cfbc565656f69fa5b693f5c60cd6dcb973c3902143c2a64d9b9a15a48b172fb67a5c656565ba2dce34e517a2b60a565b8f5fbf7e7dba2dce56c59fbffad5af9a5d5fb3664d41052bae1b8bb7c5af6ecadf1e7f777cade6cd9b17468e1c99de1e17f2e73f4ffc7bc7c387b1342a58bd3693d5f270dd0337157e9eabb64ad6fd05cc98010a56f158b46851f982050b3eec8fd3353436365e9d3a75eaff4e9b36edd30a56f70b562c23b17c0c1f3e3c3dd496bcb6e9b655ab565d3f7cf895af7ca559418a3343f1e773cf3dd7eaf96ef4f8e3c78f379b358bb7e5cf3edde8938c6d15ac5c99cbfd9edcf678d8315e8eb372b9439bb1c4b57c9eb89e2c3723a760f55ac9ca5ff89e5f960a3989687b8f732a0650b0069ecacacaf776ecd8d1e705ebb1c71e7b3379b19797e24ed65b8bdc5f78e185f4fa942953e2e1d7741d559cdd890526ae9f8ac528deefdcb973e1231ff9487adff8b3e561b778f9468f8f23ce96c5fb2e5fbe3cbd1e0fdfe51e1f0f3b1752b0e263e3ef88eba8f2b7c7df17d77bc53f432c83b1c4c505f12d9f27cedae5fede0a56af6979b8f09f9a66a00a3df542cbc775f7fc5b8082954db366cdfab79933675e397bf66c9f95ab37de78e3707979f9ff4c9e3cf9a30a96e144a3455bb27a6266cca70541c11ab8e6cc99f35fcb962dbbda17870a4f9e3cd9180f0d4e9932e58e52ddc9142c054bc972125150b04a403cadc037bff9cd636bd6acb9d29be5aabebefe5a4545c5c9f2f2f2f9a5bc9329580a5691ebee613d870541c12a1d49e9f9f87df7dd7766c3860d977b6be6aaa95c3d5eea3b9982a5600da09255e80c9405eda060959ef889bee9d3a7d7fdfad7bf7eafa7d75cc5c382a53e73a5602958034ca187f91c160405ab74c599aca40cbd143f5d78fcf8f14bdd3d1543fcb4605cd05eca6bae142c054bc94abffec619da41c1a2acac6c6e52b44effe4273f79ebc89123ef157a86f6152b56ec8db356c90bbab2543f2da860295825e2cea6f274e70db6372857a06079159ac46294bc208f24e3c4ac59b3fef2c4134fecdaba75eb1befbcf3cef1fc4275e6cc99d3bb77efde17bfb8397eb760fcfa9b7886f6523c89a882a56099c9ead20c17a06095ec8cd6ed4d65eb95641c4bc6d5f862358d53c9d8958c27e3173797da770b2a580a166d9629e50a50b050b00c05ab074bd6d3ca15a060a160190a56cfb9b329489d8a0150b050b00c054b9002720105cb50b00429201740c152b00429201740c152b010a4805ca018d4d4d42831d91e17938275d59e2a4801b94011a9adad3d555f5fafc86474d4d5d5fd3e295807eda98214900b14912d5bb6dcb56ddbb60f4e9f3efd7785265b3357b15c5557571f4fc63df654410ac8058a4cf2063eb1aaaa6a6f3c1415d7fb189918f1bfc541e54a900272014090027201409002720100410ac80500410ac80500410ac8050004292017000429201700042920170010a4805c0010a4805c0010a4805c0010a4805c900b008214900b008214900b008214900b000852402e000852402e000852402e00204801b900204801b900204801b9002048052920170004292017000429201700042920170010a4805c0010a4805c0010a4805c0040900272014090027201409002720100410ac80500410ac80500410ac80500410a20170004292017000429201700042920170010a4805c0010a4805c0010a4805c0040900272014090027201409002720100410ac80500410ac80500410ac80500410a20170004292017000429201700042920170010a47d298470f3d1a347d7efdebdfbc39a9a9a50555565646054575787dadadaf79331dd5eda6106bc1c73a083b1d72b05a060f59958ae76ecd811eaebebc3e5cb978d0c8d868686b07dfbf67349d9bac79e7ac30cf8d7645cbd51c12a2b2b9be8950250b0fa4c9cb952ae325db22e5755551db4a7769803afdca060ed1a3f7efccd5e250005abcfc4c3828a4cb64752b0aeda533b358bd566c12a2f2fbfdb2b04a060f5a9b8de4789c97cc1b28f772e0bda5a8bb5d7ec15808295d982f5b70f4e85a37b9f0d07aa1f4d47bc1c6f538014ac8ccd625db5f60a40c12a8a8275e16c5dd8ff87c5e1cf9b16361bf1b6b84d0952b0b22229542f98bd0250b08aa2609d38f052ab72951bef1e78590952b0b254b06ecf5b7b75a7570440c1ca6cc13ab8f567ed16acb84d0952b0329609e95a2cb357000a56a60bd6feaa47da2d58719b12a460f597f2f2f28f979595253170ef93c9d89a8c132d16b99f8aa76948eef39fc97d6724973feb550350b0142c43c16ac3942953ee685a6f75b1136771cf1f7111fcae645498e10250b0fab560c54f0db657b0e2362548c1eac37feff193827b0b2c55ed8d837156cbab0aa060f54bc13abcf399760b56dca60429587d2129438fb73c0dc3b469d3c2e38f3f1ed6af5f1f0e1c38104e9d3a152e5ebc18a22b57aea45f01f5f6db6f870d1b36a4f7bbefbefbda2a5aaf24cff369af308082d5a705eb4cdd9b61ff1f97b43e3c98dc16b729410a566f9a3c79f2479bd6575d2f4515151561eddab569812a44636363d8b87163983f7f7ecbef2a3c9bfc1c2f110014ac3e2b58711c7b6d4dab82156f538014ac3e28573bf2cbd0e2c58bd399aaeeb876ed5ad8bc79733a0396f7dc1792e18bb50114ac3e2a58972e85c37f5ad9faf060725bdca6042958bdf8efbbd9cc553c1418cb514fa9abab0b0b172ecc2f59179dfd1d40c1eaf58215cfd4fef6cee5edaec18adb9ccd5dc1ea0d4d6baeae979fddbb7787de10d76cc5f559f93359c9ef1e251d00058b9e2f58972e855387b784b75efd71bbe52a37e27de27dcd6629583df8efbad9f70ac699abde1417c42f5dbab4d9f9b3e239b62404a060d16305aba3592bb3590a566f2b2b2bfbeffc35573d7958b03de7cf9f0f3367cecc5ff8feb48400142c7aac607566d6ea46b3594a9182d51df124a2f99f16ecee82f642bcfefaeb2d17bd7f564a000a163d52b0ba5aae72432952b0baf96ffae55cc989a762e86b4f3df5547ec97a524a000a163d52b00c05abbfc4754fb9afbf89a75028f43c573de1c89123cdce8f555151f13149012858e4dea8aa92f165054bc12a264d5fdc9c969bf8c9befe927f22d2e4dfd1dd120550b0b8feba34bd3954256f5ab72b580a563194fe7848aeaf3e397823cf3df79cc5ee8022e15568bf60e57fdf5a5b6f6e0a968295a5d29f7f62d143870ef55bc18ae7dccafff34a1440c1a2bd8275fdcd22bf6829580a56964a7f72db89dcf6befcf4604befbcf34eb37362491440c1e286052bffcd2dce2228580a56964a7ffeedf10cebfd259e7834ffcf22510045c2286828580a56964a7ffef5fea6600150c89bd9def865b6e3c78fbf39de4fc1cafe28d5f26f060b80622858cd8a554e7f15ace4575f1f43870e0df3e6cd0b8d8d8d0a5569ce605ddf37adc102a058decc76c5f3f8b42c56592958f1f2b265cbd2cb0b162c50a84aab60b52afd3e450840d6dfccda9cb1ca62c1ba70e1427a79e4c891e9f53367ce84d9b36787c1830787418306853973e68473e7cea5db8e1f3f1e92bf53b8e5965bc2a851a3c2ae5dbb5a3d5fcbebb9cbb7dd765bfab83863b664c9923069d2a4f4f9478c18917e258b82d5ffa53fd9b63c0be7c18abf3befcfbb5ca20050902c14acdcf5587ee2e558aee2f575ebd6a56f74f1722c5971db840913d2ebb158c59f63c78eed74c17afef9e7c3b163c7ae5f8fcf7df8f0e1f4f2f0e1c315ac0c94fea4784dcfc299dc172e5c985fb0ee911400147dc18ab34af17a5ce41c47bc1c6fcbdfd699e76b59b03a735f05ab7f4d9b36edd3f9df4578fefcf9fe5e7f75317e3fa2a400a0e80a56ee10e1e8d1a3d3ebf1d060cb823564c81005ab44e4afc3dab061439f17ac952b57e617ac67a504004559b056ad5a955e7ee8a187d2eb151515ad0e11565656363b44b873e7ce6687086fbdf5d6f4fafefdfbc3a64d9bba5cb03a7359c1ea5df98709e37ff7be3c5d435d5d5d3a7396fbfd53a74efd829400a0e80ad64d4da769983f7ffef56d7191fb8c1933d2d9aa38e29b6c6e917b5c43356edcb8f470e2983163c29e3d7bd2db57af5e1d860d1b96ce7ec5e752b08a57d3e91adeca959c8d1b37f659c17af4d147f3bfe4f90509014051152c43c1eaec2c569c51faeb5fffdaebe56af3e6cdf98706af26056b8c840040c152b00694a4e4bc9c2b3c3ff8c10fd213d1f69678c839ffd06032e6480700142c056bc0993c79f22792a2d3902b3d4b972e4dbfc2a637ca555cf767613b000a96825512cacaca6e4fc6d95cf9896ba4e21abd9e3c2cd862e6ea95a4d87d543200a0602958035a3ceb7beedc5871c4d9a6f85536ddfdb4603c9b7f8bafee51ae0050b014acd23165ca943b92027421bf10c533bd17fa7d85f124a2f13c572d66add2c382ca15000a9682558a3359a3922274a2e597467fef7bdf0bbffbddefc28e1d3bd24f1be6d669c59fb150c5d9ae783eb5071f7c30b4f185d3572d680740c152b04a5a9c654a8ad6e32d67b3ba32e279ae9c8a0100054bc1a249d377163e96bf00be9323aee57ad619da0150b0142c05ab1d151515ffd2b43eebc9b848bd8d4388a7cacbcbab929fcb933276af2f6e0640c132142c0050b00c050b0050b0142c0040c152b0000005cb50b000a0b4d4d4d42831d91e17938275d59e0a0045a4b6b6f6547d7dbd2293d1515757f7fba4601db4a7024011d9b265cb5ddbb66dfbe0f4e9d37f5768b2357315cb557575f5f164dc634f05802293bc814facaaaada1b0f45c5f53e462646fc6f7150b9020000000000000000000000000000000000000000e823ff1ff1068bddf62f1bc20000000049454e44ae426082	t
14	1	c1635487-244e-4e07-ad87-61a985006f67bpmn20.xml	13	\\x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d3822203f3e0a0a3c646566696e6974696f6e7320786d6c6e733d22687474703a2f2f7777772e6f6d672e6f72672f737065632f42504d4e2f32303130303532342f4d4f44454c220a202020786d6c6e733a7873693d22687474703a2f2f7777772e77332e6f72672f323030312f584d4c536368656d612d696e7374616e63652220786d6c6e733a61637469766974693d22687474703a2f2f61637469766974692e6f72672f62706d6e220a202020786d6c6e733a62706d6e64693d22687474703a2f2f7777772e6f6d672e6f72672f737065632f42504d4e2f32303130303532342f44492220786d6c6e733a6f6d6764633d22687474703a2f2f7777772e6f6d672e6f72672f737065632f44442f32303130303532342f4443220a202020786d6c6e733a6f6d6764693d22687474703a2f2f7777772e6f6d672e6f72672f737065632f44442f32303130303532342f44492220747970654c616e67756167653d22687474703a2f2f7777772e77332e6f72672f323030312f584d4c536368656d61220a20202065787072657373696f6e4c616e67756167653d22687474703a2f2f7777772e77332e6f72672f313939392f585061746822207461726765744e616d6573706163653d22687474703a2f2f616c66726573636f2e6f7267223e0a0a202020203c70726f6365737320697345786563757461626c653d2274727565222069643d226163746976697469506172616c6c656c52657669657722206e616d653d22506172616c6c656c2052657669657720416e6420417070726f76652041637469766974692050726f63657373223e0a0a20202020202020203c657874656e73696f6e456c656d656e74733e0a2020202020202020202020203c61637469766974693a657865637574696f6e4c697374656e6572206576656e743d2273746172742220636c6173733d226f72672e616c66726573636f2e7265706f2e776f726b666c6f772e61637469766974692e6c697374656e65722e536372697074457865637574696f6e4c697374656e6572223e0a202020202020202009093c61637469766974693a6669656c64206e616d653d22736372697074223e0a2020202020202020202020202020202020202020203c61637469766974693a737472696e673e0a202020202020202020202020202020202020202020202009657865637574696f6e2e7365745661726961626c65282777665f617070726f7665436f756e74272c2030293b0a202020202020202020202020202020202020202020202020657865637574696f6e2e7365745661726961626c65282777665f72656a656374436f756e74272c2030293b0a2020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020657865637574696f6e2e7365745661726961626c65282777665f61637475616c50657263656e74272c2030293b0a202020202020202020202020202020202020202020202020657865637574696f6e2e7365745661726961626c65282777665f61637475616c52656a65637450657263656e74272c2030293b0a2020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202009657865637574696f6e2e7365745661726961626c65282777665f7265766965776572436f756e74272c2062706d5f61737369676e6565732e73697a652829293b0a202020202020202020202020202020202020202020202009657865637574696f6e2e7365745661726961626c65282777665f726571756972656450657263656e74272c2077665f7265717569726564417070726f766550657263656e74293b0a2020202020202020202020202020202020202020203c2f61637469766974693a737472696e673e0a2020202020202020202020202020202020203c2f61637469766974693a6669656c643e0a2020202020202020202020203c2f61637469766974693a657865637574696f6e4c697374656e65723e0a20202020202020203c2f657874656e73696f6e456c656d656e74733e0a20202020202020200a20202020202020203c73746172744576656e742069643d227374617274220a20202020202020202020202061637469766974693a666f726d4b65793d2277663a7375626d6974506172616c6c656c5265766965775461736b22202f3e0a20202020202020200a0909090a20202020202020203c73657175656e6365466c6f772069643d27666c6f773127200a202020202020202020202020736f757263655265663d277374617274270a2020202020202020202020207461726765745265663d277265766965775461736b27202f3e0a0a20202020202020203c757365725461736b2069643d227265766965775461736b22206e616d653d22526576696577205461736b220a20202020202020202020202061637469766974693a666f726d4b65793d2277663a61637469766974695265766965775461736b223e0a20202020202020202020203c657874656e73696f6e456c656d656e74733e0a2020202020202020202020202020203c61637469766974693a7461736b4c697374656e6572206576656e743d226372656174652220636c6173733d226f72672e616c66726573636f2e7265706f2e776f726b666c6f772e61637469766974692e7461736b6c697374656e65722e5363726970745461736b4c697374656e6572223e0a2020202020202020202020202020202020203c61637469766974693a6669656c64206e616d653d22736372697074223e0a2020202020202020202020202020202020202020203c61637469766974693a737472696e673e0a20202020202020202020202020202020202020202020202069662028747970656f662062706d5f776f726b666c6f774475654461746520213d2027756e646566696e65642729207461736b2e64756544617465203d2062706d5f776f726b666c6f77447565446174650a20202020202020202020202020202020202020202020202069662028747970656f662062706d5f776f726b666c6f775072696f7269747920213d2027756e646566696e65642729207461736b2e7072696f72697479203d2062706d5f776f726b666c6f775072696f726974793b0a2020202020202020202020202020202020202020203c2f61637469766974693a737472696e673e0a2020202020202020202020202020202020203c2f61637469766974693a6669656c643e0a2020202020202020202020202020203c2f61637469766974693a7461736b4c697374656e65723e0a2020202020202020202020202020203c61637469766974693a7461736b4c697374656e6572206576656e743d22636f6d706c6574652220636c6173733d226f72672e616c66726573636f2e7265706f2e776f726b666c6f772e61637469766974692e7461736b6c697374656e65722e5363726970745461736b4c697374656e6572223e0a2020202020202020202020202020202020203c61637469766974693a6669656c64206e616d653d22736372697074223e0a2020202020202020202020202020202020202020203c61637469766974693a737472696e673e0a2020202020202020202020202020202020202020202020206966287461736b2e6765745661726961626c654c6f63616c282777665f7265766965774f7574636f6d652729203d3d2027417070726f76652729207b0a20202020202020202020202020202020202020202020202020202020766172206e6577417070726f766564436f756e74203d2077665f617070726f7665436f756e74202b20313b0a0920202020202020202020202020202020202020202020202020766172206e6577417070726f76656450657263656e74616765203d20286e6577417070726f766564436f756e74202f2077665f7265766965776572436f756e7429202a203130303b0a09202020202020202020202020202020202020202020202020200a0920202020202020202020202020202020202020202020202020657865637574696f6e2e7365745661726961626c65282777665f617070726f7665436f756e74272c206e6577417070726f766564436f756e74293b0a0920202020202020202020202020202020202020202020202020657865637574696f6e2e7365745661726961626c65282777665f61637475616c50657263656e74272c206e6577417070726f76656450657263656e74616765293b0a2020202020202020202020202020202020202020202020207d20656c7365207b0a20202020202020202020202020202020202020202020202020202020766172206e657752656a656374436f756e74203d2077665f72656a656374436f756e74202b20313b0a20202020202020202020202020202020202020202020202020202020766172206e657752656a65637450657263656e74616765203d20286e657752656a656374436f756e74202f2077665f7265766965776572436f756e7429202a203130303b0a202020202020202020202020202020202020202020202020202020200a20202020202020202020202020202020202020202020202020202020657865637574696f6e2e7365745661726961626c65282777665f72656a656374436f756e74272c206e657752656a656374436f756e74293b0a20202020202020202020202020202020202020202020202020202020657865637574696f6e2e7365745661726961626c65282777665f61637475616c52656a65637450657263656e74272c206e657752656a65637450657263656e74616765293b0a2020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020203c2f61637469766974693a737472696e673e0a2020202020202020202020202020202020203c2f61637469766974693a6669656c643e0a2020202020202020202020202020203c2f61637469766974693a7461736b4c697374656e65723e0a20202020202020202020203c2f657874656e73696f6e456c656d656e74733e0a20202020202020202020200a20202020202020202020203c68756d616e506572666f726d65723e0a202020202020202020202020202020203c7265736f7572636541737369676e6d656e7445787072657373696f6e3e0a20202020202020202020202020202020202020203c666f726d616c45787072657373696f6e3e247b72657669657741737369676e65652e70726f706572746965732e757365724e616d657d3c2f666f726d616c45787072657373696f6e3e0a202020202020202020202020202020203c2f7265736f7572636541737369676e6d656e7445787072657373696f6e3e0a20202020202020202020203c2f68756d616e506572666f726d65723e0a20202020202020202020200a20202020202020202020203c212d2d20466f7220656163682061737369676e65652c207461736b2069732063726561746564202d2d3e0a20202020202020202020203c6d756c7469496e7374616e63654c6f6f7043686172616374657269737469637320697353657175656e7469616c3d2266616c7365223e0a20202020202020202020200920203c6c6f6f7044617461496e7075745265663e62706d5f61737369676e6565733c2f6c6f6f7044617461496e7075745265663e0a20202020202020202020200920203c696e707574446174614974656d206e616d653d2272657669657741737369676e656522202f3e0a20202020202020202020200920203c636f6d706c6574696f6e436f6e646974696f6e3e247b77665f61637475616c50657263656e74203e3d2077665f7265717569726564417070726f766550657263656e74207c7c2077665f7265717569726564417070726f766550657263656e74203e2028313030202d2077665f61637475616c52656a65637450657263656e74297d3c2f636f6d706c6574696f6e436f6e646974696f6e3e0a20202020202020202020203c2f6d756c7469496e7374616e63654c6f6f704368617261637465726973746963733e0a20202020202020203c2f757365725461736b3e0a0a20202020202020203c73657175656e6365466c6f772069643d27666c6f773227200a202020202020202009736f757263655265663d277265766965775461736b270a2020202020202020202020207461726765745265663d277265766965774465636973696f6e27202f3e0a0a20202020202020203c6578636c757369766547617465776179202069643d227265766965774465636973696f6e22206e616d653d22526576696577204465636973696f6e22202f3e200a0a20202020202020203c73657175656e6365466c6f772069643d27666c6f77332720736f757263655265663d277265766965774465636973696f6e27207461726765745265663d27617070726f76656427203e0a2020202020202020202020203c636f6e646974696f6e45787072657373696f6e207873693a747970653d2274466f726d616c45787072657373696f6e223e247b77665f61637475616c50657263656e74203e3d2077665f7265717569726564417070726f766550657263656e747d3c2f636f6e646974696f6e45787072657373696f6e3e0a20202020202020203c2f73657175656e6365466c6f773e0a0a20202020202020203c73657175656e6365466c6f772069643d27666c6f773427200a2020202020202020736f757263655265663d277265766965774465636973696f6e270a2020202020202020202020207461726765745265663d2772656a656374656427202f3e0a0a202020202020203c757365725461736b2069643d22617070726f76656422206e616d653d22446f63756d656e7420417070726f766564220a20202020202020202020202061637469766974693a666f726d4b65793d2277663a617070726f766564506172616c6c656c5461736b22203e0a2020202020202020202020203c646f63756d656e746174696f6e3e0a2020202020202020202020202020202054686520646f63756d656e742077617320726576696577656420616e6420617070726f7665642e0a2020202020202020202020203c2f646f63756d656e746174696f6e3e0a2020202020202020202020203c657874656e73696f6e456c656d656e74733e0a2020202020202020202020202020203c61637469766974693a7461736b4c697374656e6572206576656e743d226372656174652220636c6173733d226f72672e616c66726573636f2e7265706f2e776f726b666c6f772e61637469766974692e7461736b6c697374656e65722e5363726970745461736b4c697374656e6572223e0a2020202020202020202020202020202020203c61637469766974693a6669656c64206e616d653d22736372697074223e0a2020202020202020202020202020202020202020203c61637469766974693a737472696e673e0a20202020202020202020202020202020202020202020202069662028747970656f662062706d5f776f726b666c6f774475654461746520213d2027756e646566696e65642729207461736b2e64756544617465203d2062706d5f776f726b666c6f77447565446174650a20202020202020202020202020202020202020202020202069662028747970656f662062706d5f776f726b666c6f775072696f7269747920213d2027756e646566696e65642729207461736b2e7072696f72697479203d2062706d5f776f726b666c6f775072696f726974793b0a2020202020202020202020202020202020202020202020200a2020202020202020202020202020202020202020202020202f2f2053657420706172616c6c656c2072657669657720706172616d73206f6e207461736b2c20746f206265206b65707420696e20686973746f72790a2020202020202020202020202020202020202020202020207461736b2e7365745661726961626c654c6f63616c282777665f7265766965776572436f756e74272c2077665f7265766965776572436f756e74293b0a2020202020202020202020202020202020202020202020207461736b2e7365745661726961626c654c6f63616c282777665f726571756972656450657263656e74272c2077665f726571756972656450657263656e74293b0a2020202020202020202020202020202020202020202020207461736b2e7365745661726961626c654c6f63616c282777665f61637475616c50657263656e74272c2077665f61637475616c50657263656e74293b0a2020202020202020202020202020202020202020202020207461736b2e7365745661726961626c654c6f63616c282777665f617070726f7665436f756e74272c2077665f617070726f7665436f756e74293b0a2020202020202020202020202020202020202020203c2f61637469766974693a737472696e673e0a2020202020202020202020202020202020203c2f61637469766974693a6669656c643e0a2020202020202020202020202020203c2f61637469766974693a7461736b4c697374656e65723e0a2020202020202020202020203c2f657874656e73696f6e456c656d656e74733e0a2020202020202020202020203c68756d616e506572666f726d65723e0a202020202020202020202020202020203c7265736f7572636541737369676e6d656e7445787072657373696f6e3e0a20202020202020202020202020202020202020203c666f726d616c45787072657373696f6e3e247b696e69746961746f722e6578697374732829203f20696e69746961746f722e70726f706572746965732e757365724e616d65203a202761646d696e277d3c2f666f726d616c45787072657373696f6e3e0a202020202020202020202020202020203c2f7265736f7572636541737369676e6d656e7445787072657373696f6e3e0a2020202020202020202020203c2f68756d616e506572666f726d65723e0a20202020202020203c2f757365725461736b3e0a20202020202020200a20202020202020203c757365725461736b2069643d2272656a656374656422206e616d653d22446f63756d656e742052656a6563746564220a20202020202020202020202061637469766974693a666f726d4b65793d2277663a72656a6563746564506172616c6c656c5461736b22203e0a2020202020202020202020203c646f63756d656e746174696f6e3e0a2020202020202020202020202020202054686520646f63756d656e742077617320726576696577656420616e642072656a65637465642e0a2020202020202020202020203c2f646f63756d656e746174696f6e3e0a2020202020202020202020203c657874656e73696f6e456c656d656e74733e0a2020202020202020202020202020203c61637469766974693a7461736b4c697374656e6572206576656e743d226372656174652220636c6173733d226f72672e616c66726573636f2e7265706f2e776f726b666c6f772e61637469766974692e7461736b6c697374656e65722e5363726970745461736b4c697374656e6572223e0a2020202020202020202020202020202020203c61637469766974693a6669656c64206e616d653d22736372697074223e0a2020202020202020202020202020202020202020203c61637469766974693a737472696e673e0a20202020202020202020202020202020202020202020202069662028747970656f662062706d5f776f726b666c6f774475654461746520213d2027756e646566696e65642729207461736b2e64756544617465203d2062706d5f776f726b666c6f77447565446174650a20202020202020202020202020202020202020202020202069662028747970656f662062706d5f776f726b666c6f775072696f7269747920213d2027756e646566696e65642729207461736b2e7072696f72697479203d2062706d5f776f726b666c6f775072696f726974793b0a2020202020202020202020202020202020202020202020200a2020202020202020202020202020202020202020202020202f2f2053657420706172616c6c656c2072657669657720706172616d73206f6e207461736b2c20746f206265206b65707420696e20686973746f72790a2020202020202020202020202020202020202020202020207461736b2e7365745661726961626c654c6f63616c282777665f7265766965776572436f756e74272c2077665f7265766965776572436f756e74293b0a2020202020202020202020202020202020202020202020207461736b2e7365745661726961626c654c6f63616c282777665f726571756972656450657263656e74272c2077665f726571756972656450657263656e74293b0a2020202020202020202020202020202020202020202020207461736b2e7365745661726961626c654c6f63616c282777665f61637475616c50657263656e74272c2077665f61637475616c50657263656e74293b0a2020202020202020202020202020202020202020202020207461736b2e7365745661726961626c654c6f63616c282777665f617070726f7665436f756e74272c2077665f617070726f7665436f756e74293b0a2020202020202020202020202020202020202020203c2f61637469766974693a737472696e673e0a2020202020202020202020202020202020203c2f61637469766974693a6669656c643e0a2020202020202020202020202020203c2f61637469766974693a7461736b4c697374656e65723e0a2020202020202020202020203c2f657874656e73696f6e456c656d656e74733e0a2020202020202020202020203c68756d616e506572666f726d65723e0a202020202020202020202020202020203c7265736f7572636541737369676e6d656e7445787072657373696f6e3e0a20202020202020202020202020202020202020203c666f726d616c45787072657373696f6e3e247b696e69746961746f722e6578697374732829203f20696e69746961746f722e70726f706572746965732e757365724e616d65203a202761646d696e277d3c2f666f726d616c45787072657373696f6e3e0a202020202020202020202020202020203c2f7265736f7572636541737369676e6d656e7445787072657373696f6e3e0a2020202020202020202020203c2f68756d616e506572666f726d65723e0a20202020202020203c2f757365725461736b3e0a0a20202020202020203c73657175656e6365466c6f772069643d27666c6f77352720736f757263655265663d27617070726f766564270a2020202020202020202020207461726765745265663d27656e6427202f3e0a0a20202020202020203c73657175656e6365466c6f772069643d27666c6f77362720736f757263655265663d2772656a6563746564270a2020202020202020202020207461726765745265663d27656e6427202f3e0a0a20202020202020203c656e644576656e742069643d22656e6422202f3e0a0a202020203c2f70726f636573733e0a202020200a2020203c212d2d2047726170686963616c20726570726573656e7461696f6e206f66206469616772616d202d2d3e0a2020203c62706d6e64693a42504d4e4469616772616d2069643d2242504d4e4469616772616d5f6163746976697469506172616c6c656c526576696577223e0a2020202020203c62706d6e64693a42504d4e506c616e652062706d6e456c656d656e743d226163746976697469506172616c6c656c526576696577220a20202020202020202069643d2242504d4e506c616e655f6163746976697469506172616c6c656c526576696577223e0a2020202020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d227374617274220a20202020202020202020202069643d2242504d4e53686170655f7374617274223e0a2020202020202020202020203c6f6d6764633a426f756e6473206865696768743d223335222077696474683d2233352220783d2233302220793d22323030223e3c2f6f6d6764633a426f756e64733e0a2020202020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d227265766965775461736b220a20202020202020202020202069643d2242504d4e53686170655f7265766965775461736b223e0a2020202020202020202020203c6f6d6764633a426f756e6473206865696768743d223535222077696474683d223130352220783d22313235220a202020202020202020202020202020793d22313930223e3c2f6f6d6764633a426f756e64733e0a2020202020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d227265766965774465636973696f6e220a20202020202020202020202069643d2242504d4e53686170655f7265766965774465636973696f6e223e0a2020202020202020202020203c6f6d6764633a426f756e6473206865696768743d223430222077696474683d2234302220783d223239302220793d22313937223e3c2f6f6d6764633a426f756e64733e0a2020202020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d22617070726f766564220a20202020202020202020202069643d2242504d4e53686170655f617070726f766564223e0a2020202020202020202020203c6f6d6764633a426f756e6473206865696768743d223535222077696474683d223130352220783d22333930220a202020202020202020202020202020793d223937223e3c2f6f6d6764633a426f756e64733e0a2020202020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d2272656a6563746564220a20202020202020202020202069643d2242504d4e53686170655f72656a6563746564223e0a2020202020202020202020203c6f6d6764633a426f756e6473206865696768743d223535222077696474683d223130352220783d22333930220a202020202020202020202020202020793d22323937223e3c2f6f6d6764633a426f756e64733e0a2020202020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d22656e64222069643d2242504d4e53686170655f656e64223e0a2020202020202020202020203c6f6d6764633a426f756e6473206865696768743d223335222077696474683d2233352220783d223535352220793d22333037223e3c2f6f6d6764633a426f756e64733e0a2020202020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22666c6f7731222069643d2242504d4e456467655f666c6f7731223e0a2020202020202020202020203c6f6d6764693a776179706f696e7420783d2236352220793d22323137223e3c2f6f6d6764693a776179706f696e743e0a2020202020202020202020203c6f6d6764693a776179706f696e7420783d223132352220793d22323137223e3c2f6f6d6764693a776179706f696e743e0a2020202020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22666c6f7732222069643d2242504d4e456467655f666c6f7732223e0a2020202020202020202020203c6f6d6764693a776179706f696e7420783d223233302220793d22323137223e3c2f6f6d6764693a776179706f696e743e0a2020202020202020202020203c6f6d6764693a776179706f696e7420783d223239302220793d22323137223e3c2f6f6d6764693a776179706f696e743e0a2020202020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22666c6f7733222069643d2242504d4e456467655f666c6f7733223e0a2020202020202020202020203c6f6d6764693a776179706f696e7420783d223331302220793d22313937223e3c2f6f6d6764693a776179706f696e743e0a2020202020202020202020203c6f6d6764693a776179706f696e7420783d223331302220793d22313234223e3c2f6f6d6764693a776179706f696e743e0a2020202020202020202020203c6f6d6764693a776179706f696e7420783d223339302220793d22313234223e3c2f6f6d6764693a776179706f696e743e0a2020202020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22666c6f7734222069643d2242504d4e456467655f666c6f7734223e0a2020202020202020202020203c6f6d6764693a776179706f696e7420783d223331302220793d22323337223e3c2f6f6d6764693a776179706f696e743e0a2020202020202020202020203c6f6d6764693a776179706f696e7420783d223331302220793d22333234223e3c2f6f6d6764693a776179706f696e743e0a2020202020202020202020203c6f6d6764693a776179706f696e7420783d223339302220793d22333234223e3c2f6f6d6764693a776179706f696e743e0a2020202020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22666c6f7735222069643d2242504d4e456467655f666c6f7735223e0a2020202020202020202020203c6f6d6764693a776179706f696e7420783d223439352220793d22313234223e3c2f6f6d6764693a776179706f696e743e0a2020202020202020202020203c6f6d6764693a776179706f696e7420783d223537322220793d22313234223e3c2f6f6d6764693a776179706f696e743e0a2020202020202020202020203c6f6d6764693a776179706f696e7420783d223537322220793d22333037223e3c2f6f6d6764693a776179706f696e743e0a2020202020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22666c6f7736222069643d2242504d4e456467655f666c6f7736223e0a2020202020202020202020203c6f6d6764693a776179706f696e7420783d223439352220793d22333234223e3c2f6f6d6764693a776179706f696e743e0a2020202020202020202020203c6f6d6764693a776179706f696e7420783d223535352220793d22333234223e3c2f6f6d6764693a776179706f696e743e0a2020202020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c2f62706d6e64693a42504d4e506c616e653e0a2020203c2f62706d6e64693a42504d4e4469616772616d3e0a0a3c2f646566696e6974696f6e733e	f
15	1	c1635487-244e-4e07-ad87-61a985006f67activitiParallelReview.png	13	\\x89504e470d0a1a0a0000000d49484452000002580000016a0806000000c63c24e700001c6a4944415478daeddd7d8c94778107f0de59c2112448628346899abb18420831cd199af812fe68ce92906bd1c27681b6abf2e68a480c5894121a2aa9b64d8aa188c7791609a20d574a4ba0d5dde5650942a0ed61bb042c0748e942d92d47795979adbf7b7e4f76c8ec1bbbb3af333b9f4ff2cbcecc333bbb0c0fdff9f27b7ef3cc6db7010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000014ba10c2edc78e1ddbb077efde0fabaaaa424545859107a3b2b232545757bf9f8c69f652002830b15ceddab52bd4d5d585ab57af1a7934eaebebc3ce9d3bcf2765eb7e7b2a0014903873a55ce575c9ba5a515171c89e0a0005241e165464f27b2405ebba3d15000a485cefa3c4e47dc10af65400e88705ebd207a7c3b1fdcf8583954bd3112fc7db1420050b00e844c1ba78ae36d4fc6171f8f396054d46bc2d6e5382142c0020c78275f2e0cb2dca5566bc7b70b312a4600100b916ac43db7fd666c18adb9420050b00c8b160d5543cd666c18adb9420050b0050b0142c00a06f0b567cd7605b052b6e5382142c0020c7827564f7b36d16acb84d0952b000801c0bd6d9da3743cd1f97b43c3c98dc16b729410a16009063c18ae3f86b6b5b14ac789b02a46001009d295857ae84237f5ad5f2f060725bdca604295800400e052b9ea9fdeddd2bda5c8315b7399bbb82050074a4605db9124e1fd916de7af5c76d96abcc88f789f7359ba56001006d14acf666adcc66295800408e05ab23b356b79acd528a142c0050b09abda077b65c658652a460018082a5c428580040fb4a4b4b2b92f165054bc10200bac9030f3c10e28845aba4a4e42e054bc10200baa960658d575a9bd152b0142c00a0f305ebe68c5676d152b0142c00a08b052b7b462b1e3a54b0142c00e84c91306e3114acfc1ff6d3ce0de908d0c582e559c8a978ee2f292999306edcb8dbe3fd142c335872010041daf982d5a45865f455c14a7ef4cd3164c8903077eedcd0d0d0a0502958720140901644c1da535a5a7a5ff362952f052b5e5ebe7c797a79fefcf90a958225170004695e3f2fadce58e563c1ba78f1627a79c48811e9f5b367cf8659b366854183068581030786d9b36787f3e7cfa7db4e9c3811923f531830604018397264d8b3674f8bc76b7e3d73f9ce3bef4cbf2fce982d59b2244c9c38317dfce1c3878775ebd6295872010041da3df2a16065aec7f2132fc77215afaf5fbf3e6cd8b021bd1c4b56dc367efcf8f47a2c56f1eb9831633a5cb05e78e18570fcf8f19bd7e3631f397224bd3c6cd830054b2e002048fb6fc18ab34af1fae5cb97d3112fc7dbb2b775e4f19a17ac8edc57c1920b0008d27e51b0328708478d1a955e8f87069b17acc183072b58c8050041aa6075b460ad5ebd3abdbc68d1a2f47a5959598b4384e5e5e54d0e11eedebdbbc921c23beeb823bd5e535313b66cd9d2e982d591cb0a965c0010a4e475c1baadf1340df3e6cdbbb92d2e729f3e7d7a3a5b15472c579945ee710dd5d8b163d3c389a3478f0efbf6ed4b6f5fb3664d183a74683afb151f4bc1920b9e0500415a7405cb50b0e402802055b00c054b2e000852142c054b2e002048152c43c1920b008254c132142cb900204851b0142cb900802055b00c054b2e00085205cb50b0e402802055b09418054b2e002048152c050bb9002048152c43c1920b008254c132142cb900204851b0142ce402802055b00c054b2e00085205cb50b0e4028020a55d5555554a4c7e8fcb49c1ba6e4f950b0082b4805457579faeabab5364f274d4d6d6fe3e295887eca97201409016906ddbb6ddbb63c78e0fce9c39f3378526bf66ae62b9aaacac3c918cfbeda9720140901698e4057c424545c5fe78282aaef731f262c4bf8b43ca955c0010a4805c0010a4805c0040900272014090027201409002720140907a1600b900204801b900204801b900204801b900802005e402802005e402802005e402008214900b008214900b008214900b000852402e000852402e000852402e00085200b900204801b900204801b900204801b900802005e402802005e402802005e402008214900b008214900b008214900b000852402e000852402e000852402e00085200b900204801b900204801b900204801b900802005e402802005e402c5248470fbb163c736ecddbbf7c3aaaaaa50515161e4c1a8acac0cd5d5d5ef27639abd54900272810213cbd5ae5dbb425d5d5db87af5aa9147a3bebe3eecdcb9f37c52b6eeb7a70a52402e5040e2cc957295d725eb6a4545c5217baa2005e40205241e165464f27b2405ebba3d55900272810212d7fb2831795fb004812005e402fdb1605dfae07438b6ffb970b072693ae2e5789b02a4600952402e40270ad6c573b5a1e60f8bc39fb72c6832e26d719b12a4600952402e408e05ebe4c1975b94abcc78f7e0662548c1ca67f73406e93d9e0a40c122af0ad6a1ed3f6bb360c56d4a908295a7ee4ec6b9643cd3f87582a70450b0c89b825553f1589b052b6e538214ac3c2e5799521567b0ea952c40c16ac3638f3df6b1952b57fee4f1c71f7f6df1e2c5f5e5e5e5d7a64e9d1ae29315c7cc99336ffcf0873f3cb774e9d203bff8c52ffee3d1471ffd67cf9a82a5601575b96aef7640c12a5ecb962dfbda92254bfe67dab4697f4f8a55d8b4695378f3cd37d33390dfb87123649c3d7b361c3e7c38bcfaeaabe1e9a79f0ef1fe49e13a997ccfcc71e3c6ddee99ccbd60c5770db655b0e2362548c1ca23f7b453a232dbadc90205abb8cd9b37efb33ffad18f0e4c9f3efdef1b366c480b542eae5dbb1676efde1d1e7df4d1bf979797bf3763c68c7fb76be556b08eec7eb6cd8215b729410a569e95abf6ca93992c50b08a3b57172f5e3ce7dbdffef6f5dffce637a1a1a12174d5fefdfb4352b0aecd9e3d7bd3a449933e6a17eb58c13a5bfb66a8f9e39296870793dbe2362548c1ca0377e7383395ebfd0105ab7f58b870e17f7cf7bbdfbdf1faebaf87ee74e1c285b072e5ca6b656565a79292f50905ab63271a3dfedada16052bdea60029587954ae2674e2fb2e2a59a0601555b99a33674efa21c43d65fdfaf51f4e9b36ed7c52b2fe45c16ae745feca9570e44fab5a1e1e4c6e8bdb942005ab00cb55777d3fa0601586785830ce5cf564b9ca78e9a597ae2425abb69867b2da2b58f14ced6fef5ed1e61aacb8cdd9dc15ac3ed2de82f6de7e1c40c1ca4f71417b5c7375e0c081d05b7efbdbdf9e9a3265cacbc5fa0ec3360bd6952be1f4916de1ad577fdc66b9ca8c789f785fb3590a561f94abee3abc67260b14acfe6be1c2856fc505edbdedfbdffffea9929292390a56c766adcc6629587dacf902f57f48c6c38d5f73d1fcfb2c7c0705abff89e7b98aa762e88e770be6aab6b6f6c6942953feafb4b4f4e30ad6d50ecd5add6a364b2952b07aa15c4dc82a49ff958cd0f8b5a325abadef53b240c1ea5fe24944376edc18faca4f7ffad38349c17a42c1badae97295194a9182d54be5eab6c619a890353a52b2b2cb55663c94b5dd9a2c50b0fa87f8f137f18cebb99e44b49b67b1ea9282f57eb1adc5eae8691a0c05ab8fb5557a5a2b4bb72a59adddff57addcdf9a2c50b00adfaa55ab9e881f7fd3d7bef39deffc2529595f56b00c05abfb25ffb62a3af9efabbd05ed1d2d591d2d57cd4b96c385a06015a6f8c1cd9b376feef382b57cf9f2ddfde53061475fcc142c05ab37032d8eb86f969494dcd5c16feb68c969af64e55aaeb27f7ebd992c50b00ad2e2c58bebe30737f7b5bd7bf71e489ef4edc5f462a6602958bdbd4f668d57daf94f40ae87e9da2a59ffd8c972d57c064dc90205abb09497975feb8d138bb6e7bdf7de3b9d3ce9a78be9c54cc152b0fa709fbcf99f8056f6cdceae816aad64fda50be5aaabbf0fa060f59da953a7861b376e847cd05f9ef48ebe9829580a565fef93d9ff09689c6dedea8c516b25ab2be5aa79c9b2260b14acc2f983e68bfe5eb09abf982958f93f3af077d96fc6d7bffef54c117aa68bff04feb19599abbf34dede15cf343ed6c7bc44818265062bc782554c43c132839507a57f7f52f627649d22a5ab1f8373ab19ac5c4e466a060b14acc2962f6bb0eaebeb4ff5e33558adbe987557c1ca7e111b306040f8fce73f1faaaaaabafc783d5158da78e1cdcbdfb59f17ace6c5aa7999b9785bcfacc1ea4cc9b2060b14acc2b368d1a2f70f1e3c982fef22dc554c2f66dd5db0e2e5c3870fa797478e1c99d73343dd558c14ac9cf7c93da5a5a5f775e0a4beb9ce18b5752a86d6de45984bc9f22e4250b00a533c0fd6d6ad5bf3e23c58c993fe5431bd98f544c1ca5c8f3359f1727d7d7d78e8a187c2c08103c3a04183c237bef18df0eebbef86f5ebd7a7f79b366d5a7abf789f787dddba754d1eafadef8fdb860f1f1e66cd9a955efee52f7f997ecfcf7ffef3f4faecd9b3c3902143722a463b77ee0ca3468d4a7ff7f8d86bd6ac496f7fe9a597c2e8d1a3d3dbe3eff0d5af7e351c3d7ab4c5e33cf9e493e9e5e43f0d0a56cb7df25633565d9d396aef3c57b99ef13de35f6f731e2c50b00ad5ca952b9f5eb66c599f17ac3973e6d4244ffab8627a31eb8982f5c61b6fa497c78c19935e2f2b2b4bafc7db0f1c38905efedad7be164e9d3a955efecc673e93deef739ffb5c7afde4c9934d1eafadef8fdb264e9c183ef9c94fa697bff4a52fa5dbc68e1d9b5effd4a73e15eebdf7de9c0a562c57fbf6edbbf93b0c1d3a34bd3d7e8dd78f1f3f9e6e8f97bff8c52f36799c4cc1fbd6b7be6506ab7bb53783d4d19388e65ab2328729eff372040a56415ab060c1271e7ef8e1bf373434f4e539b0e267115e4a5eccffa99876b29e588315c717bef085b067cf9e745b9c796abe3dde16b7c559a1787dfbf6ede9d758709a979f5b7d7f9c29ca9ef5ca14a1ccf5ccec56470b562c508f3cf2485a9eb2b767ca5b9cc11a3f7e7c48fe5390ceacb5f667cfcca02958ddaaad99ac5ccfd0ded19295f979ca152858852d7951fbdf1d3b76f459c17af6d9675f2b2929f9cf62dbc97a62066bce9c3961f0e0c161cb962d4d0ad2e5cb975b7c5f797979ba2dce346517a2d60a566bdfbf61c386745b9cad8a5f7ff5ab5f35b9be76edda9c0a565c37166f8b1fdd94bd3dfeecf85ccd9d3b378c183122bd3d2ee4cf7e9cf8e78e870f636954b07a6c26abf9e1ba876fcbfd3c57ad95ac877298310314acc2b170e1c2d2f9f3e77fd817a76b686868b83e65ca94ff9b3a75eaa715acae17ac584662f918366c587aa82d796ed36dab57afbe79f8f02b5ff94a9382146786e2d7e79f7fbec5e3ddeafb4f9c38d164d62cde963dfb74ab7732b656b032652ef37332dbe361c77839ceca650e6dc612d7fc71e27ab2cc8c9c82d563252b7be17b7659cae524a26d7d9f53318082d5ff949797bfb76bd7ae5e2f588f3ffef89bc993bda21877b29e5ae4fee28b2fa6d7274f9e1c0fbfa6eba8e2ec4e2c3071fd542c46f17ee7cf9f0f1ff9c847d2fbc6afcd0fbbc5cbb7fafe38e26c59bcef8a152bd2ebf1f05de6fbe361e75c0a56fcdef833e23aaaecedf1e7c5f55ef17788653096b8b820bef9e3c459bbcc9f5bc1ea31cd0f17fe43e30c54aea75e68fe7d5d3dff16a060e5a7993367fedb8c1933ae9d3b77aed7cad51b6fbc71a4b4b4f47f274d9af45105cb70a2d1822d59dd3133e6dd82a060f55fb367cffeefe5cb975fef8d4385a74e9d6a888706274f9e7c77b1ee640a9682a564398928285845209e56e09bdffce6f1b56bd75eebc97255575777a3acacec546969e9bc62dec90ab1605dba7429d4d4d4a45fbb72bb82d52f74f5b09ec382a060158fa4f47cfcc1071f3cbb71e3c6ab3d3573d558ae9e28f69dac100b562c4bc9af9e7eedcaed0a56bf2b59b9ce4059d00e0a56f189efe89b366d5aedaf7ffdebf7ba7bcd553c2c58ec33570a9682d5cfe47a98cf614150b08a579cc94acad0cbf1dd85274e9cb8d2d55331c4770bc605edc5bce64ac152b094acf4e36f9ca11d142c4a4a4ae62445ebcc4f7ef293b78e1e3dfa5eae67685fb972e5fe386b953ca1ab8af5dd820a96825524ee692c4ff7dc627bbd72050a9667a1512c46c913f258324ece9c39f32f4f3ef9e49eeddbb7bff1ce3bef9cc82e5467cf9e3db377efde03f1839be3670bc68fbf8967682fc693882a580a9699ac4ecd70010a56d1ce68ddd558b65e49c6f1645c8f4f56e3389d8c3dc9782a7e7073b17db6a082a560d16a9952ae00050b054bc152b0bab1643da35c010a160a9682a560759f7b1a83d4a91800050b054bc152b00429201750b0142c054b90027201142c054b90027201142c050b410ac8050a415555958295dfe37252b0aedb53052920172820d5d5d5a7ebeaea0aaa745cba74292d4bf16b576e2f84515b5bfbfba4601db2a70a52402e5040b66ddb76ef8e1d3b3e3873e6ccdf0af1f0593f1e9763b9aaacac3c918cfbeda98214900b1498e4057c424545c5fe78282aaef731f262c4bf8b43ca952005e402802005e402802005e402008214900b008214900b008214900b000852402e000852402e000852402e00204801b900204801b900204801b900204801b920170004292017000429201700042920170010a4805c0010a4805c0010a4805c0040900272014090027201409002720140900a52402e000852402e000852402e000852402e00204801b900204801b900204801b900802005e402802005e402802005e402008214900b008214900b008214900b008214402e000852402e000852402e000852402e00204801b900204801b900204801b900802005e402802005e402802005e402008214900b008214900b008214900b008214402e000852402e000852402e000852402e0020487b5308e1f663c78e6dd8bb77ef87555555a1a2a2c2c88351595919aaababdf4fc6347b69bb19b039e6403b63bf670a40c1ea35b15ceddab52bd4d5d585ab57af1a7934eaebebc3ce9d3bcf2765eb7e7bea2d33e05f9371fd5605aba4a46482670a40c1ea3571e64ab9caeb9275b5a2a2e2903db5dd1c78e516056bcfb871e36ef72c012858bd261e165464f27b2405ebba3db543b358ad16acd2d2d2fb3c43000a56af8aeb7d9498bc2f58f6f18e65416b6bb1f69bbd0250b0f2b6605dfae07438b6ffb970b072693ae2e5789b02a460e5d92cd6756baf0014ac82285817cfd5869a3f2c0e7fdeb2a0c988b7c56d4a9082952f9242f5a2d92b0005ab200ad6c9832fb7285799f1eec1cd4a9082954f05ebaeacb557f778460014acbc2d5887b6ffaccd8215b729410a569e6542ba16cbec15808295d705aba6e2b1360b56dca60429587da5b4b4f4e3252525490c3cf05432b627e364b345eea7e3691a92fbfc6772dfe9c9e5cf7ad600142c05cb50b05a3179f2e4bb1bd75b5deec059dcb3475c04bf27196566b80014ac3e2d58f15d836d15acb84d0952b07af1df7b7ca7e0fe1c4b555be3509cd5f2ac0228587d52b08eec7eb6cd8215b729410a566f48cad013cd4fc33075ead4f0c4134f840d1b368483070f86d3a74f87cb972f87e8dab56be94740bdfdf6db61e3c68de9fd1e7cf0c1d68ad62bc9e37cda330ca060f56ac13a5bfb66a8f9e39296870793dbe2362548c1ea4993264dfa68e3faaa9ba5a8acac2cac5bb72e2d50b9686868089b366d0af3e6cd6bfe5985e792afe324028082d56b052b8ee3afad6d51b0e26d0a9082d50be56a5776195abc78713a53d515376edc085bb76e4d67c0b21efb62327cb0368082d54b05ebca9570e44fab5a1e1e4c6e8bdb942005ab07ff7d3799b98a87026339ea2eb5b5b561c18205d925ebb2b3bf0328583d5eb0e299dadfdebda2cd3558719bb3b92b583da171cdd5cdf2b377efded013e29aadb83e2b7b262bf9d923a503a060d1fd05ebca9570fac8b6f0d6ab3f6eb35c6546bc4fbcafd92c05ab1bff5d37f95cc13873d593e282f865cb9635397f563cc7968400142cbaad60b5376b65364bc1ea69252525ff93bde6aa3b0f0bb6e5c2850b61c68c19d90bdf9f9110808245b715ac8ecc5add6a364b2952b0ba229e4434fbdd825d5dd09e8bd75f7fbdf9a2f7cf4a0940c1a25b0a5667cb556628450a5617ff4d6fce949c782a86def6f4d34f6797aca7a404a060d12d05cb50b0fa4a5cf794f9f89b780a855ccf73d51d8e1e3ddae4fc586565651f9314808245e685aa22195f56b014ac42d2f8c1cd69b989efeceb2bd927224dfe1ddd275100058b9bcf4be38b4345f2a2759782a5601542e98f87e47aeb9d83b7f2fcf3cf5bec0e28129e85b60b56f6e7adb5f6e2a6602958f954fab34f2c7af8f0e13e2b58f19c5bd9bfaf4401142cda2a58375f2cb28b9682a560e553e94f6e3b99d9de9bef1e6cee9d77de69724e2c89022858dcb26065bfb8c55904054bc1caa7d29f7d7b3cc37a5f89271ecdfe5d240aa04818390d054bc1caa7d29f7dbdaf295800e4f262b63f7e98edb871e36e8ff753b0f27f146bf9378305402114ac26c52aa3af0a56f2a36f8e21438684b973e78686860685aa3867b06eee9bd6600150282f667be2797c9a17ab7c2958f1f2f2e5cbd3cbf3e7cf57a88aab60b528fdde450840bebf98b53a63958f05ebe2c58be9e5112346a4d7cf9e3d1b66cd9a15060d1a14060e1c1866cf9e1dce9f3f9f6e3b71e24448fe4c61c0800161e4c89161cf9e3d2d1eaff9f5cce53befbc33fdbe3863b664c9923071e2c4f4f1870f1f9e7e248b82d5f7a53fd9b6221fce83157f76d6efbb42a20090937c285899ebb1fcc4cbb15cc5ebebd7af4f5fe8e2e558b2e2b6f1e3c7a7d763b18a5fc78c19d3e182f5c20b2f84e3c78fdfbc1e1ffbc89123e9e561c38629587950fa93e2352d1fcee4be60c182ec8275bfa400a0e00b569c558ad7e322e738e2e5785bf6b68e3c5ef382d591fb2a587d6bead4a99fcefe2cc20b172ef4f5faabcbf1f3112505000557b0328708478d1a955e8f87069b17acc183072b5845227b1dd6c68d1b7bbd60ad5ab52abb603d27250028c882b57af5eaf4f2a2458bd2eb6565652d0e11969797373944b87bf7ee268708efb8e38ef47a4d4d4dd8b2654ba70b56472e2b583d2bfb3061fc7befcdd335d4d6d6a63367999f3f65ca942f4809000aae60ddd6789a8679f3e6dddc1617b94f9f3e3d9dad8a23bec86616b9c7355463c78e4d0f278e1e3d3aecdbb72fbd7dcd9a3561e8d0a1e9ec577c2c05ab70359eaee1ad4cc9d9b46953af15aca54b97667fc8f38b120280822a588682d5d159ac38a3f4d7bffeb5c7cbd5d6ad5bb30f0d5e4f0ad66809018082a560f52b49c9d99c293c3ff8c10fd213d1f69478c839fbd06032664b0700142c05abdf993469d22792a2539f293dcb962d4b3fc2a627ca555cf767613b000a968255144a4a4aee4ac6b94cf9896ba4e21abdee3c2cd86ce6ea95a4d87d543200a0602958fd5a3ceb7be6dc5871c4d9a6f851365d7db7603c9b7fb38fee51ae0050b014ace23179f2e4bb93027431bb10c533bde7fa7985f124a2f13c57cd66add2c382ca15000a9682558c335923932274b2f987467fef7bdf0bbffbddefc2ae5dbbd2771b66d669c5afb150c5d9ae783eb5471e7924b4f281d3d72d680740c152b08a5a9c654a8ad613cd67b33a33e279ae9c8a0100054bc1a251e367163e9ebd00be8323aee57ace19da0150b0142c05ab0d656565ffd4b83eeba9b848bd954388a74b4b4b2b92af2b9232f6800f6e0640c132142c0050b00c050b0050b0142c0040c152b0000005cb50b000a0b85455552931f93d2e2705ebba3d15000a487575f5e9baba3a45264f476d6dedef938275c89e0a000564dbb66df7eed8b1e3833367cefc4da1c9af99ab58ae2a2b2b4f24e37e7b2a001498e4057c424545c5fe78282aaef731f262c4bf8b43ca150000000000000000000000000000000000000000402ff97f6d17f4e1e3d049060000000049454e44ae426082	t
18	1	47efaffd-dbe9-4321-a9db-323adbec5189bpmn20.xml	17	\\x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d3822203f3e0a0a3c646566696e6974696f6e7320786d6c6e733d22687474703a2f2f7777772e6f6d672e6f72672f737065632f42504d4e2f32303130303532342f4d4f44454c220a202020786d6c6e733a7873693d22687474703a2f2f7777772e77332e6f72672f323030312f584d4c536368656d612d696e7374616e63652220786d6c6e733a61637469766974693d22687474703a2f2f61637469766974692e6f72672f62706d6e220a202020786d6c6e733a62706d6e64693d22687474703a2f2f7777772e6f6d672e6f72672f737065632f42504d4e2f32303130303532342f44492220786d6c6e733a6f6d6764633d22687474703a2f2f7777772e6f6d672e6f72672f737065632f44442f32303130303532342f4443220a202020786d6c6e733a6f6d6764693d22687474703a2f2f7777772e6f6d672e6f72672f737065632f44442f32303130303532342f44492220747970654c616e67756167653d22687474703a2f2f7777772e77332e6f72672f323030312f584d4c536368656d61220a20202065787072657373696f6e4c616e67756167653d22687474703a2f2f7777772e77332e6f72672f313939392f585061746822207461726765744e616d6573706163653d22687474703a2f2f616c66726573636f2e6f7267223e0a0a202020203c70726f6365737320697345786563757461626c653d2274727565222069643d226163746976697469506172616c6c656c47726f757052657669657722206e616d653d22506172616c6c656c2047726f75702052657669657720416e6420417070726f76652041637469766974692050726f63657373223e0a0a20202020202020203c657874656e73696f6e456c656d656e74733e0a2020202020202020202020203c61637469766974693a657865637574696f6e4c697374656e6572206576656e743d2273746172742220636c6173733d226f72672e616c66726573636f2e7265706f2e776f726b666c6f772e61637469766974692e6c697374656e65722e536372697074457865637574696f6e4c697374656e6572223e0a202020202020202009093c61637469766974693a6669656c64206e616d653d22736372697074223e0a2020202020202020202020202020202020202020203c61637469766974693a737472696e673e0a202020202020202020202020202020202020202020202009657865637574696f6e2e7365745661726961626c65282777665f617070726f7665436f756e74272c2030293b0a202020202020202020202020202020202020202020202020657865637574696f6e2e7365745661726961626c65282777665f72656a656374436f756e74272c2030293b0a2020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202009657865637574696f6e2e7365745661726961626c65282777665f61637475616c50657263656e74272c2030293b0a202020202020202020202020202020202020202020202020657865637574696f6e2e7365745661726961626c65282777665f61637475616c52656a65637450657263656e74272c2030293b0a2020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202009657865637574696f6e2e7365745661726961626c65282777665f726571756972656450657263656e74272c2077665f7265717569726564417070726f766550657263656e74293b0a2020202020202020202020202020202020202020203c2f61637469766974693a737472696e673e0a2020202020202020202020202020202020203c2f61637469766974693a6669656c643e0a2020202020202020202020203c2f61637469766974693a657865637574696f6e4c697374656e65723e0a20202020202020203c2f657874656e73696f6e456c656d656e74733e0a20202020202020200a20202020202020203c73746172744576656e742069643d227374617274220a20202020202020202020202061637469766974693a666f726d4b65793d2277663a7375626d697447726f75705265766965775461736b22202f3e0a20202020202020200a0909090a20202020202020203c73657175656e6365466c6f772069643d27666c6f773127200a202020202020202020202020736f757263655265663d277374617274270a2020202020202020202020207461726765745265663d277265766965775461736b273e0a2020202020202020202020203c212d2d20544f444f3a204f6e6365206d756c7469496e7374616e63654c6f6f7043686172616374657269737469637320737570706f7274207573696e672065787072657373696f6e206173206c6f6f7044617461496e7075745265662c2072656d6f7665202777665f67726f75704d656d6265727327207661726961626c6520202d2d3e0a2020202020202020202020203c657874656e73696f6e456c656d656e74733e0a09202020202020202020202020203c61637469766974693a657865637574696f6e4c697374656e6572206576656e743d2273746172742220636c6173733d226f72672e616c66726573636f2e7265706f2e776f726b666c6f772e61637469766974692e6c697374656e65722e536372697074457865637574696f6e4c697374656e6572223e0a09202020202020202009093c61637469766974693a6669656c64206e616d653d22736372697074223e0a092020202020202020202020202020202020202020203c61637469766974693a737472696e673e0a09202020202020202020202020202020202020202020202020766172206d656d62657273203d2070656f706c652e6765744d656d626572732862706d5f67726f757041737369676e6565293b0a2020202020202020202020202020202020202020202020202020202020202020696628776f726b666c6f772e6d617847726f7570526576696577657273203e20302026616d703b26616d703b206d656d626572732e6c656e677468203e20776f726b666c6f772e6d617847726f7570526576696577657273290a20202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020207468726f77206e6577204572726f7228224e756d626572206f6620726576696577657273206578636565647320746865206d6178696d756d3a2022202b206d656d626572732e6c656e677468202b2022286d61782069732022202b20776f726b666c6f772e6d617847726f7570526576696577657273202b20222922293b0a20202020202020202020202020202020202020202020202020202020202020207d0a09202020202020202020202020202020202020202020202020766172206d656d6265724e616d6573203d206e6577206a6176612e7574696c2e41727261794c69737428293b0a092020202020202020202020202020202020202020202020200a09202020202020202020202020202020202020202020202020666f7228766172206920696e206d656d6265727329200a2020202020202020202020202020202020202020202020202020207b0a09202020202020202020202020202020202020202020202020202020206d656d6265724e616d65732e616464286d656d626572735b695d2e70726f706572746965732e757365724e616d65293b0a092020202020202020202020202020202020202020202020207d0a09202020202020202020202020202020202020202020202009657865637574696f6e2e7365745661726961626c65282777665f67726f75704d656d62657273272c206d656d6265724e616d6573293b0a09202020202020202020202020202020202020202020202020657865637574696f6e2e7365745661726961626c65282777665f7265766965776572436f756e74272c206d656d6265724e616d65732e73697a652829293b0a092020202020202020202020202020202020202020203c2f61637469766974693a737472696e673e0a092020202020202020202020202020202020203c2f61637469766974693a6669656c643e0a092020202020202020202020203c2f61637469766974693a657865637574696f6e4c697374656e65723e0a092020202020202020203c2f657874656e73696f6e456c656d656e74733e0a20202020202020203c2f73657175656e6365466c6f773e0a0a20202020202020203c757365725461736b2069643d227265766965775461736b22206e616d653d22526576696577205461736b220a20202020202020202020202061637469766974693a666f726d4b65793d2277663a61637469766974695265766965775461736b223e0a20202020202020202020203c657874656e73696f6e456c656d656e74733e0a2020202020202020202020202020203c61637469766974693a7461736b4c697374656e6572206576656e743d226372656174652220636c6173733d226f72672e616c66726573636f2e7265706f2e776f726b666c6f772e61637469766974692e7461736b6c697374656e65722e5363726970745461736b4c697374656e6572223e0a2020202020202020202020202020202020203c61637469766974693a6669656c64206e616d653d22736372697074223e0a2020202020202020202020202020202020202020203c61637469766974693a737472696e673e0a20202020202020202020202020202020202020202020202069662028747970656f662062706d5f776f726b666c6f774475654461746520213d2027756e646566696e65642729207461736b2e64756544617465203d2062706d5f776f726b666c6f77447565446174650a20202020202020202020202020202020202020202020202069662028747970656f662062706d5f776f726b666c6f775072696f7269747920213d2027756e646566696e65642729207461736b2e7072696f72697479203d2062706d5f776f726b666c6f775072696f726974793b0a2020202020202020202020202020202020202020203c2f61637469766974693a737472696e673e0a2020202020202020202020202020202020203c2f61637469766974693a6669656c643e0a2020202020202020202020202020203c2f61637469766974693a7461736b4c697374656e65723e0a2020202020202020202020202020203c61637469766974693a7461736b4c697374656e6572206576656e743d22636f6d706c6574652220636c6173733d226f72672e616c66726573636f2e7265706f2e776f726b666c6f772e61637469766974692e7461736b6c697374656e65722e5363726970745461736b4c697374656e6572223e0a2020202020202020202020202020202020203c61637469766974693a6669656c64206e616d653d22736372697074223e0a2020202020202020202020202020202020202020203c61637469766974693a737472696e673e0a2020202020202020202020202020202020202020202020206966287461736b2e6765745661726961626c654c6f63616c282777665f7265766965774f7574636f6d652729203d3d2027417070726f76652729207b0a20202020202020202020202020202020202020202020202020202020766172206e6577417070726f766564436f756e74203d2077665f617070726f7665436f756e74202b20313b0a0920202020202020202020202020202020202020202020202020766172206e6577417070726f76656450657263656e74616765203d20286e6577417070726f766564436f756e74202f2077665f7265766965776572436f756e7429202a203130303b0a09202020202020202020202020202020202020202020202020200a0920202020202020202020202020202020202020202020202020657865637574696f6e2e7365745661726961626c65282777665f617070726f7665436f756e74272c206e6577417070726f766564436f756e74293b0a0920202020202020202020202020202020202020202020202020657865637574696f6e2e7365745661726961626c65282777665f61637475616c50657263656e74272c206e6577417070726f76656450657263656e74616765293b0a2020202020202020202020202020202020202020202020207d20656c7365207b0a20202020202020202020202020202020202020202020202020202020766172206e657752656a656374436f756e74203d2077665f72656a656374436f756e74202b20313b0a20202020202020202020202020202020202020202020202020202020766172206e657752656a65637450657263656e74616765203d20286e657752656a656374436f756e74202f2077665f7265766965776572436f756e7429202a203130303b0a202020202020202020202020202020202020202020202020202020200a20202020202020202020202020202020202020202020202020202020657865637574696f6e2e7365745661726961626c65282777665f72656a656374436f756e74272c206e657752656a656374436f756e74293b0a20202020202020202020202020202020202020202020202020202020657865637574696f6e2e7365745661726961626c65282777665f61637475616c52656a65637450657263656e74272c206e657752656a65637450657263656e74616765293b0a2020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020203c2f61637469766974693a737472696e673e0a2020202020202020202020202020202020203c2f61637469766974693a6669656c643e0a2020202020202020202020202020203c2f61637469766974693a7461736b4c697374656e65723e0a20202020202020202020203c2f657874656e73696f6e456c656d656e74733e0a20202020202020202020200a20202020202020202020203c68756d616e506572666f726d65723e0a202020202020202020202020202020203c7265736f7572636541737369676e6d656e7445787072657373696f6e3e0a20202020202020202020202020202020202020203c666f726d616c45787072657373696f6e3e247b72657669657741737369676e65657d3c2f666f726d616c45787072657373696f6e3e0a202020202020202020202020202020203c2f7265736f7572636541737369676e6d656e7445787072657373696f6e3e0a20202020202020202020203c2f68756d616e506572666f726d65723e0a20202020202020202020200a20202020202020202020203c212d2d20466f7220656163682061737369676e65652c207461736b2069732063726561746564202d2d3e0a20202020202020202020203c6d756c7469496e7374616e63654c6f6f7043686172616374657269737469637320697353657175656e7469616c3d2266616c7365223e0a20202020202020202020200920203c6c6f6f7044617461496e7075745265663e77665f67726f75704d656d626572733c2f6c6f6f7044617461496e7075745265663e0a20202020202020202020200920203c696e707574446174614974656d206e616d653d2272657669657741737369676e656522202f3e0a20202020202020202020200920203c636f6d706c6574696f6e436f6e646974696f6e3e247b77665f61637475616c50657263656e74203e3d2077665f7265717569726564417070726f766550657263656e74207c7c2077665f7265717569726564417070726f766550657263656e74203e2028313030202d2077665f61637475616c52656a65637450657263656e74297d3c2f636f6d706c6574696f6e436f6e646974696f6e3e0a20202020202020202020203c2f6d756c7469496e7374616e63654c6f6f704368617261637465726973746963733e0a20202020202020203c2f757365725461736b3e0a0a20202020202020203c73657175656e6365466c6f772069643d27666c6f773227200a202020202020202009736f757263655265663d277265766965775461736b270a2020202020202020202020207461726765745265663d277265766965774465636973696f6e27202f3e0a0a20202020202020203c6578636c757369766547617465776179202069643d227265766965774465636973696f6e22206e616d653d22526576696577204465636973696f6e22202f3e200a0a20202020202020203c73657175656e6365466c6f772069643d27666c6f77332720736f757263655265663d277265766965774465636973696f6e27207461726765745265663d27617070726f76656427203e0a2020202020202020202020203c636f6e646974696f6e45787072657373696f6e207873693a747970653d2274466f726d616c45787072657373696f6e223e247b77665f61637475616c50657263656e74203e3d2077665f7265717569726564417070726f766550657263656e747d3c2f636f6e646974696f6e45787072657373696f6e3e0a20202020202020203c2f73657175656e6365466c6f773e0a0a20202020202020203c73657175656e6365466c6f772069643d27666c6f773427200a2020202020202020736f757263655265663d277265766965774465636973696f6e270a2020202020202020202020207461726765745265663d2772656a656374656427202f3e0a0a202020202020203c757365725461736b2069643d22617070726f76656422206e616d653d22446f63756d656e7420417070726f766564220a20202020202020202020202061637469766974693a666f726d4b65793d2277663a617070726f766564506172616c6c656c5461736b22203e0a2020202020202020202020203c646f63756d656e746174696f6e3e0a2020202020202020202020202020202054686520646f63756d656e742077617320726576696577656420616e6420617070726f7665642e0a2020202020202020202020203c2f646f63756d656e746174696f6e3e0a2020202020202020202020203c657874656e73696f6e456c656d656e74733e0a2020202020202020202020202020203c61637469766974693a7461736b4c697374656e6572206576656e743d226372656174652220636c6173733d226f72672e616c66726573636f2e7265706f2e776f726b666c6f772e61637469766974692e7461736b6c697374656e65722e5363726970745461736b4c697374656e6572223e0a2020202020202020202020202020202020203c61637469766974693a6669656c64206e616d653d22736372697074223e0a2020202020202020202020202020202020202020203c61637469766974693a737472696e673e0a20202020202020202020202020202020202020202020202069662028747970656f662062706d5f776f726b666c6f774475654461746520213d2027756e646566696e65642729207461736b2e64756544617465203d2062706d5f776f726b666c6f77447565446174650a20202020202020202020202020202020202020202020202069662028747970656f662062706d5f776f726b666c6f775072696f7269747920213d2027756e646566696e65642729207461736b2e7072696f72697479203d2062706d5f776f726b666c6f775072696f726974793b0a2020202020202020202020202020202020202020202020200a2020202020202020202020202020202020202020202020202f2f2053657420706172616c6c656c2072657669657720706172616d73206f6e207461736b2c20746f206265206b65707420696e20686973746f72790a2020202020202020202020202020202020202020202020207461736b2e7365745661726961626c654c6f63616c282777665f7265766965776572436f756e74272c2077665f7265766965776572436f756e74293b0a2020202020202020202020202020202020202020202020207461736b2e7365745661726961626c654c6f63616c282777665f726571756972656450657263656e74272c2077665f726571756972656450657263656e74293b0a2020202020202020202020202020202020202020202020207461736b2e7365745661726961626c654c6f63616c282777665f61637475616c50657263656e74272c2077665f61637475616c50657263656e74293b0a2020202020202020202020202020202020202020202020207461736b2e7365745661726961626c654c6f63616c282777665f617070726f7665436f756e74272c2077665f617070726f7665436f756e74293b0a2020202020202020202020202020202020202020202020207461736b2e7365745661726961626c654c6f63616c282777665f72656a656374436f756e74272c2077665f72656a656374436f756e74293b0a2020202020202020202020202020202020202020202020207461736b2e7365745661726961626c654c6f63616c282777665f61637475616c52656a65637450657263656e74272c2077665f61637475616c52656a65637450657263656e74293b0a2020202020202020202020202020202020202020203c2f61637469766974693a737472696e673e0a2020202020202020202020202020202020203c2f61637469766974693a6669656c643e0a2020202020202020202020202020203c2f61637469766974693a7461736b4c697374656e65723e0a2020202020202020202020203c2f657874656e73696f6e456c656d656e74733e0a2020202020202020202020203c68756d616e506572666f726d65723e0a202020202020202020202020202020203c7265736f7572636541737369676e6d656e7445787072657373696f6e3e0a20202020202020202020202020202020202020203c666f726d616c45787072657373696f6e3e247b696e69746961746f722e6578697374732829203f20696e69746961746f722e70726f706572746965732e757365724e616d65203a202761646d696e277d3c2f666f726d616c45787072657373696f6e3e0a202020202020202020202020202020203c2f7265736f7572636541737369676e6d656e7445787072657373696f6e3e0a2020202020202020202020203c2f68756d616e506572666f726d65723e0a20202020202020203c2f757365725461736b3e0a20202020202020200a20202020202020203c757365725461736b2069643d2272656a656374656422206e616d653d22446f63756d656e742052656a6563746564220a20202020202020202020202061637469766974693a666f726d4b65793d2277663a72656a6563746564506172616c6c656c5461736b22203e0a2020202020202020202020203c646f63756d656e746174696f6e3e0a2020202020202020202020202020202054686520646f63756d656e742077617320726576696577656420616e642072656a65637465642e0a2020202020202020202020203c2f646f63756d656e746174696f6e3e0a2020202020202020202020203c657874656e73696f6e456c656d656e74733e0a2020202020202020202020202020203c61637469766974693a7461736b4c697374656e6572206576656e743d226372656174652220636c6173733d226f72672e616c66726573636f2e7265706f2e776f726b666c6f772e61637469766974692e7461736b6c697374656e65722e5363726970745461736b4c697374656e6572223e0a2020202020202020202020202020202020203c61637469766974693a6669656c64206e616d653d22736372697074223e0a2020202020202020202020202020202020202020203c61637469766974693a737472696e673e0a20202020202020202020202020202020202020202020202069662028747970656f662062706d5f776f726b666c6f774475654461746520213d2027756e646566696e65642729207461736b2e64756544617465203d2062706d5f776f726b666c6f77447565446174650a20202020202020202020202020202020202020202020202069662028747970656f662062706d5f776f726b666c6f775072696f7269747920213d2027756e646566696e65642729207461736b2e7072696f72697479203d2062706d5f776f726b666c6f775072696f726974793b0a2020202020202020202020202020202020202020202020200a2020202020202020202020202020202020202020202020202f2f2053657420706172616c6c656c2072657669657720706172616d73206f6e207461736b2c20746f206265206b65707420696e20686973746f72790a2020202020202020202020202020202020202020202020207461736b2e7365745661726961626c654c6f63616c282777665f7265766965776572436f756e74272c2077665f7265766965776572436f756e74293b0a2020202020202020202020202020202020202020202020207461736b2e7365745661726961626c654c6f63616c282777665f726571756972656450657263656e74272c2077665f726571756972656450657263656e74293b0a2020202020202020202020202020202020202020202020207461736b2e7365745661726961626c654c6f63616c282777665f61637475616c50657263656e74272c2077665f61637475616c50657263656e74293b0a2020202020202020202020202020202020202020202020207461736b2e7365745661726961626c654c6f63616c282777665f617070726f7665436f756e74272c2077665f617070726f7665436f756e74293b0a2020202020202020202020202020202020202020202020207461736b2e7365745661726961626c654c6f63616c282777665f72656a656374436f756e74272c2077665f72656a656374436f756e74293b0a2020202020202020202020202020202020202020202020207461736b2e7365745661726961626c654c6f63616c282777665f61637475616c52656a65637450657263656e74272c2077665f61637475616c52656a65637450657263656e74293b0a2020202020202020202020202020202020202020203c2f61637469766974693a737472696e673e0a2020202020202020202020202020202020203c2f61637469766974693a6669656c643e0a2020202020202020202020202020203c2f61637469766974693a7461736b4c697374656e65723e0a2020202020202020202020203c2f657874656e73696f6e456c656d656e74733e0a2020202020202020202020203c68756d616e506572666f726d65723e0a202020202020202020202020202020203c7265736f7572636541737369676e6d656e7445787072657373696f6e3e0a20202020202020202020202020202020202020203c666f726d616c45787072657373696f6e3e247b696e69746961746f722e6578697374732829203f20696e69746961746f722e70726f706572746965732e757365724e616d65203a202761646d696e277d3c2f666f726d616c45787072657373696f6e3e0a202020202020202020202020202020203c2f7265736f7572636541737369676e6d656e7445787072657373696f6e3e0a2020202020202020202020203c2f68756d616e506572666f726d65723e0a20202020202020203c2f757365725461736b3e0a0a20202020202020203c73657175656e6365466c6f772069643d27666c6f77352720736f757263655265663d27617070726f766564270a2020202020202020202020207461726765745265663d27656e6427202f3e0a0a20202020202020203c73657175656e6365466c6f772069643d27666c6f77362720736f757263655265663d2772656a6563746564270a2020202020202020202020207461726765745265663d27656e6427202f3e0a0a20202020202020203c656e644576656e742069643d22656e6422202f3e0a0a202020203c2f70726f636573733e0a0a2020203c212d2d2047726170686963616c20726570726573656e7461696f6e206f66206469616772616d202d2d3e0a2020203c62706d6e64693a42504d4e4469616772616d2069643d2242504d4e4469616772616d5f6163746976697469506172616c6c656c47726f7570526576696577223e0a2020202020203c62706d6e64693a42504d4e506c616e652062706d6e456c656d656e743d226163746976697469506172616c6c656c47726f7570526576696577220a20202020202020202069643d2242504d4e506c616e655f6163746976697469506172616c6c656c47726f7570526576696577223e0a2020202020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d227374617274220a20202020202020202020202069643d2242504d4e53686170655f7374617274223e0a2020202020202020202020203c6f6d6764633a426f756e6473206865696768743d223335222077696474683d2233352220783d2233302220793d22323030223e3c2f6f6d6764633a426f756e64733e0a2020202020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d227265766965775461736b220a20202020202020202020202069643d2242504d4e53686170655f7265766965775461736b223e0a2020202020202020202020203c6f6d6764633a426f756e6473206865696768743d223535222077696474683d223130352220783d22313235220a202020202020202020202020202020793d22313930223e3c2f6f6d6764633a426f756e64733e0a2020202020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d227265766965774465636973696f6e220a20202020202020202020202069643d2242504d4e53686170655f7265766965774465636973696f6e223e0a2020202020202020202020203c6f6d6764633a426f756e6473206865696768743d223430222077696474683d2234302220783d223239302220793d22313937223e3c2f6f6d6764633a426f756e64733e0a2020202020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d22617070726f766564220a20202020202020202020202069643d2242504d4e53686170655f617070726f766564223e0a2020202020202020202020203c6f6d6764633a426f756e6473206865696768743d223535222077696474683d223130352220783d22333930220a202020202020202020202020202020793d223937223e3c2f6f6d6764633a426f756e64733e0a2020202020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d2272656a6563746564220a20202020202020202020202069643d2242504d4e53686170655f72656a6563746564223e0a2020202020202020202020203c6f6d6764633a426f756e6473206865696768743d223535222077696474683d223130352220783d22333930220a202020202020202020202020202020793d22323937223e3c2f6f6d6764633a426f756e64733e0a2020202020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020202020203c62706d6e64693a42504d4e53686170652062706d6e456c656d656e743d22656e64222069643d2242504d4e53686170655f656e64223e0a2020202020202020202020203c6f6d6764633a426f756e6473206865696768743d223335222077696474683d2233352220783d223535352220793d22333037223e3c2f6f6d6764633a426f756e64733e0a2020202020202020203c2f62706d6e64693a42504d4e53686170653e0a2020202020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22666c6f7731222069643d2242504d4e456467655f666c6f7731223e0a2020202020202020202020203c6f6d6764693a776179706f696e7420783d2236352220793d22323137223e3c2f6f6d6764693a776179706f696e743e0a2020202020202020202020203c6f6d6764693a776179706f696e7420783d223132352220793d22323137223e3c2f6f6d6764693a776179706f696e743e0a2020202020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22666c6f7732222069643d2242504d4e456467655f666c6f7732223e0a2020202020202020202020203c6f6d6764693a776179706f696e7420783d223233302220793d22323137223e3c2f6f6d6764693a776179706f696e743e0a2020202020202020202020203c6f6d6764693a776179706f696e7420783d223239302220793d22323137223e3c2f6f6d6764693a776179706f696e743e0a2020202020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22666c6f7733222069643d2242504d4e456467655f666c6f7733223e0a2020202020202020202020203c6f6d6764693a776179706f696e7420783d223331302220793d22313937223e3c2f6f6d6764693a776179706f696e743e0a2020202020202020202020203c6f6d6764693a776179706f696e7420783d223331302220793d22313234223e3c2f6f6d6764693a776179706f696e743e0a2020202020202020202020203c6f6d6764693a776179706f696e7420783d223339302220793d22313234223e3c2f6f6d6764693a776179706f696e743e0a2020202020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22666c6f7734222069643d2242504d4e456467655f666c6f7734223e0a2020202020202020202020203c6f6d6764693a776179706f696e7420783d223331302220793d22323337223e3c2f6f6d6764693a776179706f696e743e0a2020202020202020202020203c6f6d6764693a776179706f696e7420783d223331302220793d22333234223e3c2f6f6d6764693a776179706f696e743e0a2020202020202020202020203c6f6d6764693a776179706f696e7420783d223339302220793d22333234223e3c2f6f6d6764693a776179706f696e743e0a2020202020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22666c6f7735222069643d2242504d4e456467655f666c6f7735223e0a2020202020202020202020203c6f6d6764693a776179706f696e7420783d223439352220793d22313234223e3c2f6f6d6764693a776179706f696e743e0a2020202020202020202020203c6f6d6764693a776179706f696e7420783d223537322220793d22313234223e3c2f6f6d6764693a776179706f696e743e0a2020202020202020202020203c6f6d6764693a776179706f696e7420783d223537322220793d22333037223e3c2f6f6d6764693a776179706f696e743e0a2020202020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020202020203c62706d6e64693a42504d4e456467652062706d6e456c656d656e743d22666c6f7736222069643d2242504d4e456467655f666c6f7736223e0a2020202020202020202020203c6f6d6764693a776179706f696e7420783d223439352220793d22333234223e3c2f6f6d6764693a776179706f696e743e0a2020202020202020202020203c6f6d6764693a776179706f696e7420783d223535352220793d22333234223e3c2f6f6d6764693a776179706f696e743e0a2020202020202020203c2f62706d6e64693a42504d4e456467653e0a2020202020203c2f62706d6e64693a42504d4e506c616e653e0a2020203c2f62706d6e64693a42504d4e4469616772616d3e0a3c2f646566696e6974696f6e733e	f
19	1	47efaffd-dbe9-4321-a9db-323adbec5189activitiParallelGroupReview.png	17	\\x89504e470d0a1a0a0000000d49484452000002580000016a0806000000c63c24e700001c6a4944415478daeddd7d8c94778107f0de59c2112448628346899abb18420831cd199af812fe68ce92906bd1c27681b6abf2e68a480c5894121a2aa9b64d8aa188c7791609a20d574a4ba0d5dde5650942a0ed61bb042c0748e942d92d47795979adbf7b7e4f76c8ec1bbbb3af333b9f4ff2cbcecc333bbb0c0fdff9f27b7ef3cc6db7010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000014ba10c2edc78e1ddbb077efde0fabaaaa424545859107a3b2b232545757bf9f8c69f652002830b15ceddab52bd4d5d585ab57af1a7934eaebebc3ce9d3bcf2765eb7e7b2a0014903873a55ce575c9ba5a515171c89e0a0005241e165464f27b2405ebba3d15000a485cefa3c4e47dc10af65400e88705ebd207a7c3b1fdcf8583954bd3112fc7db1420050b00e844c1ba78ae36d4fc6171f8f396054d46bc2d6e5382142c0020c78275f2e0cb2dca5566bc7b70b312a4600100b916ac43db7fd666c18adb9420050b00c8b160d5543cd666c18adb9420050b0050b0142c00a06f0b567cd7605b052b6e5382142c0020c7827564f7b36d16acb84d0952b000801c0bd6d9da3743cd1f97b43c3c98dc16b729410a16009063c18ae3f86b6b5b14ac789b02a46001009d295857ae84237f5ad5f2f060725bdca604295800400e052b9ea9fdeddd2bda5c8315b7399bbb82050074a4605db9124e1fd916de7af5c76d96abcc88f789f7359ba56001006d14acf666adcc66295800408e05ab23b356b79acd528a142c0050b09abda077b65c658652a460018082a5c428580040fb4a4b4b2b92f165054bc10200bac9030f3c10e28845aba4a4e42e054bc10200baa960658d575a9bd152b0142c00a0f305ebe68c5676d152b0142c00a08b052b7b462b1e3a54b0142c00e84c91306e3114acfc1ff6d3ce0de908d0c582e559c8a978ee2f292999306edcb8dbe3fd142c335872010041daf982d5a45865f455c14a7ef4cd3164c8903077eedcd0d0d0a0502958720140901644c1da535a5a7a5ff362952f052b5e5ebe7c797a79fefcf90a958225170004695e3f2fadce58e563c1ba78f1627a79c48811e9f5b367cf8659b366854183068581030786d9b36787f3e7cfa7db4e9c3811923f531830604018397264d8b3674f8bc76b7e3d73f9ce3bef4cbf2fce982d59b2244c9c38317dfce1c3878775ebd6295872010041da3df2a16065aec7f2132fc77215afaf5fbf3e6cd8b021bd1c4b56dc367efcf8f47a2c56f1eb9831633a5cb05e78e18570fcf8f19bd7e3631f397224bd3c6cd830054b2e002048fb6fc18ab34af1fae5cb97d3112fc7dbb2b775e4f19a17ac8edc57c1920b0008d27e51b0328708478d1a955e8f87069b17acc183072b58c8050041aa6075b460ad5ebd3abdbc68d1a2f47a5959598b4384e5e5e54d0e11eedebdbbc921c23beeb823bd5e535313b66cd9d2e982d591cb0a965c0010a4e475c1baadf1340df3e6cdbbb92d2e729f3e7d7a3a5b15472c579945ee710dd5d8b163d3c389a3478f0efbf6ed4b6f5fb3664d183a74683afb151f4bc1920b9e0500415a7405cb50b0e402802055b00c054b2e000852142c054b2e002048152c43c1920b008254c132142cb900204851b0142cb900802055b00c054b2e00085205cb50b0e402802055b09418054b2e002048152c050bb9002048152c43c1920b008254c132142cb900204851b0142ce402802055b00c054b2e00085205cb50b0e4028020a55d5555554a4c7e8fcb49c1ba6e4f950b0082b4805457579faeabab5364f274d4d6d6fe3e295887eca97201409016906ddbb6ddbb63c78e0fce9c39f3378526bf66ae62b9aaacac3c918cfbeda9720140901698e4057c424545c5fe78282aaef731f262c4bf8b43ca955c0010a4805c0010a4805c0040900272014090027201409002720140907a1600b900204801b900204801b900204801b900802005e402802005e402802005e402008214900b008214900b008214900b000852402e000852402e000852402e00085200b900204801b900204801b900204801b900802005e402802005e402802005e402008214900b008214900b008214900b000852402e000852402e000852402e00085200b900204801b900204801b900204801b900802005e402802005e402c5248470fbb163c736ecddbbf7c3aaaaaa50515161e4c1a8acac0cd5d5d5ef27639abd54900272810213cbd5ae5dbb425d5d5db87af5aa9147a3bebe3eecdcb9f37c52b6eeb7a70a52402e5040e2cc957295d725eb6a4545c5217baa2005e40205241e165464f27b2405ebba3d55900272810212d7fb2831795fb004812005e402fdb1605dfae07438b6ffb970b072693ae2e5789b02a4600952402e40270ad6c573b5a1e60f8bc39fb72c6832e26d719b12a4600952402e408e05ebe4c1975b94abcc78f7e0662548c1ca67f73406e93d9e0a40c122af0ad6a1ed3f6bb360c56d4a908295a7ee4ec6b9643cd3f87582a70450b0c89b825553f1589b052b6e538214ac3c2e5799521567b0ea952c40c16ac3638f3df6b1952b57fee4f1c71f7f6df1e2c5f5e5e5e5d7a64e9d1ae29315c7cc99336ffcf0873f3cb774e9d203bff8c52ffee3d1471ffd67cf9a82a5601575b96aef7640c12a5ecb962dfbda92254bfe67dab4697f4f8a55d8b4695378f3cd37d33390dfb87123649c3d7b361c3e7c38bcfaeaabe1e9a79f0ef1fe49e13a997ccfcc71e3c6ddee99ccbd60c5770db655b0e2362548c1ca23f7b453a232dbadc90205abb8cd9b37efb33ffad18f0e4c9f3efdef1b366c480b542eae5dbb1676efde1d1e7df4d1bf979797bf3763c68c7fb76be556b08eec7eb6cd8215b729410a569e95abf6ca93992c50b08a3b57172f5e3ce7dbdffef6f5dffce637a1a1a12174d5fefdfb4352b0aecd9e3d7bd3a449933e6a17eb58c13a5bfb66a8f9e39296870793dbe2362548c1ca0377e7383395ebfd0105ab7f58b870e17f7cf7bbdfbdf1faebaf87ee74e1c285b072e5ca6b656565a79292f50905ab63271a3dfedada16052bdea60029587954ae2674e2fb2e2a59a0601555b99a33674efa21c43d65fdfaf51f4e9b36ed7c52b2fe45c16ae745feca9570e44fab5a1e1e4c6e8bdb942005ab00cb55777d3fa0601586785830ce5cf564b9ca78e9a597ae2425abb69867b2da2b58f14ced6fef5ed1e61aacb8cdd9dc15ac3ed2de82f6de7e1c40c1ca4f71417b5c7375e0c081d05b7efbdbdf9e9a3265cacbc5fa0ec3360bd6952be1f4916de1ad577fdc66b9ca8c789f785fb3590a561f94abee3abc67260b14acfe6be1c2856fc505edbdedfbdffffea9929292390a56c766adcc6629587dacf902f57f48c6c38d5f73d1fcfb2c7c0705abff89e7b98aa762e88e770be6aab6b6f6c6942953feafb4b4f4e30ad6d50ecd5add6a364b2952b07aa15c4dc82a49ff958cd0f8b5a325abadef53b240c1ea5fe24944376edc18faca4f7ffad38349c17a42c1badae97295194a9182d54be5eab6c619a890353a52b2b2cb55663c94b5dd9a2c50b0fa87f8f137f18cebb99e44b49b67b1ea9282f57eb1adc5eae8691a0c05ab8fb5557a5a2b4bb72a59adddff57addcdf9a2c50b00adfaa55ab9e881f7fd3d7bef39deffc2529595f56b00c05abfb25ffb62a3af9efabbd05ed1d2d591d2d57cd4b96c385a06015a6f8c1cd9b376feef382b57cf9f2ddfde53061475fcc142c05ab37032d8eb86f969494dcd5c16feb68c969af64e55aaeb27f7ebd992c50b00ad2e2c58bebe30737f7b5bd7bf71e489ef4edc5f462a6602958bdbd4f668d57daf94f40ae87e9da2a59ffd8c972d57c064dc90205abb09497975feb8d138bb6e7bdf7de3b9d3ce9a78be9c54cc152b0fa709fbcf99f8056f6cdceae816aad64fda50be5aaabbf0fa060f59da953a7861b376e847cd05f9ef48ebe9829580a565fef93d9ff09689c6dedea8c516b25ab2be5aa79c9b2260b14acc2f983e68bfe5eb09abf982958f93f3af077d96fc6d7bffef54c117aa68bff04feb19599abbf34dede15cf343ed6c7bc44818265062bc782554c43c132839507a57f7f52f627649d22a5ab1f8373ab19ac5c4e466a060b14acc2962f6bb0eaebeb4ff5e33558adbe987557c1ca7e111b306040f8fce73f1faaaaaabafc783d5158da78e1cdcbdfb59f17ace6c5aa7999b9785bcfacc1ea4cc9b2060b14acc2b368d1a2f70f1e3c982fef22dc554c2f66dd5db0e2e5c3870fa797478e1c99d73343dd558c14ac9cf7c93da5a5a5f775e0a4beb9ce18b5752a86d6de45984bc9f22e4250b00a533c0fd6d6ad5bf3e23c58c993fe5431bd98f544c1ca5c8f3359f1727d7d7d78e8a187c2c08103c3a04183c237bef18df0eebbef86f5ebd7a7f79b366d5a7abf789f787dddba754d1eafadef8fdb860f1f1e66cd9a955efee52f7f997ecfcf7ffef3f4faecd9b3c3902143722a463b77ee0ca3468d4a7ff7f8d86bd6ac496f7fe9a597c2e8d1a3d3dbe3eff0d5af7e351c3d7ab4c5e33cf9e493e9e5e43f0d0a56cb7df25633565d9d396aef3c57b99ef13de35f6f731e2c50b00ad5ca952b9f5eb66c599f17ac3973e6d4244ffab8627a31eb8982f5c61b6fa497c78c19935e2f2b2b4bafc7db0f1c38905efedad7be164e9d3a955efecc673e93deef739ffb5c7afde4c9934d1eafadef8fdb264e9c183ef9c94fa697bff4a52fa5dbc68e1d9b5effd4a73e15eebdf7de9c0a562c57fbf6edbbf93b0c1d3a34bd3d7e8dd78f1f3f9e6e8f97bff8c52f36799c4cc1fbd6b7be6506ab7bb53783d4d19388e65ab2328729eff372040a56415ab060c1271e7ef8e1bf373434f4e539b0e267115e4a5eccffa99876b29e588315c717bef085b067cf9e745b9c796abe3dde16b7c559a1787dfbf6ede9d758709a979f5b7d7f9c29ca9ef5ca14a1ccf5ccec56470b562c508f3cf2485a9eb2b767ca5b9cc11a3f7e7c48fe5390ceacb5f667cfcca02958ddaaad99ac5ccfd0ded19295f979ca152858852d7951fbdf1d3b76f459c17af6d9675f2b2929f9cf62dbc97a62066bce9c3961f0e0c161cb962d4d0ad2e5cb975b7c5f797979ba2dce346517a2d60a566bdfbf61c386745b9cad8a5f7ff5ab5f35b9be76edda9c0a565c37166f8b1fdd94bd3dfeecf85ccd9d3b378c183122bd3d2ee4cf7e9cf8e78e870f636954b07a6c26abf9e1ba876fcbfd3c57ad95ac877298310314acc2b170e1c2d2f9f3e77fd817a76b686868b83e65ca94ff9b3a75eaa715acae17ac584662f918366c587aa82d796ed36dab57afbe79f8f02b5ff94a9382146786e2d7e79f7fbec5e3ddeafb4f9c38d164d62cde963dfb74ab7732b656b032652ef37332dbe361c77839ceca650e6dc612d7fc71e27ab2cc8c9c82d563252b7be17b7659cae524a26d7d9f53318082d5ff949797bfb76bd7ae5e2f588f3ffef89bc993bda21877b29e5ae4fee28b2fa6d7274f9e1c0fbfa6eba8e2ec4e2c3071fd542c46f17ee7cf9f0f1ff9c847d2fbc6afcd0fbbc5cbb7fafe38e26c59bcef8a152bd2ebf1f05de6fbe361e75c0a56fcdef833e23aaaecedf1e7c5f55ef17788653096b8b820bef9e3c459bbcc9f5bc1ea31cd0f17fe43e30c54aea75e68fe7d5d3dff16a060e5a7993367fedb8c1933ae9d3b77aed7cad51b6fbc71a4b4b4f47f274d9af45105cb70a2d1822d59dd3133e6dd82a060f55fb367cffeefe5cb975fef8d4385a74e9d6a888706274f9e7c77b1ee640a9682a564398928285845209e56e09bdffce6f1b56bd75eebc97255575777a3acacec546969e9bc62dec90ab1605dba7429d4d4d4a45fbb72bb82d52f74f5b09ec382a060158fa4f47cfcc1071f3cbb71e3c6ab3d3573d558ae9e28f69dac100b562c4bc9af9e7eedcaed0a56bf2b59b9ce4059d00e0a56f189efe89b366d5aedaf7ffdebf7ba7bcd553c2c58ec33570a9682d5cfe47a98cf614150b08a579cc94acad0cbf1dd85274e9cb8d2d55331c4770bc605edc5bce64ac152b094acf4e36f9ca11d142c4a4a4ae62445ebcc4f7ef293b78e1e3dfa5eae67685fb972e5fe386b953ca1ab8af5dd820a96825524ee692c4ff7dc627bbd72050a9667a1512c46c913f258324ece9c39f32f4f3ef9e49eeddbb7bff1ce3bef9cc82e5467cf9e3db377efde03f1839be3670bc68fbf8967682fc693882a580a9699ac4ecd70010a56d1ce68ddd558b65e49c6f1645c8f4f56e3389d8c3dc9782a7e7073b17db6a082a560d16a9952ae00050b054bc152b0bab1643da35c010a160a9682a560759f7b1a83d4a91800050b054bc152b00429201750b0142c054b90027201142c054b90027201142c050b410ac8050a415555958295dfe37252b0aedb53052920172820d5d5d5a7ebeaea0aaa745cba74292d4bf16b576e2f84515b5bfbfba4601db2a70a52402e5040b66ddb76ef8e1d3b3e3873e6ccdf0af1f0593f1e9763b9aaacac3c918cfbeda98214900b1498e4057c424545c5fe78282aaef731f262c4bf8b43ca952005e402802005e402802005e402008214900b008214900b008214900b000852402e000852402e000852402e00204801b900204801b900204801b900204801b920170004292017000429201700042920170010a4805c0010a4805c0010a4805c0040900272014090027201409002720140900a52402e000852402e000852402e000852402e00204801b900204801b900204801b900802005e402802005e402802005e402008214900b008214900b008214900b008214402e000852402e000852402e000852402e00204801b900204801b900204801b900802005e402802005e402802005e402008214900b008214900b008214900b008214402e000852402e000852402e000852402e0020487b5308e1f663c78e6dd8bb77ef87555555a1a2a2c2c88351595919aaababdf4fc6347b69bb19b039e6403b63bf670a40c1ea35b15ceddab52bd4d5d585ab57af1a7934eaebebc3ce9d3bcf2765eb7e7bea2d33e05f9371fd5605aba4a46482670a40c1ea3571e64ab9caeb9275b5a2a2e2903db5dd1c78e516056bcfb871e36ef72c012858bd261e165464f27b2405ebba3db543b358ad16acd2d2d2fb3c43000a56af8aeb7d9498bc2f58f6f18e65416b6bb1f69bbd0250b0f2b6605dfae07438b6ffb970b072693ae2e5789b02a460e5d92cd6756baf0014ac82285817cfd5869a3f2c0e7fdeb2a0c988b7c56d4a9082952f9242f5a2d92b0005ab200ad6c9832fb7285799f1eec1cd4a9082954f05ebaeacb557f778460014acbc2d5887b6ffaccd8215b729410a569e6542ba16cbec15808295d705aba6e2b1360b56dca60429587da5b4b4f4e3252525490c3cf05432b627e364b345eea7e3691a92fbfc6772dfe9c9e5cf7ad600142c05cb50b05a3179f2e4bb1bd75b5deec059dcb3475c04bf27196566b80014ac3e2d58f15d836d15acb84d0952b07af1df7b7ca7e0fe1c4b555be3509cd5f2ac0228587d52b08eec7eb6cd8215b729410a566f48cad013cd4fc33075ead4f0c4134f840d1b368483070f86d3a74f87cb972f87e8dab56be94740bdfdf6db61e3c68de9fd1e7cf0c1d68ad62bc9e37cda330ca060f56ac13a5bfb66a8f9e39296870793dbe2362548c1ea4993264dfa68e3faaa9ba5a8acac2cac5bb72e2d50b9686868089b366d0af3e6cd6bfe5985e792afe324028082d56b052b8ee3afad6d51b0e26d0a9082d50be56a5776195abc78713a53d515376edc085bb76e4d67c0b21efb62327cb0368082d54b05ebca9570e44fab5a1e1e4c6e8bdb942005ab07ff7d3799b98a87026339ea2eb5b5b561c18205d925ebb2b3bf0328583d5eb0e299dadfdebda2cd3558719bb3b92b583da171cdd5cdf2b377efded013e29aadb83e2b7b262bf9d923a503a060d1fd05ebca9570fac8b6f0d6ab3f6eb35c6546bc4fbcafd92c05ab1bff5d37f95cc13873d593e282f865cb9635397f563cc7968400142cbaad60b5376b65364bc1ea69252525ff93bde6aa3b0f0bb6e5c2850b61c68c19d90bdf9f9110808245b715ac8ecc5add6a364b2952b0ba229e4434fbdd825d5dd09e8bd75f7fbdf9a2f7cf4a0940c1a25b0a5667cb556628450a5617ff4d6fce949c782a86def6f4d34f6797aca7a404a060d12d05cb50b0fa4a5cf794f9f89b780a855ccf73d51d8e1e3ddae4fc586565651f9314808245e685aa22195f56b014ac42d2f8c1cd69b989efeceb2bd927224dfe1ddd275100058b9bcf4be38b4345f2a2759782a5601542e98f87e47aeb9d83b7f2fcf3cf5bec0e28129e85b60b56f6e7adb5f6e2a6602958f954fab34f2c7af8f0e13e2b58f19c5bd9bfaf4401142cda2a58375f2cb28b9682a560e553e94f6e3b99d9de9bef1e6cee9d77de69724e2c89022858dcb26065bfb8c55904054bc1caa7d29f7d7b3cc37a5f89271ecdfe5d240aa04818390d054bc1caa7d29f7dbdaf295800e4f262b63f7e98edb871e36e8ff753b0f27f146bf9378305402114ac26c52aa3af0a56f2a36f8e21438684b973e78686860685aa3867b06eee9bd6600150282f667be2797c9a17ab7c2958f1f2f2e5cbd3cbf3e7cf57a88aab60b528fdde450840bebf98b53a63958f05ebe2c58be9e5112346a4d7cf9e3d1b66cd9a15060d1a14060e1c1866cf9e1dce9f3f9f6e3b71e24448fe4c61c0800161e4c89161cf9e3d2d1eaff9f5cce53befbc33fdbe3863b664c9923071e2c4f4f1870f1f9e7e248b82d5f7a53fd9b6221fce83157f76d6efbb42a20090937c285899ebb1fcc4cbb15cc5ebebd7af4f5fe8e2e558b2e2b6f1e3c7a7d763b18a5fc78c19d3e182f5c20b2f84e3c78fdfbc1e1ffbc89123e9e561c38629587950fa93e2352d1fcee4be60c182ec8275bfa400a0e00b569c558ad7e322e738e2e5785bf6b68e3c5ef382d591fb2a587d6bead4a99fcefe2cc20b172ef4f5faabcbf1f3112505000557b0328708478d1a955e8f87069b17acc183072b5845227b1dd6c68d1b7bbd60ad5ab52abb603d27250028c882b57af5eaf4f2a2458bd2eb6565652d0e11969797373944b87bf7ee268708efb8e38ef47a4d4d4dd8b2654ba70b56472e2b583d2bfb3061fc7befcdd335d4d6d6a63367999f3f65ca942f4809000aae60ddd6789a8679f3e6dddc1617b94f9f3e3d9dad8a23bec86616b9c7355463c78e4d0f278e1e3d3aecdbb72fbd7dcd9a3561e8d0a1e9ec577c2c05ab70359eaee1ad4cc9d9b46953af15aca54b97667fc8f38b120280822a588682d5d159ac38a3f4d7bffeb5c7cbd5d6ad5bb30f0d5e4f0ad66809018082a560f52b49c9d99c293c3ff8c10fd213d1f69478c839fbd06032664b0700142c05abdf993469d22792a2539f293dcb962d4b3fc2a627ca555cf767613b000a968255144a4a4aee4ac6b94cf9896ba4e21abdee3c2cd86ce6ea95a4d87d543200a0602958fd5a3ceb7be6dc5871c4d9a6f851365d7db7603c9b7fb38fee51ae0050b014ace23179f2e4bb93027431bb10c533bde7fa7985f124a2f13c57cd66add2c382ca15000a9682558c335923932274b2f987467fef7bdf0bbffbddefc2ae5dbbd2771b66d669c5afb150c5d9ae783eb5471e7924b4f281d3d72d680740c152b08a5a9c654a8ad613cd67b33a33e279ae9c8a0100054bc1a251e367163e9ebd00be8323aee57ace19da0150b0142c05ab0d656565ffd4b83eeba9b848bd954388a74b4b4b2b92af2b9232f6800f6e0640c132142c0050b00c050b0050b0142c0040c152b0000005cb50b000a0b85455552931f93d2e2705ebba3d15000a487575f5e9baba3a45264f476d6dedef938275c89e0a000564dbb66df7eed8b1e3833367cefc4da1c9af99ab58ae2a2b2b4f24e37e7b2a001498e4057c424545c5fe78282aaef731f262c4bf8b43ca150000000000000000000000000000000000000000402ff97f6d17f4e1e3d049060000000049454e44ae426082	t
22	1	58253809-3d4c-4bae-9c94-135e72c2da11bpmn20.xml	21	\\x3c646566696e6974696f6e7320786d6c6e733d22687474703a2f2f7777772e6f6d672e6f72672f737065632f42504d4e2f32303130303532342f4d4f44454c220d0a202020786d6c6e733a7873693d22687474703a2f2f7777772e77332e6f72672f323030312f584d4c536368656d612d696e7374616e63652220786d6c6e733a61637469766974693d22687474703a2f2f61637469766974692e6f72672f62706d6e220d0a202020786d6c6e733a62706d6e64693d22687474703a2f2f7777772e6f6d672e6f72672f737065632f42504d4e2f32303130303532342f44492220786d6c6e733a6f6d6764633d22687474703a2f2f7777772e6f6d672e6f72672f737065632f44442f32303130303532342f4443220d0a202020786d6c6e733a6f6d6764693d22687474703a2f2f7777772e6f6d672e6f72672f737065632f44442f32303130303532342f44492220747970654c616e67756167653d22687474703a2f2f7777772e77332e6f72672f323030312f584d4c536368656d61220d0a20202065787072657373696f6e4c616e67756167653d22687474703a2f2f7777772e77332e6f72672f313939392f585061746822207461726765744e616d6573706163653d22687474703a2f2f616c66726573636f2e6f72672f776f726b666c6f77732f696e7465726e616c223e0d0a0d0a2020203c70726f6365737320697345786563757461626c653d2274727565222069643d226163746976697469496e7669746174696f6e4d6f6465726174656422206e616d653d224d6f6465726174656420616374697669746920696e7669746174696f6e2070726f63657373223e0d0a0d0a2020202020203c73746172744576656e742069643d227374617274222061637469766974693a666f726d4b65793d22696d77663a6d6f64657261746564496e7669746174696f6e5375626d69745461736b22202f3e0d0a2020202020200d0a2020202020203c73657175656e6365466c6f772069643d22666c6f77312220736f757263655265663d22737461727422207461726765745265663d2273656e64496e7669746522202f3e0d0a2020202020200d0a2020202020203c736572766963655461736b2069643d2273656e64496e7669746522206e616d653d2253656e6420496e76697465222061637469766974693a64656c656761746545787072657373696f6e3d22247b53656e644d6f64657261746564496e7669746544656c65676174657d223e3c2f736572766963655461736b3e0d0a0d0a2020202020203c73657175656e6365466c6f772069643d22666c6f77322220736f757263655265663d2273656e64496e7669746522207461726765745265663d227265766965775461736b22202f3e0d0a0d0a2020202020203c757365725461736b2069643d227265766965775461736b22206e616d653d22526576696577205461736b220d0a20202020202020202061637469766974693a666f726d4b65793d22696d77663a61637469766974694d6f64657261746564496e7669746174696f6e5265766965775461736b223e0d0a2020202020202020203c657874656e73696f6e456c656d656e74733e0d0a2020202020202020202020203c61637469766974693a7461736b4c697374656e6572206576656e743d22637265617465220d0a202020202020202020202020202020636c6173733d226f72672e616c66726573636f2e7265706f2e776f726b666c6f772e61637469766974692e7461736b6c697374656e65722e5363726970745461736b4c697374656e6572223e0d0a2020202020202020202020202020203c61637469766974693a6669656c64206e616d653d22736372697074223e0d0a2020202020202020202020202020202020203c61637469766974693a737472696e673e0d0a20202020202020202020202020202020202020202069662028747970656f662062706d5f776f726b666c6f774475654461746520213d2027756e646566696e656427290d0a2020202020202020202020202020202020202020202020207461736b2e7365745661726961626c65282762706d5f64756544617465272c2062706d5f776f726b666c6f7744756544617465293b0d0a20202020202020202020202020202020202020202069662028747970656f662062706d5f776f726b666c6f775072696f7269747920213d2027756e646566696e65642729200d0a2020202020202020202020202020202020202020202020207461736b2e7072696f72697479203d2062706d5f776f726b666c6f775072696f726974793b0d0a2020202020202020202020202020202020202020203c2f61637469766974693a737472696e673e0d0a2020202020202020202020202020203c2f61637469766974693a6669656c643e0d0a2020202020202020202020203c2f61637469766974693a7461736b4c697374656e65723e0d0a2020202020202020202020203c61637469766974693a7461736b4c697374656e6572206576656e743d22636f6d706c6574652220636c6173733d226f72672e616c66726573636f2e7265706f2e776f726b666c6f772e61637469766974692e7461736b6c697374656e65722e5363726970745461736b4c697374656e6572223e0d0a2020202020202020202020202020203c61637469766974693a6669656c64206e616d653d22736372697074223e0d0a2020202020202020202020202020202020203c61637469766974693a737472696e673e0d0a202020202020202020202020202020202020202020657865637574696f6e2e7365745661726961626c652827696d77665f7265766965774f7574636f6d65272c207461736b2e6765745661726961626c652827696d77665f7265766965774f7574636f6d652729293b0d0a202020202020202020202020202020202020202020657865637574696f6e2e7365745661726961626c652827696d77665f726576696577436f6d6d656e7473272c207461736b2e6765745661726961626c65282762706d5f636f6d6d656e742729293b0d0a202020202020202020202020202020202020202020657865637574696f6e2e7365745661726961626c652827696d77665f7265766965776572272c20706572736f6e2e70726f706572746965732e757365724e616d65293b0d0a2020202020202020202020202020202020203c2f61637469766974693a737472696e673e0d0a2020202020202020202020202020203c2f61637469766974693a6669656c643e0d0a2020202020202020202020203c2f61637469766974693a7461736b4c697374656e65723e0d0a2020202020202020203c2f657874656e73696f6e456c656d656e74733e0d0a2020202020202020203c706f74656e7469616c4f776e65723e0d0a2020202020202020202020203c7265736f7572636541737369676e6d656e7445787072657373696f6e3e0d0a2020202020202020202020202020203c666f726d616c45787072657373696f6e3e247b62706d5f67726f757041737369676e65657d3c2f666f726d616c45787072657373696f6e3e0d0a2020202020202020202020203c2f7265736f7572636541737369676e6d656e7445787072657373696f6e3e0d0a2020202020202020203c2f706f74656e7469616c4f776e65723e0d0a2020202020203c2f757365725461736b3e0d0a2020202020200d0a2020202020203c73657175656e6365466c6f772069643d22666c6f77332220736f757263655265663d227265766965775461736b22207461726765745265663d227265766965774465636973696f6e22202f3e0d0a0d0a2020202020203c6578636c7573697665476174657761792069643d227265766965774465636973696f6e22206e616d653d22526576696577204465636973696f6e22202f3e200d0a0d0a2020202020203c73657175656e6365466c6f772069643d22666c6f77342220736f757263655265663d227265766965774465636973696f6e22207461726765745265663d22617070726f766564223e0d0a202020202020202020203c636f6e646974696f6e45787072657373696f6e207873693a747970653d2274466f726d616c45787072657373696f6e223e247b696d77665f7265766965774f7574636f6d653d3d27617070726f7665277d3c2f636f6e646974696f6e45787072657373696f6e3e0d0a2020202020203c2f73657175656e6365466c6f773e0d0a2020202020200d0a2020202020203c736572766963655461736b2069643d22617070726f76656422206e616d653d22417070726f766564222061637469766974693a64656c656761746545787072657373696f6e3d22247b417070726f76654d6f64657261746564496e7669746544656c65676174657d22202f3e0d0a2020202020203c73657175656e6365466c6f772069643d22666c6f77352220736f757263655265663d22617070726f76656422207461726765745265663d22656e6422202f3e0d0a0d0a2020202020203c73657175656e6365466c6f772069643d22666c6f77362220736f757263655265663d227265766965774465636973696f6e22207461726765745265663d2272656a656374656422202f3e0d0a0d0a2020202020203c736572766963655461736b2069643d2272656a656374656422206e616d653d2252656a6563746564222061637469766974693a64656c656761746545787072657373696f6e3d22247b52656a6563744d6f64657261746564496e7669746544656c65676174657d22202f3e0d0a2020202020203c73657175656e6365466c6f772069643d27666c6f77372720736f757263655265663d2772656a656374656427207461726765745265663d27656e6427202f3e0d0a2020202020200d0a2020202020203c656e644576656e742069643d22656e6422202f3e0d0a2020203c2f70726f636573733e0d0a0d0a3c2f646566696e6974696f6e733e	f
25	1	360fce70-34ae-43e8-a5e3-540335d57b6bbpmn20.xml	24	\\x3c646566696e6974696f6e7320786d6c6e733d22687474703a2f2f7777772e6f6d672e6f72672f737065632f42504d4e2f32303130303532342f4d4f44454c220d0a202020786d6c6e733a7873693d22687474703a2f2f7777772e77332e6f72672f323030312f584d4c536368656d612d696e7374616e63652220786d6c6e733a61637469766974693d22687474703a2f2f61637469766974692e6f72672f62706d6e220d0a202020786d6c6e733a62706d6e64693d22687474703a2f2f7777772e6f6d672e6f72672f737065632f42504d4e2f32303130303532342f44492220786d6c6e733a6f6d6764633d22687474703a2f2f7777772e6f6d672e6f72672f737065632f44442f32303130303532342f4443220d0a202020786d6c6e733a6f6d6764693d22687474703a2f2f7777772e6f6d672e6f72672f737065632f44442f32303130303532342f44492220747970654c616e67756167653d22687474703a2f2f7777772e77332e6f72672f323030312f584d4c536368656d61220d0a20202065787072657373696f6e4c616e67756167653d22687474703a2f2f7777772e77332e6f72672f313939392f585061746822207461726765744e616d6573706163653d22687474703a2f2f616c66726573636f2e6f72672f776f726b666c6f77732f696e7465726e616c223e0d0a0d0a2020203c70726f6365737320697345786563757461626c653d2274727565222069643d226163746976697469496e7669746174696f6e4e6f6d696e6174656422206e616d653d224e6f6d696e6174656420616374697669746920696e7669746174696f6e2070726f63657373223e0d0a0d0a2020202020203c73746172744576656e742069643d227374617274222061637469766974693a666f726d4b65793d22696e77663a696e76697465546f536974655461736b22202f3e0d0a0d0a2020202020203c73657175656e6365466c6f772069643d22666c6f77312220736f757263655265663d22737461727422207461726765745265663d2273656e64496e7669746522202f3e0d0a2020202020200d0a2020202020203c736572766963655461736b2069643d2273656e64496e7669746522206e616d653d2253656e6420496e76697465222061637469766974693a64656c656761746545787072657373696f6e3d22247b53656e644e6f6d696e61746564496e7669746544656c65676174657d22202f3e0d0a2020202020200d0a2020202020203c73657175656e6365466c6f772069643d22666c6f77322220736f757263655265663d2273656e64496e7669746522207461726765745265663d22696e7669746550656e64696e6722202f3e0d0a0d0a2020202020203c757365725461736b2069643d22696e7669746550656e64696e6722206e616d653d22496e766974652050656e64696e67220d0a20202020202020202061637469766974693a666f726d4b65793d22696e77663a6163746976697469496e7669746550656e64696e675461736b223e0d0a2020202020202020203c657874656e73696f6e456c656d656e74733e0d0a2020202020202020202020203c61637469766974693a7461736b4c697374656e6572206576656e743d22637265617465220d0a202020202020202020202020202020636c6173733d226f72672e616c66726573636f2e7265706f2e776f726b666c6f772e61637469766974692e7461736b6c697374656e65722e5363726970745461736b4c697374656e6572223e0d0a2020202020202020202020202020203c61637469766974693a6669656c64206e616d653d22736372697074223e0d0a2020202020202020202020202020202020203c61637469766974693a737472696e673e0d0a20202020202020202020202020202020202020202069662028747970656f662062706d5f776f726b666c6f774475654461746520213d2027756e646566696e656427290d0a2020202020202020202020202020202020202020202020207461736b2e7365745661726961626c65282762706d5f64756544617465272c2062706d5f776f726b666c6f7744756544617465293b0d0a20202020202020202020202020202020202020202069662028747970656f662062706d5f776f726b666c6f775072696f7269747920213d2027756e646566696e65642729200d0a2020202020202020202020202020202020202020202020207461736b2e7072696f72697479203d2062706d5f776f726b666c6f775072696f726974793b0d0a2020202020202020202020202020202020202020203c2f61637469766974693a737472696e673e0d0a2020202020202020202020202020203c2f61637469766974693a6669656c643e0d0a2020202020202020202020203c2f61637469766974693a7461736b4c697374656e65723e0d0a2020202020202020202020203c61637469766974693a7461736b4c697374656e6572206576656e743d22636f6d706c6574652220636c6173733d226f72672e616c66726573636f2e7265706f2e776f726b666c6f772e61637469766974692e7461736b6c697374656e65722e5363726970745461736b4c697374656e6572223e0d0a2020202020202020202020202020203c61637469766974693a6669656c64206e616d653d22736372697074223e0d0a2020202020202020202020202020202020203c61637469766974693a737472696e673e0d0a202020202020202020202020202020202020202020657865637574696f6e2e7365745661726961626c652827696e77665f696e766974654f7574636f6d65272c207461736b2e6765745661726961626c652827696e77665f696e766974654f7574636f6d652729293b0d0a2020202020202020202020202020202020203c2f61637469766974693a737472696e673e0d0a2020202020202020202020202020203c2f61637469766974693a6669656c643e0d0a2020202020202020202020203c2f61637469766974693a7461736b4c697374656e65723e0d0a2020202020202020203c2f657874656e73696f6e456c656d656e74733e0d0a2020202020202020203c68756d616e506572666f726d65723e0d0a2020202020202020202020203c7265736f7572636541737369676e6d656e7445787072657373696f6e3e0d0a202020202020202020202020202020203c666f726d616c45787072657373696f6e3e247b62706d5f61737369676e65652e70726f706572746965732e757365724e616d657d3c2f666f726d616c45787072657373696f6e3e0d0a2020202020202020202020203c2f7265736f7572636541737369676e6d656e7445787072657373696f6e3e0d0a2020202020202020203c2f68756d616e506572666f726d65723e0d0a2020202020203c2f757365725461736b3e0d0a2020202020200d0a2020202020203c73657175656e6365466c6f772069643d22666c6f77332220736f757263655265663d22696e7669746550656e64696e6722207461726765745265663d22696e766974654761746577617922202f3e0d0a0d0a2020202020203c6578636c7573697665476174657761792069643d22696e766974654761746577617922206e616d653d22496e76697465204761746577617922202f3e200d0a0d0a2020202020203c73657175656e6365466c6f772069643d22666c6f77342220736f757263655265663d22696e766974654761746577617922207461726765745265663d226163636570746564223e0d0a202020202020202020203c636f6e646974696f6e45787072657373696f6e207873693a747970653d2274466f726d616c45787072657373696f6e223e247b696e77665f696e766974654f7574636f6d65203d3d2027616363657074277d3c2f636f6e646974696f6e45787072657373696f6e3e0d0a2020202020203c2f73657175656e6365466c6f773e0d0a2020202020200d0a2020202020203c73657175656e6365466c6f772069643d22666c6f77352220736f757263655265663d22696e766974654761746577617922207461726765745265663d2272656a6563746564223e0d0a202020202020202020203c636f6e646974696f6e45787072657373696f6e207873693a747970653d2274466f726d616c45787072657373696f6e223e247b696e77665f696e766974654f7574636f6d65203d3d202772656a656374277d3c2f636f6e646974696f6e45787072657373696f6e3e0d0a2020202020203c2f73657175656e6365466c6f773e0d0a2020202020200d0a2020202020203c73657175656e6365466c6f772069643d22666c6f77372220736f757263655265663d22696e766974654761746577617922207461726765745265663d2263616e63656c6c656422202f3e0d0a2020202020200d0a2020202020203c736572766963655461736b2069643d22616363657074656422206e616d653d224163636570746564222061637469766974693a64656c656761746545787072657373696f6e3d22247b4163636570744e6f6d696e61746564496e7669746544656c65676174657d22202f3e0d0a2020202020203c73657175656e6365466c6f772069643d22666c6f77362220736f757263655265663d22616363657074656422207461726765745265663d22696e76697465416363657074656422202f3e0d0a0d0a2020202020203c736572766963655461736b2069643d2272656a656374656422206e616d653d2252656a6563746564222061637469766974693a64656c656761746545787072657373696f6e3d22247b52656a6563744e6f6d696e61746564496e7669746544656c65676174657d22202f3e0d0a2020202020203c73657175656e6365466c6f772069643d22666c6f77382220736f757263655265663d2272656a656374656422207461726765745265663d22696e7669746552656a656374656422202f3e0d0a2020202020200d0a2020202020203c736572766963655461736b2069643d2263616e63656c6c656422206e616d653d2243616e63656c6c6564222061637469766974693a64656c656761746545787072657373696f6e3d22247b43616e63656c4e6f6d696e61746564496e7669746544656c65676174657d22202f3e0d0a2020202020203c73657175656e6365466c6f772069643d22666c6f77392220736f757263655265663d2263616e63656c6c656422207461726765745265663d22656e6422202f3e0d0a2020202020200d0a202020202020203c757365725461736b2069643d22696e76697465416363657074656422206e616d653d22496e7669746174696f6e204163636570746564220d0a20202020202020202020202061637469766974693a666f726d4b65793d22696e77663a616363657074496e766974655461736b22203e0d0a2020202020202020202020203c657874656e73696f6e456c656d656e74733e0d0a2020202020202020202020202020203c61637469766974693a7461736b4c697374656e6572206576656e743d226372656174652220636c6173733d226f72672e616c66726573636f2e7265706f2e776f726b666c6f772e61637469766974692e7461736b6c697374656e65722e5363726970745461736b4c697374656e6572223e0d0a2020202020202020202020202020202020203c61637469766974693a6669656c64206e616d653d22736372697074223e0d0a2020202020202020202020202020202020202020203c61637469766974693a737472696e673e0d0a20202020202020202020202020202020202020202020202069662028747970656f662062706d5f776f726b666c6f775072696f7269747920213d2027756e646566696e65642729207461736b2e7072696f72697479203d2062706d5f776f726b666c6f775072696f726974793b0d0a2020202020202020202020202020202020202020203c2f61637469766974693a737472696e673e0d0a2020202020202020202020202020202020203c2f61637469766974693a6669656c643e0d0a2020202020202020202020202020203c2f61637469766974693a7461736b4c697374656e65723e0d0a2020202020202020202020203c2f657874656e73696f6e456c656d656e74733e0d0a2020202020202020202020203c68756d616e506572666f726d65723e0d0a202020202020202020202020202020203c7265736f7572636541737369676e6d656e7445787072657373696f6e3e0d0a20202020202020202020202020202020202020203c666f726d616c45787072657373696f6e3e247b696e69746961746f722e6578697374732829203f20696e69746961746f722e70726f706572746965732e757365724e616d65203a202761646d696e277d3c2f666f726d616c45787072657373696f6e3e0d0a202020202020202020202020202020203c2f7265736f7572636541737369676e6d656e7445787072657373696f6e3e0d0a2020202020202020202020203c2f68756d616e506572666f726d65723e0d0a20202020202020203c2f757365725461736b3e0d0a0d0a2020202020203c73657175656e6365466c6f772069643d22666c6f7731302220736f757263655265663d22696e76697465416363657074656422207461726765745265663d22656e6422202f3e0d0a20202020202020200d0a202020202020203c757365725461736b2069643d22696e7669746552656a656374656422206e616d653d22496e7669746174696f6e2052656a6563746564220d0a20202020202020202020202061637469766974693a666f726d4b65793d22696e77663a72656a656374496e766974655461736b22203e0d0a2020202020202020202020203c657874656e73696f6e456c656d656e74733e0d0a2020202020202020202020202020203c61637469766974693a7461736b4c697374656e6572206576656e743d226372656174652220636c6173733d226f72672e616c66726573636f2e7265706f2e776f726b666c6f772e61637469766974692e7461736b6c697374656e65722e5363726970745461736b4c697374656e6572223e0d0a2020202020202020202020202020202020203c61637469766974693a6669656c64206e616d653d22736372697074223e0d0a2020202020202020202020202020202020202020203c61637469766974693a737472696e673e0d0a20202020202020202020202020202020202020202020202069662028747970656f662062706d5f776f726b666c6f775072696f7269747920213d2027756e646566696e65642729207461736b2e7072696f72697479203d2062706d5f776f726b666c6f775072696f726974793b0d0a2020202020202020202020202020202020202020203c2f61637469766974693a737472696e673e0d0a2020202020202020202020202020202020203c2f61637469766974693a6669656c643e0d0a2020202020202020202020202020203c2f61637469766974693a7461736b4c697374656e65723e0d0a2020202020202020202020203c2f657874656e73696f6e456c656d656e74733e0d0a2020202020202020202020203c68756d616e506572666f726d65723e0d0a202020202020202020202020202020203c7265736f7572636541737369676e6d656e7445787072657373696f6e3e0d0a20202020202020202020202020202020202020203c666f726d616c45787072657373696f6e3e247b696e69746961746f722e6578697374732829203f20696e69746961746f722e70726f706572746965732e757365724e616d65203a202761646d696e277d3c2f666f726d616c45787072657373696f6e3e0d0a202020202020202020202020202020203c2f7265736f7572636541737369676e6d656e7445787072657373696f6e3e0d0a2020202020202020202020203c2f68756d616e506572666f726d65723e0d0a20202020202020203c2f757365725461736b3e0d0a20202020202020200d0a20202020202020202020202020203c73657175656e6365466c6f772069643d22666c6f7731312220736f757263655265663d22696e7669746552656a656374656422207461726765745265663d22656e6422202f3e0d0a20202020202020200d0a2020202020203c656e644576656e742069643d22656e6422202f3e0d0a2020203c2f70726f636573733e0d0a0d0a3c2f646566696e6974696f6e733e	f
28	1	b7a4676e-cba2-4890-8868-1638de5476a9bpmn20.xml	27	\\x3c646566696e6974696f6e7320786d6c6e733d22687474703a2f2f7777772e6f6d672e6f72672f737065632f42504d4e2f32303130303532342f4d4f44454c220a202020786d6c6e733a7873693d22687474703a2f2f7777772e77332e6f72672f323030312f584d4c536368656d612d696e7374616e63652220786d6c6e733a61637469766974693d22687474703a2f2f61637469766974692e6f72672f62706d6e220a202020786d6c6e733a62706d6e64693d22687474703a2f2f7777772e6f6d672e6f72672f737065632f42504d4e2f32303130303532342f44492220786d6c6e733a6f6d6764633d22687474703a2f2f7777772e6f6d672e6f72672f737065632f44442f32303130303532342f4443220a202020786d6c6e733a6f6d6764693d22687474703a2f2f7777772e6f6d672e6f72672f737065632f44442f32303130303532342f44492220747970654c616e67756167653d22687474703a2f2f7777772e77332e6f72672f323030312f584d4c536368656d61220a20202065787072657373696f6e4c616e67756167653d22687474703a2f2f7777772e77332e6f72672f313939392f585061746822207461726765744e616d6573706163653d22687474703a2f2f616c66726573636f2e6f72672f776f726b666c6f77732f696e7465726e616c223e0a0a2020203c70726f6365737320697345786563757461626c653d2274727565222069643d226163746976697469496e7669746174696f6e4e6f6d696e6174656441646444697265637422206e616d653d22416464207573657220616374697669746920696e7669746174696f6e2070726f63657373223e0a0a2020202020203c73746172744576656e742069643d227374617274222061637469766974693a666f726d4b65793d22696e77663a696e76697465546f536974655461736b22202f3e0a0a2020202020203c73657175656e6365466c6f772069643d22666c6f77312220736f757263655265663d22737461727422207461726765745265663d22616363657074656422202f3e0a2020202020200a2020202020203c736572766963655461736b2069643d22616363657074656422206e616d653d224163636570746564222061637469766974693a64656c656761746545787072657373696f6e3d22247b4163636570744e6f6d696e61746564496e7669746544656c65676174657d22202f3e0a2020202020203c73657175656e6365466c6f772069643d22666c6f77322220736f757263655265663d22616363657074656422207461726765745265663d2273656e64496e7669746522202f3e0a2020202020200a2020202020203c736572766963655461736b2069643d2273656e64496e7669746522206e616d653d2253656e6420496e76697465222061637469766974693a64656c656761746545787072657373696f6e3d22247b53656e644e6f6d696e61746564496e7669746541646444697265637444656c65676174657d22202f3e0a2020202020200a2020202020203c73657175656e6365466c6f772069643d22666c6f77332220736f757263655265663d2273656e64496e7669746522207461726765745265663d22656e6422202f3e0a0a2020202020203c656e644576656e742069643d22656e6422202f3e0a2020203c2f70726f636573733e0a0a3c2f646566696e6974696f6e733e	f
31	1	4bdb38f1-c070-47d5-9c70-e2ba32a569f8bpmn20.xml	30	\\x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d3822203f3e0a0a3c646566696e6974696f6e7320786d6c6e733d22687474703a2f2f7777772e6f6d672e6f72672f737065632f42504d4e2f32303130303532342f4d4f44454c220a20202020202020202020202020786d6c6e733a7873693d22687474703a2f2f7777772e77332e6f72672f323030312f584d4c536368656d612d696e7374616e6365220a20202020202020202020202020786d6c6e733a61637469766974693d22687474703a2f2f61637469766974692e6f72672f62706d6e220a20202020202020202020202020786d6c6e733a62706d6e64693d22687474703a2f2f7777772e6f6d672e6f72672f737065632f42504d4e2f32303130303532342f4449220a20202020202020202020202020747970654c616e67756167653d22687474703a2f2f7777772e77332e6f72672f323030312f584d4c536368656d61220a202020202020202020202020207461726765744e616d6573706163653d22687474703a2f2f616c66726573636f2e6f72672f776f726b666c6f77732f696e7465726e616c223e0a0a202020203c70726f6365737320697345786563757461626c653d2274727565222069643d22726573657450617373776f726422206e616d653d224f6e205072656d6973652052657365742050617373776f72642070726f63657373223e0a0a20202020202020203c73746172744576656e742069643d227374617274222061637469766974693a666f726d4b65793d22726573657470617373776f726477663a7265717565737450617373776f726452657365745461736b222f3e0a0a20202020202020203c73657175656e6365466c6f772069643d22666c6f77312220736f757263655265663d22737461727422207461726765745265663d2273656e64526573657450617373776f7264456d61696c5461736b222f3e0a0a20202020202020203c736572766963655461736b2069643d2273656e64526573657450617373776f7264456d61696c5461736b22206e616d653d2253656e642052657365742050617373776f726420456d61696c222061637469766974693a64656c656761746545787072657373696f6e3d22247b53656e64526573657450617373776f7264456d61696c44656c65676174657d220a20202020202020202020202020202020202020202061637469766974693a666f726d4b65793d22726573657470617373776f726477663a73656e64526573657450617373776f7264456d61696c5461736b222f3e0a0a20202020202020203c73657175656e6365466c6f772069643d22666c6f77322220736f757263655265663d2273656e64526573657450617373776f7264456d61696c5461736b22207461726765745265663d22726573657450617373776f72645461736b222f3e0a0a20202020202020203c212d2d205468652070617373776f726420726573657420686173206265656e2072657175657374656420616e64206973206e6f772077616974696e6720666f7220746865207573657220746f20636f6d706c65746520627920636c69636b696e67206f6e20746865206c696e6b20696e2074686520656d61696c2e202d2d3e0a20202020202020203c212d2d204e6f7465207468617420776520646f206e6f742073746f7265207468652070617373776f726420617320616e20657865637574696f6e207661726961626c6520666f7220736563757269747920726561736f6e732e202d2d3e0a20202020202020203c757365725461736b2069643d22726573657450617373776f72645461736b22206e616d653d2250617373776f72642052657365742050656e64696e67222061637469766974693a666f726d4b65793d22726573657470617373776f726477663a726573657450617373776f72645461736b222f3e0a0a20202020202020203c212d2d204166746572202773797374656d2e72657365742d70617373776f72642e656e6454696d657227206f662077616974696e6720666f72207573657220746f2072657365742070617373776f72642c20656e64207468652070726f63657373202d2d3e0a20202020202020203c626f756e646172794576656e742069643d22656e6450726f6365737354696d6572222063616e63656c41637469766974793d227472756522206174746163686564546f5265663d22726573657450617373776f72645461736b223e0a2020202020202020202020203c74696d65724576656e74446566696e6974696f6e3e0a202020202020202020202020202020203c74696d654475726174696f6e3e247b726573657470617373776f726477665f656e6454696d65727d3c2f74696d654475726174696f6e3e0a2020202020202020202020203c2f74696d65724576656e74446566696e6974696f6e3e0a20202020202020203c2f626f756e646172794576656e743e0a20202020202020203c73657175656e6365466c6f772069643d22666c6f77332220736f757263655265663d22656e6450726f6365737354696d657222207461726765745265663d2265787069726564222f3e0a0a20202020202020203c73657175656e6365466c6f772069643d22666c6f77342220736f757263655265663d22726573657450617373776f72645461736b22207461726765745265663d22706572666f726d526573657450617373776f7264222f3e0a0a20202020202020203c212d2d20546865207573657220686173207375626d697474656420746865206e6563657373617279206461746120746f207265736574207468652070617373776f72642e202d2d3e0a20202020202020203c736572766963655461736b2069643d22706572666f726d526573657450617373776f726422206e616d653d22506572666f726d2052657365742050617373776f7264222061637469766974693a64656c656761746545787072657373696f6e3d22247b506572666f726d526573657450617373776f726444656c65676174657d220a20202020202020202020202020202020202020202061637469766974693a666f726d4b65793d22726573657470617373776f726477663a70617373776f72645265736574222f3e0a0a20202020202020203c73657175656e6365466c6f772069643d22666c6f77352220736f757263655265663d22706572666f726d526573657450617373776f726422207461726765745265663d2273656e64526573657450617373776f7264436f6e6669726d6174696f6e456d61696c5461736b222f3e0a0a20202020202020203c736572766963655461736b2069643d2273656e64526573657450617373776f7264436f6e6669726d6174696f6e456d61696c5461736b22206e616d653d2253656e642052657365742050617373776f726420436f6e6669726d6174696f6e20456d61696c222061637469766974693a64656c656761746545787072657373696f6e3d22247b53656e64526573657450617373776f7264436f6e6669726d6174696f6e456d61696c44656c65676174657d220a20202020202020202020202020202020202020202061637469766974693a666f726d4b65793d22726573657470617373776f726477663a73656e64526573657450617373776f7264436f6e6669726d6174696f6e456d61696c5461736b222f3e0a0a20202020202020203c73657175656e6365466c6f772069643d22666c6f77362220736f757263655265663d2273656e64526573657450617373776f7264436f6e6669726d6174696f6e456d61696c5461736b22207461726765745265663d22656e64222f3e0a0a20202020202020203c656e644576656e742069643d22656e64222f3e0a20202020202020203c656e644576656e742069643d2265787069726564222f3e0a202020203c2f70726f636573733e0a0a3c2f646566696e6974696f6e733e0a	f
34	1	8bb39bac-c748-479b-ba84-5754a91ec490bpmn20.xml	33	\\x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d3822203f3e0d0a0d0a3c646566696e6974696f6e7320786d6c6e733d22687474703a2f2f7777772e6f6d672e6f72672f737065632f42504d4e2f32303130303532342f4d4f44454c220d0a202020786d6c6e733a7873693d22687474703a2f2f7777772e77332e6f72672f323030312f584d4c536368656d612d696e7374616e63652220786d6c6e733a61637469766974693d22687474703a2f2f61637469766974692e6f72672f62706d6e220d0a202020786d6c6e733a62706d6e64693d22687474703a2f2f7777772e6f6d672e6f72672f737065632f42504d4e2f32303130303532342f44492220786d6c6e733a6f6d6764633d22687474703a2f2f7777772e6f6d672e6f72672f737065632f44442f32303130303532342f4443220d0a202020786d6c6e733a6f6d6764693d22687474703a2f2f7777772e6f6d672e6f72672f737065632f44442f32303130303532342f44492220747970654c616e67756167653d22687474703a2f2f7777772e77332e6f72672f323030312f584d4c536368656d61220d0a20202065787072657373696f6e4c616e67756167653d22687474703a2f2f7777772e77332e6f72672f313939392f585061746822207461726765744e616d6573706163653d22687474703a2f2f616c66726573636f2e6f72672f776f726b666c6f77732f696e7465726e616c223e0d0a0d0a202020203c70726f6365737320697345786563757461626c653d2274727565222069643d227075626c697368576562436f6e74656e7422206e616d653d225075626c6973682057656220436f6e74656e742041637469766974692050726f63657373223e0d0a0d0a20202020202020203c73746172744576656e742069643d227374617274220d0a20202020202020202020202061637469766974693a666f726d4b65793d2270756277663a73746172745075626c69736822202f3e0d0a20202020202020200d0a20202020202020203c73657175656e6365466c6f772069643d27666c6f773027200d0a202020202020202020202020736f757263655265663d277374617274270d0a2020202020202020202020207461726765745265663d2773746172745761697427202f3e0d0a2020202020202020202020200d0a20202020202020203c726563656976655461736b2069643d2273746172745761697422206e616d653d2252656365697665206576656e7420666f722073746172742d7461736b22202f3e0d0a0d0a20202020202020203c73657175656e6365466c6f772069643d27666c6f773127200d0a202020202020202020202020736f757263655265663d27737461727457616974270d0a2020202020202020202020207461726765745265663d27636865636b466f725363686564756c656454696d65273e0d0a202020202020202020202020203c657874656e73696f6e456c656d656e74733e0d0a2020202020202020202020202020203c212d2d20496620746865207363686564756c652064617465206973206e756c6c2c207075626c6973682073686f756c6420626520706572666f726d656420696d6d65646961746c792e204761746577617920757365642074686520277363686564756c652720626f6f6c65616e202d2d3e0d0a2020202020202020202020202020203c61637469766974693a657865637574696f6e4c697374656e657220636c6173733d226f72672e616c66726573636f2e7265706f2e776f726b666c6f772e61637469766974692e6c697374656e65722e536372697074457865637574696f6e4c697374656e6572223e0d0a2020202020202020202020202020202020203c61637469766974693a6669656c64206e616d653d22736372697074223e0d0a2020202020202020202020202020202020202020203c61637469766974693a737472696e673e0d0a2020202020202020202020202020202020202020202020202f2f20436865636b20696620746865207075626c6973682073686f756c64206265207363686564756c6564206f7220706572666f726d656420696d6d65646961746c790d0a20202020202020202020202020202020202020202020202069662028747970656f662070756277665f7363686564756c65645075626c6973684461746520213d2027756e646566696e6564272026616d703b26616d703b2070756277665f7363686564756c65645075626c6973684461746520213d206e756c6c29207b0d0a202020202020202020202020202020202020202020202020202020657865637574696f6e2e7365745661726961626c6528227363686564756c65222c2074727565293b0d0a2020202020202020202020202020202020202020202020207d20656c7365207b0d0a202020202020202020202020202020202020202020202020202020657865637574696f6e2e7365745661726961626c6528227363686564756c65222c2066616c7365293b0d0a2020202020202020202020202020202020202020202020207d200d0a2020202020202020202020202020202020202020203c2f61637469766974693a737472696e673e0d0a2020202020202020202020202020202020203c2f61637469766974693a6669656c643e0d0a2020202020202020202020202020203c2f61637469766974693a657865637574696f6e4c697374656e65723e0d0a2020202020202020202020202020200d0a2020202020202020202020202020203c212d2d2054696d6572206578706563747320616e2049534f2d3836303120646174652c207075626c6973682074696d652073686f756c6420626520636f6e766572746564202869662070726573656e7429202d2d3e0d0a2020202020202020202020202020203c61637469766974693a657865637574696f6e4c697374656e657220636c6173733d226f72672e616c66726573636f2e7265706f2e776f726b666c6f772e61637469766974692e6c697374656e65722e436f6e7665727444617465546f49534f38363031223e0d0a2020202020202020202020202020202020203c61637469766974693a6669656c64206e616d653d22736f757263652220737472696e6756616c75653d2270756277665f7363686564756c65645075626c6973684461746522202f3e0d0a2020202020202020202020202020202020203c61637469766974693a6669656c64206e616d653d227461726765742220737472696e6756616c75653d2269736f383630315075626c6973684461746522202f3e0d0a2020202020202020202020202020203c2f61637469766974693a657865637574696f6e4c697374656e65723e0d0a202020202020202020202020203c2f657874656e73696f6e456c656d656e74733e0d0a20202020202020203c2f73657175656e6365466c6f773e0d0a0d0a20202020202020203c6578636c757369766547617465776179202069643d22636865636b466f725363686564756c656454696d6522206e616d653d22436865636b205363686564756c6522202f3e200d0a0d0a20202020202020203c73657175656e6365466c6f772069643d27666c6f77332720736f757263655265663d27636865636b466f725363686564756c656454696d6527207461726765745265663d2777616974466f725363686564756c656454696d6527203e0d0a2020202020202020202020203c636f6e646974696f6e45787072657373696f6e207873693a747970653d2274466f726d616c45787072657373696f6e223e247b7363686564756c657d3c2f636f6e646974696f6e45787072657373696f6e3e0d0a20202020202020203c2f73657175656e6365466c6f773e0d0a0d0a20202020202020203c73657175656e6365466c6f772069643d27666c6f773427200d0a2020202020202020736f757263655265663d27636865636b466f725363686564756c656454696d65270d0a2020202020202020202020207461726765745265663d277075626c69736827202f3e0d0a2020202020202020202020200d0a20202020202020203c736572766963655461736b2069643d227075626c69736822200d0a202020202020202020202020206e616d653d224d79204a6176612053657276696365205461736b22200d0a2020202020202020202020202061637469766974693a636c6173733d226f72672e616c66726573636f2e7265706f2e776f726b666c6f772e61637469766974692e7363726970742e416c66726573636f53637269707444656c6567617465223e0d0a20202020202020202020202020203c657874656e73696f6e456c656d656e74733e0d0a2020202020202020202020202020202020203c61637469766974693a6669656c64206e616d653d22736372697074223e0d0a2020202020202020202020202020202020202020203c61637469766974693a737472696e673e0d0a202020202020202020202020202020202020202020202020766172207075626c6973684576656e74416374696f6e203d20616374696f6e732e63726561746528227075625f7075626c6973684576656e7422293b0d0a2020202020202020202020202020202020202020202020207075626c6973684576656e74416374696f6e2e657865637574654173796e6368726f6e6f75736c792870756277665f7075626c697368696e674576656e74293b0d0a2020202020202020202020202020202020202020203c2f61637469766974693a737472696e673e0d0a2020202020202020202020202020202020203c2f61637469766974693a6669656c643e0d0a20202020202020202020202020203c2f657874656e73696f6e456c656d656e74733e0d0a2020202020202020203c2f736572766963655461736b3e0d0a2020202020202020200d0a2020202020202020203c726563656976655461736b2069643d2277616974466f725363686564756c656454696d6522206e616d653d225761697420666f72207075626c6973682074696d6522202f3e0d0a2020202020202020200d0a2020202020202020203c626f756e646172794576656e742069643d227075626c69736854696d6572222063616e63656c41637469766974793d227472756522206174746163686564546f5265663d2277616974466f725363686564756c656454696d65223e0d0a202020202020202020202020203c74696d65724576656e74446566696e6974696f6e3e0d0a20202020202020202020202020202020203c74696d65446174653e247b69736f383630315075626c697368446174657d3c2f74696d65446174653e0d0a202020202020202020202020203c2f74696d65724576656e74446566696e6974696f6e3e0d0a2020202020202020203c2f626f756e646172794576656e743e202020200d0a2020202020202020200d0a2020202020202020203c73657175656e6365466c6f772069643d27666c6f77352720736f757263655265663d2777616974466f725363686564756c656454696d65270d0a2020202020202020202020207461726765745265663d27656e6427202f3e0d0a2020202020202020202020200d0a2020202020202020203c73657175656e6365466c6f772069643d27666c6f77362720736f757263655265663d277075626c69736854696d6572270d0a2020202020202020202020207461726765745265663d277075626c69736827202f3e200d0a20202020202020200d0a20202020202020203c73657175656e6365466c6f772069643d27666c6f77372720736f757263655265663d277075626c697368270d0a2020202020202020202020207461726765745265663d27656e6427202f3e0d0a0d0a20202020202020203c656e644576656e742069643d22656e6422202f3e0d0a0d0a202020203c2f70726f636573733e0d0a3c2f646566696e6974696f6e733e	f
\.


--
-- Data for Name: act_ge_property; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY act_ge_property (name_, value_, rev_) FROM stdin;
schema.version	5.20.0.1	1
schema.history	create(5.20.0.1)	1
next.dbid	101	2
\.


--
-- Data for Name: act_hi_actinst; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY act_hi_actinst (id_, proc_def_id_, proc_inst_id_, execution_id_, act_id_, task_id_, call_proc_inst_id_, act_name_, act_type_, assignee_, start_time_, end_time_, duration_, tenant_id_) FROM stdin;
\.


--
-- Data for Name: act_hi_attachment; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY act_hi_attachment (id_, rev_, user_id_, name_, description_, type_, task_id_, proc_inst_id_, url_, content_id_, time_) FROM stdin;
\.


--
-- Data for Name: act_hi_comment; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY act_hi_comment (id_, type_, time_, user_id_, task_id_, proc_inst_id_, action_, message_, full_msg_) FROM stdin;
\.


--
-- Data for Name: act_hi_detail; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY act_hi_detail (id_, type_, proc_inst_id_, execution_id_, task_id_, act_inst_id_, name_, var_type_, rev_, time_, bytearray_id_, double_, long_, text_, text2_) FROM stdin;
\.


--
-- Data for Name: act_hi_identitylink; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY act_hi_identitylink (id_, group_id_, type_, user_id_, task_id_, proc_inst_id_) FROM stdin;
\.


--
-- Data for Name: act_hi_procinst; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY act_hi_procinst (id_, proc_inst_id_, business_key_, proc_def_id_, start_time_, end_time_, duration_, start_user_id_, start_act_id_, end_act_id_, super_process_instance_id_, delete_reason_, tenant_id_, name_) FROM stdin;
\.


--
-- Data for Name: act_hi_taskinst; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY act_hi_taskinst (id_, proc_def_id_, task_def_key_, proc_inst_id_, execution_id_, name_, parent_task_id_, description_, owner_, assignee_, start_time_, claim_time_, end_time_, duration_, delete_reason_, priority_, due_date_, form_key_, category_, tenant_id_) FROM stdin;
\.


--
-- Data for Name: act_hi_varinst; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY act_hi_varinst (id_, proc_inst_id_, execution_id_, task_id_, name_, var_type_, rev_, bytearray_id_, double_, long_, text_, text2_, create_time_, last_updated_time_) FROM stdin;
\.


--
-- Data for Name: act_id_group; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY act_id_group (id_, rev_, name_, type_) FROM stdin;
\.


--
-- Data for Name: act_id_info; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY act_id_info (id_, rev_, user_id_, type_, key_, value_, password_, parent_id_) FROM stdin;
\.


--
-- Data for Name: act_id_membership; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY act_id_membership (user_id_, group_id_) FROM stdin;
\.


--
-- Data for Name: act_id_user; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY act_id_user (id_, rev_, first_, last_, email_, pwd_, picture_id_) FROM stdin;
\.


--
-- Data for Name: act_procdef_info; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY act_procdef_info (id_, proc_def_id_, rev_, info_json_id_) FROM stdin;
\.


--
-- Data for Name: act_re_deployment; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY act_re_deployment (id_, name_, category_, tenant_id_, deploy_time_) FROM stdin;
1	adhoc.bpmn20.xml	\N		2022-01-19 22:30:59.934
5	review.bpmn20.xml	\N		2022-01-19 22:31:02.154
9	review-pooled.bpmn20.xml	\N		2022-01-19 22:31:02.435
13	parallel-review.bpmn20.xml	\N		2022-01-19 22:31:02.685
17	parallel-review-group.bpmn20.xml	\N		2022-01-19 22:31:02.936
21	invitation-moderated.bpmn20.xml	http://alfresco.org/workflows/internal		2022-01-19 22:31:03.154
24	invitation-nominated.bpmn20.xml	http://alfresco.org/workflows/internal		2022-01-19 22:31:03.217
27	invitation-add-direct.bpmn20.xml	http://alfresco.org/workflows/internal		2022-01-19 22:31:03.264
30	reset-password_processdefinition.bpmn20.xml	http://alfresco.org/workflows/internal		2022-01-19 22:31:03.31
33	publish-web-content.bpmn20.xml	http://alfresco.org/workflows/internal		2022-01-19 22:31:21.31
\.


--
-- Data for Name: act_re_model; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY act_re_model (id_, rev_, name_, key_, category_, create_time_, last_update_time_, version_, meta_info_, deployment_id_, editor_source_value_id_, editor_source_extra_value_id_, tenant_id_) FROM stdin;
\.


--
-- Data for Name: act_re_procdef; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY act_re_procdef (id_, rev_, category_, name_, key_, version_, deployment_id_, resource_name_, dgrm_resource_name_, description_, has_start_form_key_, has_graphical_notation_, suspension_state_, tenant_id_) FROM stdin;
activitiAdhoc:1:4	1	http://alfresco.org	Adhoc Activiti Process	activitiAdhoc	1	1	f81e9ad4-2296-4cc3-8cf4-abd116e755f2bpmn20.xml	f81e9ad4-2296-4cc3-8cf4-abd116e755f2activitiAdhoc.png	\N	t	t	1	
activitiReview:1:8	1	http://alfresco.org	Review And Approve Activiti Process	activitiReview	1	5	79c528c4-7186-43ae-9ee8-9b146a01a769bpmn20.xml	79c528c4-7186-43ae-9ee8-9b146a01a769activitiReview.png	\N	t	t	1	
activitiReviewPooled:1:12	1	http://alfresco.org	Pooled Review And Approve Activiti Process	activitiReviewPooled	1	9	3f5431b3-a3c9-45e2-a2a4-ed0786ab90ddbpmn20.xml	3f5431b3-a3c9-45e2-a2a4-ed0786ab90ddactivitiReviewPooled.png	\N	t	t	1	
activitiParallelReview:1:16	1	http://alfresco.org	Parallel Review And Approve Activiti Process	activitiParallelReview	1	13	c1635487-244e-4e07-ad87-61a985006f67bpmn20.xml	c1635487-244e-4e07-ad87-61a985006f67activitiParallelReview.png	\N	t	t	1	
activitiParallelGroupReview:1:20	1	http://alfresco.org	Parallel Group Review And Approve Activiti Process	activitiParallelGroupReview	1	17	47efaffd-dbe9-4321-a9db-323adbec5189bpmn20.xml	47efaffd-dbe9-4321-a9db-323adbec5189activitiParallelGroupReview.png	\N	t	t	1	
activitiInvitationModerated:1:23	1	http://alfresco.org/workflows/internal	Moderated activiti invitation process	activitiInvitationModerated	1	21	58253809-3d4c-4bae-9c94-135e72c2da11bpmn20.xml	\N	\N	t	f	1	
activitiInvitationNominated:1:26	1	http://alfresco.org/workflows/internal	Nominated activiti invitation process	activitiInvitationNominated	1	24	360fce70-34ae-43e8-a5e3-540335d57b6bbpmn20.xml	\N	\N	t	f	1	
activitiInvitationNominatedAddDirect:1:29	1	http://alfresco.org/workflows/internal	Add user activiti invitation process	activitiInvitationNominatedAddDirect	1	27	b7a4676e-cba2-4890-8868-1638de5476a9bpmn20.xml	\N	\N	t	f	1	
resetPassword:1:32	1	http://alfresco.org/workflows/internal	On Premise Reset Password process	resetPassword	1	30	4bdb38f1-c070-47d5-9c70-e2ba32a569f8bpmn20.xml	\N	\N	t	f	1	
publishWebContent:1:35	1	http://alfresco.org/workflows/internal	Publish Web Content Activiti Process	publishWebContent	1	33	8bb39bac-c748-479b-ba84-5754a91ec490bpmn20.xml	\N	\N	t	f	1	
\.


--
-- Data for Name: act_ru_event_subscr; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY act_ru_event_subscr (id_, rev_, event_type_, event_name_, execution_id_, proc_inst_id_, activity_id_, configuration_, created_, proc_def_id_, tenant_id_) FROM stdin;
\.


--
-- Data for Name: act_ru_execution; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY act_ru_execution (id_, rev_, proc_inst_id_, business_key_, parent_id_, proc_def_id_, super_exec_, act_id_, is_active_, is_concurrent_, is_scope_, is_event_scope_, suspension_state_, cached_ent_state_, tenant_id_, name_, lock_time_) FROM stdin;
\.


--
-- Data for Name: act_ru_identitylink; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY act_ru_identitylink (id_, rev_, group_id_, type_, user_id_, task_id_, proc_inst_id_, proc_def_id_) FROM stdin;
\.


--
-- Data for Name: act_ru_job; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY act_ru_job (id_, rev_, type_, lock_exp_time_, lock_owner_, exclusive_, execution_id_, process_instance_id_, proc_def_id_, retries_, exception_stack_id_, exception_msg_, duedate_, repeat_, handler_type_, handler_cfg_, tenant_id_) FROM stdin;
\.


--
-- Data for Name: act_ru_task; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY act_ru_task (id_, rev_, execution_id_, proc_inst_id_, proc_def_id_, name_, parent_task_id_, description_, task_def_key_, owner_, assignee_, delegation_, priority_, create_time_, due_date_, category_, suspension_state_, tenant_id_, form_key_) FROM stdin;
\.


--
-- Data for Name: act_ru_variable; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY act_ru_variable (id_, rev_, type_, name_, execution_id_, proc_inst_id_, task_id_, bytearray_id_, double_, long_, text_, text2_) FROM stdin;
\.


--
-- Data for Name: alf_access_control_entry; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY alf_access_control_entry (id, version, permission_id, authority_id, allowed, applies, context_id) FROM stdin;
1	0	1	1	t	0	\N
2	0	2	1	t	0	\N
3	0	2	2	t	0	\N
4	0	3	1	t	0	\N
5	0	4	1	t	0	\N
6	0	4	2	t	0	\N
7	0	1	3	t	0	\N
8	0	1	4	t	0	\N
9	0	5	1	t	0	\N
10	0	5	5	t	0	\N
11	0	6	1	t	0	\N
12	0	7	4	t	0	\N
13	0	8	6	t	0	\N
14	0	9	7	t	0	\N
15	0	10	8	t	0	\N
16	0	11	9	t	0	\N
17	0	11	1	t	0	\N
18	0	12	1	t	0	\N
19	0	1	10	t	0	\N
20	0	1	11	t	0	\N
21	0	8	12	t	0	\N
22	0	9	13	t	0	\N
23	0	10	14	t	0	\N
24	0	11	15	t	0	\N
\.


--
-- Name: alf_access_control_entry_seq; Type: SEQUENCE SET; Schema: public; Owner: alfresco
--

SELECT pg_catalog.setval('alf_access_control_entry_seq', 24, true);


--
-- Data for Name: alf_access_control_list; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY alf_access_control_list (id, version, acl_id, latest, acl_version, inherits, inherits_from, type, inherited_acl, is_versioned, requires_version, acl_change_set) FROM stdin;
6	3	a8dae9a9-84fb-4f0d-bd0d-845deff40a3d	t	1	t	\N	1	60	f	f	7
1	2	ac2e1e18-d578-48fe-8eaa-f0235bd8fc81	t	1	t	\N	1	2	f	f	1
2	3	ce3b478e-89bc-4475-90d0-8e59351c3261	t	1	t	1	2	2	f	f	1
4	3	551bd093-0a57-4495-8974-a7e6d1481e09	t	1	t	3	2	4	f	f	8
3	2	33719cd0-776c-47fc-842e-c3cf41582870	t	1	t	\N	1	4	f	f	2
5	2	6939266f-dabe-485a-ba43-a7fe65fe241f	t	1	t	\N	1	\N	f	f	3
7	1	67f8843e-03f1-450d-915e-b85dbae6f857	t	1	t	\N	1	\N	f	f	5
61	12	e377e36f-38bd-4527-ab57-a99a1058d2b1	t	1	f	11	1	62	f	f	9
10	7	5f55cac2-7aa5-401f-ac29-fba67ab15303	t	1	f	9	1	11	f	f	6
62	10	da54c989-cdd8-42e8-8882-489c2c635fd1	t	1	t	61	2	62	f	f	10
11	5	b4b26fcf-56a3-44f3-aaef-e2d108e43809	t	1	t	10	2	11	f	f	6
12	7	3ffa86d9-d03f-4a0e-89e6-7d093633de1c	t	1	f	11	1	13	f	f	6
13	5	7edc4e13-be3e-4710-b560-cda746614c77	t	1	t	12	2	13	f	f	6
14	4	dfa2b096-31e2-4fe5-84ae-cb04d861804b	t	1	t	13	1	15	f	f	6
15	3	9e31e2c3-52c5-43d0-8283-02d09265e878	t	1	t	14	2	\N	f	f	6
63	7	d7192877-1f3f-44a1-a6b0-ec56bc056c3f	t	1	f	62	1	64	f	f	10
64	5	7df73bb6-acca-420b-b4ee-a794c0aeb62b	t	1	t	63	2	64	f	f	10
16	7	a87c763c-c6e6-480c-9a71-dde4ca499909	t	1	f	13	1	17	f	f	6
17	4	f5e8fdbc-7729-49d7-896b-7ffd18277936	t	1	t	16	2	\N	f	f	6
18	7	2521eec2-c4b3-4722-bbdd-89aab870a087	t	1	f	13	1	19	f	f	6
19	4	cfa81a69-2edb-4e3d-90f6-a7c62f47aa0b	t	1	t	18	2	\N	f	f	6
20	7	7eeb56a2-d3ec-4c46-b06e-086c223f407c	t	1	f	13	1	21	f	f	6
21	4	b6928be4-a1ee-4a9f-bdcc-5477f42b7ae9	t	1	t	20	2	\N	f	f	6
22	8	cdb19e8f-576a-447f-9653-eeadd7024325	t	1	f	11	1	23	f	f	6
23	5	18f9aa6e-cb31-4524-9f99-7f330d733855	t	1	t	22	2	\N	f	f	6
24	7	9fb04959-bb6d-4b29-ae08-4cbf82c9bc1a	t	1	f	11	1	25	f	f	6
25	4	57bcc83e-98db-4c0f-92f2-38df01479cfb	t	1	t	24	2	\N	f	f	6
8	4	ce48f352-a960-451c-8b2f-ce14d781adf2	t	1	t	\N	1	9	f	f	6
9	5	001617c8-e423-41bc-8167-9a6e46ce39f4	t	1	t	8	2	9	f	f	6
26	7	19ec0d5e-a738-48f3-9c6e-529933620f1f	t	1	f	9	1	27	f	f	6
27	5	6fa4ecbb-fe44-46b1-bb92-5b11ad73670f	t	1	t	26	2	27	f	f	6
28	5	96b05ebe-08f7-45fc-85d6-31a42af60072	t	1	t	27	1	29	f	f	6
29	4	07ca8bdf-beb5-468b-a17a-1f7d9eda0c6f	t	1	t	28	2	\N	f	f	6
30	4	c1334b79-61e1-4b10-806b-89c1ffcecf12	t	1	t	27	1	31	f	f	6
31	3	60ef3896-d667-4f77-8fed-150fa5e01f15	t	1	t	30	2	\N	f	f	6
32	4	c36dff7b-d57a-473e-81eb-e70597e7826a	t	1	t	9	1	33	f	f	6
33	3	aabb9908-85fd-4719-b81c-3e654f39c041	t	1	t	32	2	\N	f	f	6
34	7	277bfa8c-efbe-4b7d-98f9-72cefec92811	t	1	f	9	1	35	f	f	6
35	4	e11edb05-0f96-4d76-97a3-dc627989873a	t	1	t	34	2	\N	f	f	6
36	7	288ea4dc-909e-408a-8ef5-c310a8f27c8a	t	1	f	9	1	37	f	f	6
37	4	a084b540-262a-4141-9481-2fbaa8aacfff	t	1	t	36	2	\N	f	f	6
38	4	7dc7e386-41bc-4f76-b498-9c4512113e54	t	1	t	11	1	39	f	f	6
39	3	3f85bf5a-633a-43df-befd-5efeccbdd86e	t	1	t	38	2	\N	f	f	6
40	4	dc87b071-3096-4176-8e01-ad330215cf50	t	1	t	11	1	41	f	f	6
41	3	584ff6af-b02b-4fcc-a1b0-b2d454def154	t	1	t	40	2	\N	f	f	6
42	4	a65748b7-ae5e-4701-ba13-5bb3b9c5e9c9	t	1	t	27	1	43	f	f	6
43	3	e38fbce2-bbf1-4b99-ac39-7071ee87b9c6	t	1	t	42	2	\N	f	f	6
44	4	c7f2335e-7d5b-407b-879d-7b9916b67e3f	t	1	t	27	1	45	f	f	6
45	3	23d5fca8-53b6-4e30-8fa6-78185a9caf30	t	1	t	44	2	\N	f	f	6
46	9	aea69ff3-beb5-4162-a4ff-4b0adfaa3e93	t	1	f	27	1	47	f	f	6
47	6	0902cd00-e127-4a5e-b7dd-63e955452541	t	1	t	46	2	\N	f	f	6
54	5	6580b4dc-8bc4-4f2a-a2c0-5b8bd43c8526	t	1	t	27	1	55	f	f	7
48	9	151512a3-4c12-43d4-8dfd-538cc4342d32	t	1	f	27	1	49	f	f	6
49	6	53ad104d-d026-4613-a477-78723996d98e	t	1	t	48	2	\N	f	f	6
55	5	b715460d-5d9e-4f58-a210-6878200bb612	t	1	t	54	2	55	f	f	7
50	8	a62ae282-68a8-4656-9097-07547565fc1d	t	1	f	27	1	51	f	f	6
51	5	bbeeebcd-beaf-4a4d-8cfa-5ae01a6f6c2d	t	1	t	50	2	\N	f	f	6
53	9	e3b277bd-6cb8-4d28-8f87-6ef7f8322443	t	1	t	52	2	\N	f	f	7
56	5	2a3d883c-c74b-40fb-b5a2-35b1923fa6ae	t	1	t	27	1	57	f	f	7
57	5	a9efca7d-7ca6-4bc9-aaed-0b4b8441367c	t	1	t	56	2	57	f	f	7
58	12	3aa3a798-7e15-4a7c-83c8-8e7280008041	t	1	f	11	1	59	f	f	7
59	10	d551cfc6-9c90-41cc-a5e9-7f85690a893d	t	1	t	58	2	59	f	f	7
60	3	4f1ccb8e-a384-4d6b-ba28-71ec97b97586	t	1	t	6	2	60	f	f	7
\.


--
-- Name: alf_access_control_list_seq; Type: SEQUENCE SET; Schema: public; Owner: alfresco
--

SELECT pg_catalog.setval('alf_access_control_list_seq', 64, true);


--
-- Data for Name: alf_ace_context; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY alf_ace_context (id, version, class_context, property_context, kvp_context) FROM stdin;
\.


--
-- Name: alf_ace_context_seq; Type: SEQUENCE SET; Schema: public; Owner: alfresco
--

SELECT pg_catalog.setval('alf_ace_context_seq', 1, false);


--
-- Data for Name: alf_acl_change_set; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY alf_acl_change_set (id, commit_time_ms) FROM stdin;
1	1642631446999
2	1642631447357
3	1642631447498
4	1642631447561
5	1642631447592
6	1642631459322
7	1642631476303
8	1642631476732
9	1642631854232
10	1642631854715
\.


--
-- Name: alf_acl_change_set_seq; Type: SEQUENCE SET; Schema: public; Owner: alfresco
--

SELECT pg_catalog.setval('alf_acl_change_set_seq', 10, true);


--
-- Data for Name: alf_acl_member; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY alf_acl_member (id, version, acl_id, ace_id, pos) FROM stdin;
1	0	5	1	0
2	0	6	1	0
3	0	10	2	0
4	0	11	2	1
7	0	12	2	0
8	0	13	2	1
9	0	14	2	2
10	0	15	2	3
11	0	14	3	0
12	0	15	3	1
15	0	16	4	0
16	0	17	4	1
19	0	18	4	0
20	0	19	4	1
23	0	20	4	0
24	0	21	4	1
27	0	22	3	0
28	0	23	3	1
29	0	22	2	0
30	0	23	2	1
33	0	24	4	0
34	0	25	4	1
35	0	8	5	0
36	0	9	5	1
37	0	8	6	0
38	0	9	6	1
43	0	26	5	0
44	0	27	5	1
45	0	28	5	2
46	0	29	5	3
47	0	28	7	0
48	0	29	7	1
49	0	28	8	0
50	0	29	8	1
51	0	30	5	2
52	0	31	5	3
53	0	30	6	0
54	0	31	6	1
55	0	32	5	2
56	0	32	6	2
57	0	33	5	3
58	0	33	6	3
59	0	32	4	0
60	0	33	4	1
65	0	34	2	0
66	0	35	2	1
71	0	36	9	0
72	0	37	9	1
73	0	38	2	2
74	0	39	2	3
75	0	38	10	0
76	0	39	10	1
77	0	40	2	2
78	0	41	2	3
79	0	40	10	0
80	0	41	10	1
81	0	42	5	2
82	0	43	5	3
83	0	42	5	0
84	0	43	5	1
85	0	44	5	2
86	0	45	5	3
87	0	44	5	0
88	0	45	5	1
91	0	46	5	0
92	0	47	5	1
93	0	46	11	0
94	0	47	11	1
95	0	46	12	0
96	0	47	12	1
99	0	48	5	0
100	0	49	5	1
101	0	48	11	0
102	0	49	11	1
103	0	48	12	0
104	0	49	12	1
107	0	50	11	0
108	0	51	11	1
109	0	50	12	0
110	0	51	12	1
114	0	53	13	1
116	0	53	14	1
118	0	53	15	1
120	0	53	16	1
122	0	53	17	1
124	0	53	18	1
125	0	54	5	2
126	0	55	5	3
127	0	54	19	0
128	0	55	19	1
129	0	54	8	0
130	0	55	8	1
131	0	56	5	2
132	0	57	5	3
133	0	56	20	0
134	0	57	20	1
135	0	56	8	0
136	0	57	8	1
139	0	58	18	0
140	0	59	18	1
141	0	58	15	0
142	0	59	15	1
143	0	58	16	0
144	0	59	16	1
145	0	58	13	0
146	0	59	13	1
147	0	58	17	0
148	0	59	17	1
149	0	58	14	0
150	0	59	14	1
151	0	60	1	1
154	0	61	21	0
155	0	62	21	1
156	0	61	22	0
157	0	62	22	1
158	0	61	23	0
159	0	62	23	1
160	0	61	24	0
161	0	62	24	1
162	0	61	17	0
163	0	62	17	1
164	0	61	18	0
165	0	62	18	1
178	0	63	21	0
179	0	64	21	1
\.


--
-- Name: alf_acl_member_seq; Type: SEQUENCE SET; Schema: public; Owner: alfresco
--

SELECT pg_catalog.setval('alf_acl_member_seq', 179, true);


--
-- Data for Name: alf_activity_feed; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY alf_activity_feed (id, post_id, post_date, activity_summary, feed_user_id, activity_type, site_network, app_tool, post_user_id, feed_date) FROM stdin;
1	1	2022-01-19 22:47:26.895	{"firstName":"Administrator","lastName":"","parentNodeRef":"workspace://SpacesStore/add865bb-7d39-4da3-946c-0b000557a469","nodeRef":"workspace://SpacesStore/79a7aeeb-d845-4e93-9353-a87dfa5307c5","page":"documentlibrary?path=/Avattar","title":"Avattar"}	@@NULL@@	org.alfresco.documentlibrary.folder-added	avattar-alfresco	documentlibrary	admin	2022-01-19 22:47:30.492
2	1	2022-01-19 22:47:26.895	{"firstName":"Administrator","lastName":"","parentNodeRef":"workspace://SpacesStore/add865bb-7d39-4da3-946c-0b000557a469","nodeRef":"workspace://SpacesStore/79a7aeeb-d845-4e93-9353-a87dfa5307c5","page":"documentlibrary?path=/Avattar","title":"Avattar"}	admin	org.alfresco.documentlibrary.folder-added	avattar-alfresco	documentlibrary	admin	2022-01-19 22:47:30.679
3	2	2022-01-19 22:47:40.612	{"firstName":"Administrator","lastName":"","parentNodeRef":"workspace://SpacesStore/79a7aeeb-d845-4e93-9353-a87dfa5307c5","nodeRef":"workspace://SpacesStore/e0a2499a-8217-439d-b0c1-9eb385bebefe","page":"document-details?nodeRef=workspace://SpacesStore/e0a2499a-8217-439d-b0c1-9eb385bebefe","title":"AVTR.html"}	@@NULL@@	org.alfresco.documentlibrary.file-added	avattar-alfresco	documentlibrary	admin	2022-01-19 22:48:00.119
4	2	2022-01-19 22:47:40.612	{"firstName":"Administrator","lastName":"","parentNodeRef":"workspace://SpacesStore/79a7aeeb-d845-4e93-9353-a87dfa5307c5","nodeRef":"workspace://SpacesStore/e0a2499a-8217-439d-b0c1-9eb385bebefe","page":"document-details?nodeRef=workspace://SpacesStore/e0a2499a-8217-439d-b0c1-9eb385bebefe","title":"AVTR.html"}	admin	org.alfresco.documentlibrary.file-added	avattar-alfresco	documentlibrary	admin	2022-01-19 22:48:00.15
5	3	2022-01-19 22:47:50.837	{"firstName":"Administrator","lastName":"","parentNodeRef":"workspace://SpacesStore/79a7aeeb-d845-4e93-9353-a87dfa5307c5","nodeRef":"workspace://SpacesStore/cecbc25a-5e1f-4beb-ac58-7e21bbe7e804","page":"document-details?nodeRef=workspace://SpacesStore/cecbc25a-5e1f-4beb-ac58-7e21bbe7e804","title":"COMPU-06.png"}	@@NULL@@	org.alfresco.documentlibrary.file-added	avattar-alfresco	documentlibrary	admin	2022-01-19 22:48:30.138
6	3	2022-01-19 22:47:50.837	{"firstName":"Administrator","lastName":"","parentNodeRef":"workspace://SpacesStore/79a7aeeb-d845-4e93-9353-a87dfa5307c5","nodeRef":"workspace://SpacesStore/cecbc25a-5e1f-4beb-ac58-7e21bbe7e804","page":"document-details?nodeRef=workspace://SpacesStore/cecbc25a-5e1f-4beb-ac58-7e21bbe7e804","title":"COMPU-06.png"}	admin	org.alfresco.documentlibrary.file-added	avattar-alfresco	documentlibrary	admin	2022-01-19 22:48:30.153
7	4	2022-01-19 22:47:50.856	{"firstName":"Administrator","lastName":"","parentNodeRef":"workspace://SpacesStore/79a7aeeb-d845-4e93-9353-a87dfa5307c5","nodeRef":"workspace://SpacesStore/d2882da6-dbad-4e4a-80f5-ef8380f6f526","page":"document-details?nodeRef=workspace://SpacesStore/d2882da6-dbad-4e4a-80f5-ef8380f6f526","title":"ICONO-06.png"}	@@NULL@@	org.alfresco.documentlibrary.file-added	avattar-alfresco	documentlibrary	admin	2022-01-19 22:48:30.153
8	4	2022-01-19 22:47:50.856	{"firstName":"Administrator","lastName":"","parentNodeRef":"workspace://SpacesStore/79a7aeeb-d845-4e93-9353-a87dfa5307c5","nodeRef":"workspace://SpacesStore/d2882da6-dbad-4e4a-80f5-ef8380f6f526","page":"document-details?nodeRef=workspace://SpacesStore/d2882da6-dbad-4e4a-80f5-ef8380f6f526","title":"ICONO-06.png"}	admin	org.alfresco.documentlibrary.file-added	avattar-alfresco	documentlibrary	admin	2022-01-19 22:48:30.153
9	5	2022-01-19 22:47:50.925	{"firstName":"Administrator","lastName":"","parentNodeRef":"workspace://SpacesStore/79a7aeeb-d845-4e93-9353-a87dfa5307c5","nodeRef":"workspace://SpacesStore/89c2308b-2ecc-46f2-8995-f851fa91039f","page":"document-details?nodeRef=workspace://SpacesStore/89c2308b-2ecc-46f2-8995-f851fa91039f","title":"ROBOT-06.png"}	@@NULL@@	org.alfresco.documentlibrary.file-added	avattar-alfresco	documentlibrary	admin	2022-01-19 22:48:30.153
10	5	2022-01-19 22:47:50.925	{"firstName":"Administrator","lastName":"","parentNodeRef":"workspace://SpacesStore/79a7aeeb-d845-4e93-9353-a87dfa5307c5","nodeRef":"workspace://SpacesStore/89c2308b-2ecc-46f2-8995-f851fa91039f","page":"document-details?nodeRef=workspace://SpacesStore/89c2308b-2ecc-46f2-8995-f851fa91039f","title":"ROBOT-06.png"}	admin	org.alfresco.documentlibrary.file-added	avattar-alfresco	documentlibrary	admin	2022-01-19 22:48:30.153
11	6	2022-01-19 22:47:50.931	{"firstName":"Administrator","lastName":"","parentNodeRef":"workspace://SpacesStore/79a7aeeb-d845-4e93-9353-a87dfa5307c5","nodeRef":"workspace://SpacesStore/053777c9-5ebf-402f-aeff-7e405d3c76dd","page":"document-details?nodeRef=workspace://SpacesStore/053777c9-5ebf-402f-aeff-7e405d3c76dd","title":"logo-avtr.png"}	@@NULL@@	org.alfresco.documentlibrary.file-added	avattar-alfresco	documentlibrary	admin	2022-01-19 22:48:30.153
12	6	2022-01-19 22:47:50.931	{"firstName":"Administrator","lastName":"","parentNodeRef":"workspace://SpacesStore/79a7aeeb-d845-4e93-9353-a87dfa5307c5","nodeRef":"workspace://SpacesStore/053777c9-5ebf-402f-aeff-7e405d3c76dd","page":"document-details?nodeRef=workspace://SpacesStore/053777c9-5ebf-402f-aeff-7e405d3c76dd","title":"logo-avtr.png"}	admin	org.alfresco.documentlibrary.file-added	avattar-alfresco	documentlibrary	admin	2022-01-19 22:48:30.153
\.


--
-- Data for Name: alf_activity_feed_control; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY alf_activity_feed_control (id, feed_user_id, site_network, app_tool, last_modified) FROM stdin;
\.


--
-- Name: alf_activity_feed_control_seq; Type: SEQUENCE SET; Schema: public; Owner: alfresco
--

SELECT pg_catalog.setval('alf_activity_feed_control_seq', 1, false);


--
-- Name: alf_activity_feed_seq; Type: SEQUENCE SET; Schema: public; Owner: alfresco
--

SELECT pg_catalog.setval('alf_activity_feed_seq', 12, true);


--
-- Data for Name: alf_activity_post; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY alf_activity_post (sequence_id, post_date, status, activity_data, post_user_id, job_task_node, site_network, app_tool, activity_type, last_modified) FROM stdin;
\.


--
-- Name: alf_activity_post_seq; Type: SEQUENCE SET; Schema: public; Owner: alfresco
--

SELECT pg_catalog.setval('alf_activity_post_seq', 6, true);


--
-- Data for Name: alf_applied_patch; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY alf_applied_patch (id, description, fixes_from_schema, fixes_to_schema, applied_to_schema, target_schema, applied_on_date, applied_to_server, was_executed, succeeded, report) FROM stdin;
patch.db-V4.0-Activiti-task-id-indexes	patch.schemaUpgradeScript.description	0	6003	-1	6004	2022-01-19 22:30:36.295	UNKNOWN	f	t	Placeholder for Activiti bootstrap at schema -1
patch.db-V4.1-increase-column-size-activiti	patch.increaseColumnSizeActiviti.description	0	6012	-1	6013	2022-01-19 22:30:36.373	UNKNOWN	f	t	Placeholder for Activiti bootstrap at schema -1
patch.db-V4.1-remove-column-activiti	patch.removeColumnActiviti.description	0	6017	-1	6018	2022-01-19 22:30:36.373	UNKNOWN	f	t	Placeholder for Activiti bootstrap at schema -1
patch.db-V4.2-upgrade-to-activiti-5.10	patch.upgradeToActiviti5-10.description	0	6018	-1	6019	2022-01-19 22:30:36.388	UNKNOWN	f	t	Placeholder for Activiti bootstrap at schema -1
patch.db-V4.1-rename-constraint-activiti	patch.renameConstraintActiviti.description	0	6020	-1	6021	2022-01-19 22:30:36.404	UNKNOWN	f	t	Placeholder for Activiti bootstrap at schema -1
patch.db-V4.2-add-activti-index-historic-activity	patch.addActivtiIndexHistoricActivity.description	0	6021	-1	6022	2022-01-19 22:30:36.404	UNKNOWN	f	t	Placeholder for Activiti bootstrap at schema -1
patch.db-V4.2-upgrade-to-activiti-5.11	patch.upgradeToActiviti5-11.description	0	6022	-1	6023	2022-01-19 22:30:36.404	UNKNOWN	f	t	Placeholder for Activiti bootstrap at schema -1
patch.db-v4.2-migrate-activiti-workflows	patch.db-v4.2-migrate-activiti-workflows.description	0	10000	-1	10001	2022-01-19 22:30:36.404	UNKNOWN	f	t	Placeholder for Activiti bootstrap at schema -1
patch.db-V4.2-remove-old-index-act	patch.db-V4.2-remove-old-index-act.description	0	6027	-1	6028	2022-01-19 22:30:36.451	UNKNOWN	f	t	Placeholder for Activiti bootstrap at schema -1
patch.db-V4.2-upgrade-to-activiti-5.13	patch.upgradeToActiviti5-13.description	0	6028	-1	6029	2022-01-19 22:30:36.451	UNKNOWN	f	t	Placeholder for Activiti bootstrap at schema -1
patch.db-V5.0-upgrade-to-activiti-5.16.2	patch.db-V5.0-upgrade-to-activiti-5.16.2.description	0	8003	-1	8004	2022-01-19 22:30:36.451	UNKNOWN	f	t	Placeholder for Activiti bootstrap at schema -1
patch.db-V5.0-upgrade-to-activiti-5.16.4	patch.db-V5.0-upgrade-to-activiti-5.16.4.description	0	8008	-1	8009	2022-01-19 22:30:36.467	UNKNOWN	f	t	Placeholder for Activiti bootstrap at schema -1
patch.db-V5.0-remove-columns-after-upgrade-to-activiti-5.16.2	patch.db-V5.0-remove-columns-after-upgrade-to-activiti-5.16.2.description	0	9002	-1	9003	2022-01-19 22:30:36.467	UNKNOWN	f	t	Placeholder for Activiti bootstrap at schema -1
patch.db-V5.0-update-activiti-default-timestamp-column	patch.db-V5.0-update-activiti-default-timestamp-column.description	0	9012	-1	9013	2022-01-19 22:30:36.467	UNKNOWN	f	t	Placeholder for Activiti bootstrap at schema -1
patch.db-V5.0-activiti-correct-tenant-id-MSSQL	patch.db-V5.0-activiti-correct-tenant-id-MSSQL.description	0	9016	-1	9017	2022-01-19 22:30:36.467	UNKNOWN	f	t	Placeholder for Activiti bootstrap at schema -1
patch.db-V5.1-upgrade-to-activiti-5.19.0	patch.db-V5.1-upgrade-to-activiti-5.19.0	0	9013	-1	9014	2022-01-19 22:30:36.482	UNKNOWN	f	t	Placeholder for Activiti bootstrap at schema -1
patch.db-V3.4-UsageTables	Manually executed script upgrade V3.4: Usage Tables	0	113	-1	114	2022-01-19 22:31:07.764	UNKNOWN	t	t	Script completed
patch.db-V4.0-TenantTables	Manually executed script upgrade V4.0: Tenant Tables	0	6004	-1	6005	2022-01-19 22:31:07.842	UNKNOWN	t	t	Script completed
patch.db-V4.1-AuthorizationTables	Manually executed script upgrade V4.1: Authorization status tables	0	6075	-1	6076	2022-01-19 22:31:07.889	UNKNOWN	t	t	Script completed
patch.db-V5.0-ContentUrlEncryptionTables	Manually executed script upgrade V5.0: Content Url Encryption Tables	0	8001	-1	8002	2022-01-19 22:31:07.998	UNKNOWN	t	t	Script completed
patch.savedSearchesFolder	Ensures the existence of the 'Saved Searches' folder.	0	1	10057	2	2022-01-19 22:31:07.998	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.updatePermissionData	Update permissions from 'folder' to 'cmobject' [JIRA: AR-344].	0	2	10057	3	2022-01-19 22:31:08.014	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.guestUser	Add the guest user, guest home space; and fix permissions on company home, guest home and guest person. 	0	2	10057	3	2022-01-19 22:31:08.014	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.fixNodeSerializableValues	Ensure that property values are not stored as Serializable if at all possible	0	3	10057	4	2022-01-19 22:31:08.029	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.savedSearchesPermission	Sets required permissions on 'Saved Searches' folder.	0	4	10057	5	2022-01-19 22:31:08.045	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.updateGuestPermission	Rename guest permission from 'Guest' to 'Consumer'	0	5	10057	6	2022-01-19 22:31:08.061	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.guestPersonPermission	Change Guest Person permission from 'Consumer' to 'Read'	0	5	10057	6	2022-01-19 22:31:08.092	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.spacesRootPermission	Change Spaces store root permission from 'Consumer' to 'Read'	0	5	10057	6	2022-01-19 22:31:08.17	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.categoryRootPermission	Sets required permissions on 'Category Root' folder.	0	5	10057	6	2022-01-19 22:31:08.201	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.contentPermission	Update permission entries from 'cm:content' to 'sys:base'.	0	6	10057	7	2022-01-19 22:31:08.217	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.descriptorUpdate	Update Repository descriptor	0	11	10057	12	2022-01-19 22:31:08.248	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.forumsIcons	Updates forums icon references	0	12	10057	13	2022-01-19 22:31:08.279	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.emailTemplatesFolder	Ensures the existence of the 'Email Templates' folder.	0	12	10057	13	2022-01-19 22:31:08.311	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.emailTemplatesContent	Loads the email templates into the Email Templates folder.	0	12	10057	13	2022-01-19 22:31:08.326	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.scriptsFolder	Ensures the existence of the 'Scripts' folder.	0	12	10057	13	2022-01-19 22:31:08.373	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.fixAclInheritance	Fixes any ACL inheritance issues.	0	5005	10057	5006	2022-01-19 22:31:09.279	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.topLevelGroupParentChildAssociationTypePatch	Ensure top level groups have the correct child association type.	0	13	10057	14	2022-01-19 22:31:08.389	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.actionRuleDecouplingPatch	Migrate existing rules to the updated model where rules are decoupled from actions.	0	14	10057	15	2022-01-19 22:31:08.435	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.systemWorkflowFolderPatch	Ensures the existence of the system workflow container.	0	15	10057	16	2022-01-19 22:31:08.498	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.rssFolder	Ensures the existence of the 'RSS Templates' folder.	0	16	10057	17	2022-01-19 22:31:08.514	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.uifacetsTemplates	Removes the incorrectly applied uifacets aspect from presentation template files.	0	17	10057	18	2022-01-19 22:31:08.529	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.guestPersonPermission2	Change Guest Person permission to visible by all users as 'Consumer'.	0	18	10057	19	2022-01-19 22:31:08.545	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.schemaUpdateScript-V1.4-1	Ensures that the database upgrade script has been run.	0	19	10057	20	2022-01-19 22:31:08.576	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.uniqueChildName	Checks and renames duplicate children.	0	19	10057	20	2022-01-19 22:31:08.576	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.schemaUpdateScript-V1.4-2	Ensures that the database upgrade script has been run.	0	20	10057	21	2022-01-19 22:31:08.592	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.InvalidNameEnding	Fixes names ending with a space or full stop.	0	21	10057	22	2022-01-19 22:31:08.592	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.systemDescriptorContent	Adds the version properties content to the system descriptor.	0	22	10057	23	2022-01-19 22:31:08.592	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.multilingualBootstrap	Bootstraps the node that will hold the multilingual containers.	0	29	10057	30	2022-01-19 22:31:08.608	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.LinkNodeFileExtension	Fixes link node file extensions to have a .url extension.	0	33	10057	34	2022-01-19 22:31:08.623	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.systemRegistryBootstrap	Bootstraps the node that will hold system registry metadata.	0	34	10057	35	2022-01-19 22:31:08.623	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.userAndPersonUserNamesAsIdentifiers	Reindex usr:user and cm:person uids as identifiers	0	35	10057	36	2022-01-19 22:31:08.639	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.contentFormFolderType	No patch description available	0	36	10057	37	2022-01-19 22:31:08.639	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.versionHistoryPerformance	Improves the performance of version history lookups.	0	38	10057	39	2022-01-19 22:31:08.654	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.webscripts	Adds Web Scripts to Data Dictionary.	0	50	10057	51	2022-01-19 22:31:08.654	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.db-V2.1-JBPMUpdate	Ensures that the database upgrade script has been run.	0	51	10057	52	2022-01-19 22:31:08.67	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.db-V2.1-NotNullColumns	Ensures that the database upgrade script has been run.	0	51	10057	52	2022-01-19 22:31:08.67	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.groupNamesAsIdentifiers	Reindex usr:authorityContainer gids as identifiers	0	51	10057	52	2022-01-19 22:31:08.67	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.invalidUserPersonAndGroup	Fix up invalid uids for people and users; and invalid gids for groups	0	51	10057	52	2022-01-19 22:31:08.67	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.webscriptsExtension	Adds Web Scripts Extension to Data Dictionary.	0	54	10057	55	2022-01-19 22:31:08.685	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.groupMembersAsIdentifiers	Reindex usr:authorityContainer members as identifiers	0	56	10057	57	2022-01-19 22:31:08.685	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.redeploySubmitProcess	No patch description available	0	57	10057	58	2022-01-19 22:31:08.701	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.ReadmeTemplate	Deployed ReadMe Template	0	59	10057	60	2022-01-19 22:31:08.717	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.webScriptsReadme	Applied ReadMe template to Web Scripts folders	0	59	10057	60	2022-01-19 22:31:08.732	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.db-V2.1-JBPMProcessKey	Ensures that the database upgrade script has been run.	0	62	10057	63	2022-01-19 22:31:08.732	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.db-V2.1-VersionColumns2	Ensures that the database upgrade script has been run.	0	63	10057	64	2022-01-19 22:31:08.732	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.db-V2.2-CleanNodeStatuses	Ensures that the database upgrade script has been run.	0	89	10057	90	2022-01-19 22:31:08.748	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.webscripts2	Adds Web Scripts (second set) to Data Dictionary.	0	100	10057	101	2022-01-19 22:31:08.748	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.customModels	Adds 'Models' folder to Data Dictionary	0	101	10057	102	2022-01-19 22:31:08.748	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.customMessages	Adds 'Messages' folder to Data Dictionary	0	101	10057	102	2022-01-19 22:31:08.764	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.customWebClientExtension	Adds 'Web Client Extension' folder to Data Dictionary	0	101	10057	102	2022-01-19 22:31:08.764	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.webscripts3	Update Web Scripts ReadMe.	0	104	10057	105	2022-01-19 22:31:08.779	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.customWorkflowDefs	Adds 'Workflow Definitions' folder to Data Dictionary.	0	105	10057	106	2022-01-19 22:31:08.779	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.db-V1.4-TxnCommitTimeIndex	Ensures that the database upgrade script has been run.	0	110	10057	111	2022-01-19 22:31:08.779	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.formsFolder	Adds 'Forms' folder to Data Dictionary.	0	112	10057	113	2022-01-19 22:31:08.795	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.tagRootCategory	Adds 'Tags' as new top-level category root.	0	113	10057	114	2022-01-19 22:31:08.81	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.db-V2.2-ACL-From-2.1-A	Ensures that the database upgrade script has been run.	0	119	10057	120	2022-01-19 22:31:08.826	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.db-V2.2-ACL	Ensures that the database upgrade script has been run.	0	119	10057	120	2022-01-19 22:31:08.826	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.db-V2.2-0-CreateMissingTables	Ensures that the database upgrade script has been run.	0	120	10057	121	2022-01-19 22:31:08.842	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.db-V2.2-2-MoveQNames	A placeholder patch; usually marks a superceded patch.	0	120	10057	121	2022-01-19 22:31:08.842	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.db-V2.0-ContentUrls	Ensures that the database upgrade script has been run.	0	123	10057	124	2022-01-19 22:31:08.857	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.updateDmPermissions	Update ACLs on all DM node objects to the new 3.0 permission model	0	124	10057	125	2022-01-19 22:31:08.857	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.db-V3.0-0-CreateActivitiesExtras	Replaced by 'patch.db-V3.0-ActivityTables', which must run first.	0	125	10057	126	2022-01-19 22:31:08.857	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.db-V3.0-ActivityTables	Ensures that the database upgrade script has been run.	0	125	10057	126	2022-01-19 22:31:08.873	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.createSiteStore	A placeholder patch; usually marks a superceded patch.	0	126	10057	127	2022-01-19 22:31:08.873	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.sitesFolder	Adds 'Sites' folder to Company Home.	0	127	10057	128	2022-01-19 22:31:08.873	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.sitePermissionRefactorPatch	Create permission groups for sites.	0	128	10057	129	2022-01-19 22:31:08.873	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.migrateVersionStore	Version Store migration (from lightWeightVersionStore to version2Store)	0	129	10057	130	2022-01-19 22:31:08.889	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.inviteEmailTemplate	Adds invite email template to invite space	0	130	10057	131	2022-01-19 22:31:08.889	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.calendarNamespaceUri	Update the Calendar model namespace URI and reindex all calendar objects.	0	131	10057	132	2022-01-19 22:31:08.889	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.db-V2.1-AuditPathIndex	Ensures that the database upgrade script has been run.	0	132	10057	133	2022-01-19 22:31:08.889	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.spacesStoreGuestPermission	Sets READ permissions for GUEST on root node of the SpacesStore.	0	133	10057	134	2022-01-19 22:31:08.904	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.db-V2.2-Upgrade-From-2.1	Ensures that the database upgrade script has been run.	0	120	10057	135	2022-01-19 22:31:08.904	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.db-V2.2-Upgrade-From-2.2SP1	Ensures that the database upgrade script has been run.	0	134	10057	135	2022-01-19 22:31:08.904	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.webSiteAddModerated	Changing Web Site visibility from a boolean to enum.	0	2006	10057	2007	2022-01-19 22:31:08.904	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.invitationMigration	Migrate invitations from old invite service to invitation service	0	2006	10057	2007	2022-01-19 22:31:08.904	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.mtShareExistingTenants	Update existing tenants for MT Share.	0	2008	10057	2009	2022-01-19 22:31:08.92	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.redeployInvitationProcess	Re-deploy Invitation Process Definitions.	0	2009	10057	2010	2022-01-19 22:31:08.92	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.db-V3.2-LockTables	Ensures that the database upgrade script has been run.	0	2010	10057	2011	2022-01-19 22:31:08.92	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.zonedAuthorities	Adds the remodelled cm:authority container to the spaces store	0	2011	10057	2012	2022-01-19 22:31:08.92	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.authorityMigration	Copies any old authorities from the user store to the spaces store.	0	2012	10057	2013	2022-01-19 22:31:08.935	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.authorityDefaultZonesPatch	Adds groups and people to the appropriate zones for share and everything else.	0	2013	10057	2014	2022-01-19 22:31:08.935	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.db-V3.2-ContentTables	Ensures that the database upgrade script has been run.	0	2015	10057	2016	2022-01-19 22:31:08.935	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.db-V3.4-Upgrade-JBPM	Ensures that the database upgrade script has been run.	0	2017	10057	2018	2022-01-19 22:31:08.935	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.db-V3.2-Upgrade-JBPM	A placeholder patch; usually marks a superceded patch.	0	2017	10057	2018	2022-01-19 22:31:08.951	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.imapFolders	Creates folders tree necessary for IMAP functionality	0	2018	10057	2019	2022-01-19 22:31:08.951	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.db-V3.2-PropertyValueTables	Ensures that the database upgrade script has been run.	0	3000	10057	3001	2022-01-19 22:31:08.967	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.db-V3.2-AuditTables	Ensures that the database upgrade script has been run.	0	3001	10057	3002	2022-01-19 22:31:08.967	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.db-V2.2-Person-3	Ensures that the database upgrade script has been run.	0	3002	10057	3003	2022-01-19 22:31:08.967	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.db-V3.1-Allow-IPv6	Ensures that the database upgrade script has been run.	0	3003	10057	3004	2022-01-19 22:31:08.967	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.personUsagePatch	Add person 'cm:sizeCurrent' property (if missing).	0	3004	10057	3005	2022-01-19 22:31:08.982	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.db-V3.2-Child-Assoc-QName-CRC	Ensures that the database upgrade script has been run.	0	3005	10057	3006	2022-01-19 22:31:08.982	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.fixNameCrcValues-2	Fixes name and qname CRC32 values to match UTF-8 encoding.	0	3006	10057	3007	2022-01-19 22:31:08.982	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.redeployNominatedInvitationProcessWithPropsForShare	Redeploy nominated invitation workflow	0	4000	10057	4001	2022-01-19 22:31:08.998	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.db-V3.2-ContentTables2	Ensures that the database upgrade script has been run.	0	4001	10057	4002	2022-01-19 22:31:08.998	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.db-V3.3-Remove-VersionCount	Ensures that the database upgrade script has been run.	0	4002	10057	4003	2022-01-19 22:31:08.998	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.rendition.rendering_actions	Creates the Rendering Actions folder.	0	4003	10057	4004	2022-01-19 22:31:09.014	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.thumbnailsAssocQName	Update the 'cm:thumbnails' association QName to 'rn:rendition'.	0	4004	10057	4005	2022-01-19 22:31:09.014	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.emailInviteAndNotifyTemplatesFolder	Ensures the existence of the 'Email Invite Templates' and 'Email Notify Templates' folders.	0	4006	10057	4007	2022-01-19 22:31:09.014	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.convertContentUrls	Converts pre-3.2 content URLs to use the alf_content_data table.  The conversion work can also be done on a schedule; please contact Alfresco Support for further details.	0	4007	10057	4008	2022-01-19 22:31:09.029	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.transferServiceFolder	Add transfer definitions folder to data dictionary.	0	4008	10057	4009	2022-01-19 22:31:09.045	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.db-V3.4-authority-unique-idx	Ensures that the database upgrade script has been run.	0	4099	10057	4100	2022-01-19 22:31:09.045	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.fixAuthoritiesCrcValues	Fixes authority CRC32 values to match UTF-8 encoding.	0	4100	10057	4101	2022-01-19 22:31:09.06	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.updateMimetypes1	Fix mimetypes for Excel and Powerpoint.	0	4101	10057	4102	2022-01-19 22:31:09.06	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.db-V3.3-modify-index-permission_id	Ensures that the database upgrade script has been run.	0	4102	10057	4103	2022-01-19 22:31:09.06	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.db-V3.2-AddFKIndexes	Ensures that the database upgrade script has been run.	3007	4103	10057	4104	2022-01-19 22:31:09.076	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.db-V3.3-Fix-Repo-Seqs	Ensures that the database upgrade script has been run.	0	4104	10057	4105	2022-01-19 22:31:09.076	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.db-V3.4-property-unique-ctx-value	Ensures that the database upgrade script has been run.	0	4104	10057	4105	2022-01-19 22:31:09.076	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.db-V3.4-property-unique-ctx-idx	Ensures that the database upgrade script has been run.	0	4104	10057	4105	2022-01-19 22:31:09.076	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.db-V3.4-child-assoc-indexes	Ensures that the database upgrade script has been run.	0	4104	10057	4105	2022-01-19 22:31:09.092	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.db-V3.3-JBPM-Extra	Ensures that the database upgrade script has been run.	0	4105	10057	4106	2022-01-19 22:31:09.092	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.db-V3.3-Node-Prop-Serializable	Ensures that the database upgrade script has been run.	0	4105	10057	4106	2022-01-19 22:31:09.107	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.migrateAttrTenants	Migrate old Tenant attributes	0	4105	10057	4106	2022-01-19 22:31:09.107	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.migrateAttrPropBackedBeans	Migrate old Property-Backed Bean component attributes	0	4106	10057	4107	2022-01-19 22:31:09.107	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.migrateAttrChainingURS	Migrate old Chaining User Registry Synchronizer attributes	0	4106	10057	4107	2022-01-19 22:31:09.107	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.migrateAttrDelete	A placeholder patch; usually marks a superceded patch.	0	4106	10057	4107	2022-01-19 22:31:09.123	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.replication.replication_actions	Creates the Replication Actions folder.	0	4107	10057	4108	2022-01-19 22:31:09.123	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.transfer.targetrulefolder	Creates the transfer target rule folder for the default transfer group.	0	4108	10057	4109	2022-01-19 22:31:09.154	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.transfer.targetrule	Creates the transfer target rule for the default transfer group.	0	4108	10057	4109	2022-01-19 22:31:09.17	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.actions.scheduledfolder	Creates the scheduled actions folder in the Data Dictionary.	0	4109	10057	4110	2022-01-19 22:31:09.201	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.updateMimetypes2	Fix mimetypes for Excel and Powerpoint.	0	4110	10057	4111	2022-01-19 22:31:09.217	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.db-V3.2-AddFKIndexes-2	Ensures that the database upgrade script has been run.	0	4111	10057	4112	2022-01-19 22:31:09.217	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.redeployJbpmAdhocWorkflow	Redeploy JBPM adhoc workflow	0	4204	10057	4205	2022-01-19 22:31:09.232	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.imapSpacesLocaleTemplates	A placeholder patch; usually marks a superceded patch.	0	4302	10057	4305	2022-01-19 22:31:09.248	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.mtFixAdminExistingTenants	Fix bootstrapped creator/modifier	0	5002	10057	5003	2022-01-19 22:31:09.248	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.fixUserQNames	Fixes user store qnames to improve native authentication performance	0	5003	10057	5004	2022-01-19 22:31:09.248	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.activitiesEmailTemplate	Creates activities email templates.	0	5005	10057	5006	2022-01-19 22:31:09.264	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.newUserEmailTemplates	Adds the email templates for notifying new users of their accounts	0	5005	10057	5006	2022-01-19 22:31:09.264	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.inviteEmailTemplates	Adds the email templates for inviting users to a Site	0	5005	10057	5006	2022-01-19 22:31:09.264	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.htmlNotificationMailTemplates	Adds HTML email templates for notifying users of new content	0	5005	10057	5006	2022-01-19 22:31:09.279	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.db-V3.4-VarcharFieldSizesQuadrupleIncreasing	ALF-4300: Increasing 'VARCHAR' field sizes quadruply for DB2 dialect	0	5005	10057	5006	2022-01-19 22:31:09.279	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.db-V3.4-JBPM-FK-indexes	Ensures that the database upgrade script has been run.	0	5005	10057	5006	2022-01-19 22:31:09.295	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.imap.clear.old.messages	Remove old IMAP message templates	0	5005	10057	5006	2022-01-19 22:31:09.295	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.imapSpacesTemplates2	Replaces content templates for IMAP clients	0	5005	10057	5006	2022-01-19 22:31:09.295	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.migrateAttrDropOldTables	Drops old alf_*attribute* tables and sequence	0	5006	10057	5007	2022-01-19 22:31:09.295	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.db-V4.0-AclChangeSet	Ensures that the database upgrade script has been run.	0	5007	10057	5008	2022-01-19 22:31:09.31	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.db-V4.0-NodeAssoc-Ordering	Ensures that the database upgrade script has been run.	0	5008	10057	5009	2022-01-19 22:31:09.31	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.db-V4.0-Node-Locale	Ensures that the database upgrade script has been run.	0	5009	10057	5010	2022-01-19 22:31:09.31	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.activitiesTemplatesUpdate	Updates activities email templates.	0	5010	10057	5011	2022-01-19 22:31:09.31	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.followingMailTemplates	Adds email templates for following notifications	0	5010	10057	5011	2022-01-19 22:31:09.326	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.db-V4.0-SubscriptionTables	Ensures that the database upgrade script has been run.	0	5010	10057	5011	2022-01-19 22:31:09.326	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.copiedFromAspect	Adds peer associations for cm:copiedfrom and cm:workingcopy (new model) and removes cm:source property	0	5012	10057	5013	2022-01-19 22:31:09.326	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.publishing.root	Creates the publishing root folder in the Data Dictionary	0	5013	10057	5014	2022-01-19 22:31:09.326	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.workflowNotification	Patch to add workflow email notification email folder and template.	0	5014	10057	5015	2022-01-19 22:31:09.326	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.nodeTemplatesFolder	Patch to create new Data Dictionary folder for Share - Create Node by Template	0	5015	10057	5016	2022-01-19 22:31:09.342	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.updateMimetypes3	Fix mimetype for MPEG Audio	0	5016	10057	5017	2022-01-19 22:31:09.342	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.sitesSpacePermissions	Patch to remove the EVERYONE Contributor permissions on the Sites Space (parent container of all Sites)	0	5017	10057	5018	2022-01-19 22:31:09.342	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.updateWorkflowNotificationTemplates	Patch to update the workflow notification templates.	0	5018	10057	5019	2022-01-19 22:31:09.342	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.updateMimetypes4	Rationalise mimetypes for PhotoShop and AutoCad	0	5019	10057	5020	2022-01-19 22:31:09.357	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.updateMimetypesWMA	Fix mimetype for MS WMA Streaming Audio	0	5020	10057	5021	2022-01-19 22:31:09.357	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.updateFollowingEmailTemplatesPatch	Patch to update the following notification email templates.	0	5021	10057	5022	2022-01-19 22:31:09.373	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.db-V4.0-SolrTracking	Ensures that the database upgrade script has been run.	0	5022	10057	5023	2022-01-19 22:31:09.373	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.addDutchEmailTemplatesPatch	Patch to add Dutch email templates.	0	5023	10057	5024	2022-01-19 22:31:09.373	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.fixBpmPackages	Corrects workflow package types and associations 	0	5024	10057	5025	2022-01-19 22:31:09.389	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.db-V3.4-alter-jBPM331-CLOB-columns-to-nvarchar	Altering CLOB columns in the jBPM 3.3.1 tables to introduce Unicode characters support for jBPM 3.3.1	0	6000	10057	6001	2022-01-19 22:31:09.389	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.imapUnsubscribedAspect	Patch to remove deprecated "imap:nonSubscribed" aspect from folders.	0	6001	10057	6002	2022-01-19 22:31:09.389	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.remoteCredentialsContainer	Patch to add the root folder for Shared Remote Credentials	0	6005	10057	6006	2022-01-19 22:31:09.389	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.syncSetDefinitionsContainer	Patch to add the root folder for SyncSet Definitions	0	6005	10057	6006	2022-01-19 22:31:09.404	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.migrateTenantsFromAttrsToTable	Migrate Tenant attributes to Tenant table	0	6006	10057	6007	2022-01-19 22:31:09.404	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.swsdpPatch	Patch to fix up the Sample: Web Site Design Project.	0	6007	10057	6008	2022-01-19 22:31:09.404	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.db-V4.0-AclChangeSet2	Ensures that the database upgrade script has been run.	0	6008	10057	6009	2022-01-19 22:31:09.404	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.redeployParallelActivitiWorkflows	Patch that redeploys both parallel activiti workflows, completion-condition now takes into account if minimum approval percentage can still be achived.	0	6009	10057	6010	2022-01-19 22:31:09.42	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.db-V3.4-remove-redundant-jbpm-indexes	Ensures that the database upgrade script has been run.	0	6010	10057	6011	2022-01-19 22:31:09.42	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.show.audit	Updates show_audit.ftl file for upgrade from v3.3.5 to v3.4.x (ALF-13929)	0	6011	10057	6012	2022-01-19 22:31:09.42	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.updateMimetypesSVG	Fix mimetype for Scalable Vector Graphics Image	0	6013	10057	6014	2022-01-19 22:31:09.42	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.db-V4.1-NodeDeleted	Ensures that the database upgrade script has been run.	0	6014	10057	6015	2022-01-19 22:31:09.435	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.updateMimetypesVISIO	Fix mimetype for Microsoft Visio	0	6015	10057	6016	2022-01-19 22:31:09.435	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.db-V3.4-JBPM-varinst-indexes	Ensures that the database upgrade script has been run.	0	6016	10057	6017	2022-01-19 22:31:09.435	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.emailAliasableAspect	Add email aliases to attrubute table	0	6019	10057	6020	2022-01-19 22:31:09.451	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.db-V4.1-drop-alfqname-fk-indexes	Ensures that the database upgrade script has been run.	0	6023	10057	6024	2022-01-19 22:31:09.467	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.sharedFolder	Add Shared Folder	0	6023	10057	6024	2022-01-19 22:31:09.467	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.db-V4.2-remove-index-acl_id	ALF-12284 : Update ALF_ACL_MEMBER_member table. Remove index acl_id.	0	6024	10057	6025	2022-01-19 22:31:09.467	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.db-V4.1-drop-activiti-feed-format	Ensures that the database upgrade script has been run.	0	6025	10057	6026	2022-01-19 22:31:09.482	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.calendarAllDayEventDatesCorrectingPatch	This patch corrects 'to' and 'from' dates for Calendar 'All Day' Events from version 3.4 which did not take account of time zone offsets	0	6026	10057	6027	2022-01-19 22:31:09.514	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.redeployActivitiWorkflowsForCategory	Redeploy internal process definitions for category update	0	6027	10057	6028	2022-01-19 22:31:09.529	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.redeployParallelActivitiWorkflows-after-5-11-upgrade	Patch that redeploys both parallel activiti workflows, completion-condition now takes into account if minimum approval percentage can still be achived.	0	6029	10057	6030	2022-01-19 22:31:09.529	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.db-V4.1-fix-Repo-seqs-order	Ensures that the database upgrade script has been run.	0	6030	10057	6031	2022-01-19 22:31:09.545	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.db-V4.1-ChildAssoc-OrderBy	Ensures that the database upgrade script has been run.	0	6032	10057	6033	2022-01-19 22:31:09.545	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.db-V4.1-createIdxAlfNodeTQN	Ensures that the database upgrade script has been run.	0	7000	10057	7001	2022-01-19 22:31:09.561	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.db-V4.2-restructure-idx_alf_nprop_s-MSSQL	Ensures that the database upgrade script has been run.	0	7001	10057	7002	2022-01-19 22:31:09.561	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.siteAdministrators	Adds the 'GROUP_SITE_ADMINISTRATORS' group	0	7002	10057	7003	2022-01-19 22:31:09.561	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.alfrescoSearchAdministrators	Adds the 'GROUP_ALFRESCO_SEARCH_ADMINISTRATORS' group	0	7003	10057	7004	2022-01-19 22:31:09.561	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.surfConfigFolder	Adds cm:indexControl aspect to surf-config children	0	7004	10057	7005	2022-01-19 22:31:09.576	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.renameSiteAuthorityDisplayName	Update authority display name for sites	0	8000	10057	8001	2022-01-19 22:31:09.576	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.db-V4.1-update-activiti-nullable-columns	Ensures that the database upgrade script has been run.	0	8005	10057	8006	2022-01-19 22:31:09.576	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.eol-wcmwf	Undeploys deprecated WCMWF Workflows	0	8007	10057	8008	2022-01-19 22:31:09.576	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.db-V4.2-migrate-locale-multilingual	Ensures that the database upgrade script has been run.	0	8018	10057	8019	2022-01-19 22:31:09.592	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.fixWebscriptTemplate	Reimport fixed sample template.	0	9000	10057	9001	2022-01-19 22:31:09.592	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.imapSpacesTemplates3	Replaces content templates for IMAP clients	0	9001	10057	9002	2022-01-19 22:31:09.592	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.addUnmovableAspect	Add unmovable aspect to sites.	0	9003	10057	9004	2022-01-19 22:31:09.607	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.deleteClassifibleAspectForFailedThumbnail	Deletes 'cm:generalclassifiable' aspect and associated properties for nodes of 'cm:failedThumbnail' type	0	9004	10057	9005	2022-01-19 22:31:09.607	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.downloadsFolder	Ensures the Syste Downloads folder exists.	0	9005	10057	9006	2022-01-19 22:31:09.607	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.fixPersonSizeCurrentType	Fix type of cm:sizeCurrent property.	0	9007	10057	9008	2022-01-19 22:31:09.607	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.alfrescoModelAdministrators	Adds the 'GROUP_ALFRESCO_MODEL_ADMINISTRATORS' group	0	9008	10057	9009	2022-01-19 22:31:09.623	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.addInviteAddDirectEmailTemplates	Adds the email templates for the add-direct invite flow	0	9009	10057	9010	2022-01-19 22:31:09.623	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.imapSpacesTemplates4	Replaces content templates for IMAP clients	0	9011	10057	9012	2022-01-19 22:31:09.639	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.addSurfConfigFolders	Adds 'cm:extensions' and 'cm:module-deployments' folders into surf-config folder.	0	9014	10057	9015	2022-01-19 22:31:09.639	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.spacesBootstrapSmartTemplatesFolder	Adds Smart Templates Folder in Data Dictionary.	0	9015	10057	9016	2022-01-19 22:31:09.654	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.spacesBootstrapSmartFolderExample	Adds smartFoldersExample.json file in Smart Templates Folder.	0	9015	10057	9016	2022-01-19 22:31:09.654	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.spacesBootstrapSmartDownloadFolder	Adds Smart Download Folder in Data Dictionary.	0	9015	10057	9016	2022-01-19 22:31:09.654	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.redeployInvitationNominatedAddDirectActivitiWorkflow	Patch that redeploys activitiInvitationNominatedAddDirect workflow after upgrade, needed for tenants created before 5.1	0	10001	10057	10002	2022-01-19 22:31:09.67	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.updateAdminUserWhenDefault	Update Admin User by removing the default SHA256 and falling back to the MD4 (please consider using BCRYPT instead)	0	10002	10057	10003	2022-01-19 22:31:09.685	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.addInviteModeratedEmailTemplates	Adds the email template for the invite moderated flow	0	10050	10057	10051	2022-01-19 22:31:09.685	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.redeployInvitationModeratedActivitiWorkflow	Redeploy invitation moderated workflow.	0	10052	10057	10053	2022-01-19 22:31:09.701	5.2.0 (re21f2be5-b22) - Community	f	t	Not relevant to schema 10,057
patch.exampleJavaScript	Loads sample Javascript file into datadictionary scripts folder	0	10057	10057	100000	2022-01-19 22:31:09.873	5.2.0 (re21f2be5-b22) - Community	t	t	Imported view into bootstrap location: /app:company_home/app:dictionary/app:scripts (workspace://SpacesStore/406a2101-3393-453b-8cd7-d32be618c954)
patch.siteLoadPatch.swsdp	Loads a sample site into the repository.	0	10057	10057	100000	2022-01-19 22:31:16.515	5.2.0 (re21f2be5-b22) - Community	t	t	Site swsdp imported.
\.


--
-- Data for Name: alf_audit_app; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY alf_audit_app (id, version, app_name_id, audit_model_id, disabled_paths_id) FROM stdin;
1	0	5	1	2
\.


--
-- Name: alf_audit_app_seq; Type: SEQUENCE SET; Schema: public; Owner: alfresco
--

SELECT pg_catalog.setval('alf_audit_app_seq', 1, true);


--
-- Data for Name: alf_audit_entry; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY alf_audit_entry (id, audit_app_id, audit_time, audit_user_id, audit_values_id) FROM stdin;
\.


--
-- Name: alf_audit_entry_seq; Type: SEQUENCE SET; Schema: public; Owner: alfresco
--

SELECT pg_catalog.setval('alf_audit_entry_seq', 1, false);


--
-- Data for Name: alf_audit_model; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY alf_audit_model (id, content_data_id, content_crc) FROM stdin;
1	1	252222308
2	2	1341618561
3	3	4227823780
\.


--
-- Name: alf_audit_model_seq; Type: SEQUENCE SET; Schema: public; Owner: alfresco
--

SELECT pg_catalog.setval('alf_audit_model_seq', 3, true);


--
-- Data for Name: alf_auth_status; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY alf_auth_status (id, username, deleted, authorized, checksum, authaction) FROM stdin;
\.


--
-- Name: alf_auth_status_seq; Type: SEQUENCE SET; Schema: public; Owner: alfresco
--

SELECT pg_catalog.setval('alf_auth_status_seq', 1, false);


--
-- Data for Name: alf_authority; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY alf_authority (id, version, authority, crc) FROM stdin;
1	0	GROUP_EVERYONE	1514782197
2	0	guest	2897713717
3	0	admin	2282622326
4	0	ROLE_OWNER	881792602
5	0	GROUP_ALFRESCO_MODEL_ADMINISTRATORS	1510054418
6	0	GROUP_site_swsdp_SiteManager	2553824491
7	0	GROUP_site_swsdp_SiteCollaborator	3822262144
8	0	GROUP_site_swsdp_SiteContributor	3082136708
9	0	GROUP_site_swsdp_SiteConsumer	4116454302
10	0	abeecher	2776041939
11	0	mjackson	4006557174
12	0	GROUP_site_avattar-alfresco_SiteManager	1303171293
13	0	GROUP_site_avattar-alfresco_SiteCollaborator	4190440739
14	0	GROUP_site_avattar-alfresco_SiteContributor	2071687824
15	0	GROUP_site_avattar-alfresco_SiteConsumer	976427667
\.


--
-- Data for Name: alf_authority_alias; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY alf_authority_alias (id, version, auth_id, alias_id) FROM stdin;
\.


--
-- Name: alf_authority_alias_seq; Type: SEQUENCE SET; Schema: public; Owner: alfresco
--

SELECT pg_catalog.setval('alf_authority_alias_seq', 1, false);


--
-- Name: alf_authority_seq; Type: SEQUENCE SET; Schema: public; Owner: alfresco
--

SELECT pg_catalog.setval('alf_authority_seq', 15, true);


--
-- Data for Name: alf_child_assoc; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY alf_child_assoc (id, version, parent_node_id, type_qname_id, child_node_name_crc, child_node_name, child_node_id, qname_ns_id, qname_localname, qname_crc, is_primary, assoc_index) FROM stdin;
1	1	1	4	-1658514887	fe900030-18bc-49b1-b47c-3cb1819bfd84	2	1	system	1509831379	t	-1
2	1	2	4	-3845192171	dc1de9f5-20a4-41bb-8d9a-1eb909970c36	3	1	people	3097839998	t	-1
3	1	3	4	-2986963284	d0314a27-50c8-4eac-9dcf-90a9eee40d8f	4	2	admin	3226179863	t	-1
4	1	5	4	-2174830600	6f4e460e-07c8-4939-aa44-af6864859c7c	6	1	descriptor	147310537	t	-1
5	1	5	4	-2023239389	db732146-dfee-40b9-b5dc-cc540aac4821	7	1	descriptor-current	369154895	t	-1
6	1	5	4	-1374578020	3a8de78a-9624-4c21-95c6-98dc323f095f	8	1	system-registry	3365896830	t	-1
7	1	12	4	-2330991652	1d8d5274-4340-492d-a16e-3a6ba69dd88c	13	7	company_home	1502496580	t	-1
8	1	13	33	3176102346	data dictionary	14	7	dictionary	3252140894	t	-1
9	1	14	33	1103883742	space templates	15	7	space_templates	3942413840	t	-1
10	1	14	33	1976539493	presentation templates	16	7	content_templates	1001730099	t	-1
11	1	14	33	1734425776	email templates	17	7	email_templates	3428231038	t	-1
12	1	17	33	3353481431	invite	18	6	invite	866784651	t	-1
13	1	14	33	666141259	rss templates	19	7	rss_templates	2421027117	t	-1
14	1	14	33	568537909	saved searches	20	7	saved_searches	3343229978	t	-1
15	1	14	33	3709769534	scripts	21	7	scripts	454145674	t	-1
16	1	14	33	1943383032	node templates	22	7	node_templates	3173772998	t	-1
17	1	14	33	3744615100	smart folder templates	23	7	smart_folders	804844994	t	-1
18	1	14	33	4218000263	smart folder downloads	24	7	smart_downloads	3878312324	t	-1
19	1	13	33	787359379	guest home	25	7	guest_home	2333806581	t	-1
20	1	13	33	2233110431	user homes	26	7	user_homes	2702798579	t	-1
21	1	13	33	328004795	shared	27	7	shared	276099713	t	-1
22	1	13	33	702905850	imap attachments	28	6	Imap Attachments	1001418059	t	-1
23	1	13	33	3935772771	imap home	29	6	Imap Home	2827151161	t	-1
24	1	12	4	-2270692378	fe905980-7b35-47ca-96f5-c97e7163d8d0	30	1	system	1509831379	t	-1
25	1	30	4	-2228262188	3a761823-1719-441c-b9ff-a7694e3364b0	31	1	people	3097839998	t	-1
26	1	31	4	-2733761501	74403fec-cacd-43c4-89de-0b4d3a9eb52a	32	6	admin	347996256	t	-1
27	1	31	4	-3380831729	c5fd4aa9-db82-4f8b-926e-a67243df8659	33	6	guest	805803811	t	-1
28	1	30	4	-625668100	3818b2e3-948a-4da3-9800-8b33cfc08ee0	34	1	workflow	3049303691	t	-1
29	1	12	4	-2876508190	ad200b26-2345-410e-a578-cd535b75208b	35	6	categoryRoot	2175667943	t	-1
30	1	35	48	-2204166874	16fa3a26-4274-43db-bcb1-546069dbdae8	36	6	generalclassifiable	1686288257	t	-1
31	1	36	49	2698881118	software document classification	37	6	Software Document Classification	3819543068	t	-1
32	1	37	49	28469387	software descriptions	38	6	Software Descriptions	1635852989	t	-1
33	1	38	49	2073851679	main software descriptions	39	6	Main Software Descriptions	1138654932	t	-1
34	1	39	49	2907738123	short system description	40	6	Short System Description	1810876073	t	-1
35	1	39	49	1606402406	requirement description	41	6	Requirement Description	189951905	t	-1
36	1	39	49	1896099312	architecture description	42	6	Architecture Description	3942499170	t	-1
37	1	39	49	2399881991	implementation description	43	6	Implementation Description	3190567739	t	-1
38	1	39	49	1353530587	configuration description	44	6	Configuration Description	3499778930	t	-1
39	1	38	49	4043393805	software description appendices	45	6	Software Description Appendices	284764992	t	-1
40	1	45	49	2484979098	terminology description	46	6	Terminology Description	3236981597	t	-1
41	1	45	49	665542653	internal message description	47	6	Internal Message Description	434134045	t	-1
42	1	45	49	3472799219	external message description	48	6	External Message Description	4038440467	t	-1
43	1	45	49	4056602909	record description	49	6	Record Description	608272631	t	-1
44	1	45	49	393869945	user interface description	50	6	User Interface Description	2979440541	t	-1
45	1	45	49	894410162	process description	51	6	Process Description	3957868962	t	-1
46	1	45	49	3995652705	initialization description	52	6	Initialization Description	3742345821	t	-1
47	1	37	49	3227434245	utilization documents	53	6	Utilization Documents	984460904	t	-1
48	1	53	49	2192566828	user's manual	54	6	User's Manual	3812762855	t	-1
49	1	53	49	3053746966	operator's manual	55	6	Operator's Manual	367883218	t	-1
50	1	53	49	2619173183	installation manual	56	6	Installation Manual	3280615374	t	-1
51	1	53	49	876354352	service manual	57	6	Service Manual	4042969452	t	-1
52	1	53	49	1856239369	user's help	58	6	User's Help	2355756505	t	-1
53	1	53	49	2623414449	operator's help	59	6	Operator's Help	2445831430	t	-1
54	1	53	49	2979080622	installations help	60	6	Installations Help	1119113389	t	-1
55	1	53	49	3175522142	service help	61	6	Service Help	1518602170	t	-1
56	1	37	49	2368576440	development plans	62	6	Development Plans	3903437134	t	-1
57	1	62	49	2270310850	responsibility plan	63	6	Responsibility Plan	2136720699	t	-1
58	1	62	49	864431939	work breakdown plan	64	6	Work Breakdown Plan	116106082	t	-1
59	1	62	49	1183845432	schedule plan	65	6	Schedule Plan	2162387195	t	-1
60	1	62	49	310338049	expense plan	66	6	Expense Plan	4122868453	t	-1
61	1	62	49	1449103693	phase plan	67	6	Phase Plan	3159407706	t	-1
62	1	62	49	1972689447	risk plan	68	6	Risk Plan	931208573	t	-1
63	1	62	49	2745239212	test plan	69	6	Test Plan	3786719734	t	-1
64	1	62	49	2401478941	acceptance plan	70	6	Acceptance Plan	2192958634	t	-1
65	1	62	49	3520848714	manual plan	71	6	Manual Plan	856811930	t	-1
66	1	62	49	3121370645	method plan	72	6	Method Plan	1489394885	t	-1
67	1	62	49	155996287	quality plan	73	6	Quality Plan	4002334875	t	-1
68	1	62	49	2453626510	documentation plan	74	6	Documentation Plan	1629104013	t	-1
69	1	62	49	3287744536	version control plan	75	6	Version Control Plan	2125207702	t	-1
70	1	37	49	4069423408	quality documents	76	6	Quality Documents	3560633953	t	-1
71	1	76	49	3202395658	change request	77	6	Change Request	2989971708	t	-1
72	1	76	49	875981477	analysis request	78	6	Analysis Request	1866648671	t	-1
73	1	76	49	1406577714	information request	79	6	Information Request	3293630057	t	-1
74	1	76	49	610673743	reader's report	80	6	Reader's Report	2389623792	t	-1
75	1	76	49	1417252998	review report	81	6	Review Report	898915917	t	-1
76	1	76	49	3972239595	inspection report	82	6	Inspection Report	1328191535	t	-1
77	1	76	49	1238814824	test report	83	6	Test Report	209875120	t	-1
78	1	76	49	1438127416	review call	84	6	Review Call	3077709800	t	-1
79	1	76	49	2636004156	inspection call	85	6	Inspection Call	2424862347	t	-1
80	1	76	49	2994041583	test call	86	6	Test Call	4032869813	t	-1
81	1	37	49	458235642	administrative documents	87	6	Administrative Documents	2227502364	t	-1
82	1	87	49	3029136191	preliminary contract	88	6	Preliminary Contract	1218641185	t	-1
83	1	87	49	330113795	development contract	89	6	Development Contract	4018351389	t	-1
84	1	87	49	1310544536	extended contract	90	6	Extended Contract	321797436	t	-1
85	1	87	49	3639418992	maintenance contract	91	6	Maintenance Contract	616771182	t	-1
86	1	87	49	2494063934	contract review minutes	92	6	Contract Review Minutes	1140852074	t	-1
87	1	87	49	611590337	project meeting minutes	93	6	Project Meeting Minutes	2977760979	t	-1
88	1	36	49	2698072953	languages	94	6	Languages	1123433245	t	-1
89	1	94	49	746783232	english	95	6	English	2165796422	t	-1
90	1	95	49	25551090	british english	96	6	British English	1671183335	t	-1
91	1	95	49	2309252311	american english	97	6	American English	3536896557	t	-1
92	1	95	49	3115211888	australian english	98	6	Australian English	621065169	t	-1
93	1	95	49	1896104131	canadian english	99	6	Canadian English	712042041	t	-1
94	1	95	49	3858082522	indian english	100	6	Indian English	3911343148	t	-1
95	1	94	49	2943733342	french	101	6	French	1553059380	t	-1
96	1	101	49	810812125	french french	102	6	French French	1371130902	t	-1
97	1	101	49	1076629412	canadian french	103	6	Canadian French	3928287259	t	-1
98	1	94	49	2721333409	german	104	6	German	1372602571	t	-1
99	1	104	49	476060318	german german	105	6	German German	2106446933	t	-1
100	1	104	49	3139883389	austrian german	106	6	Austrian German	288241346	t	-1
101	1	104	49	3847244892	swiss german	107	6	Swiss German	2769059504	t	-1
102	1	94	49	874050868	spanish	108	6	Spanish	2576128370	t	-1
103	1	108	49	874050868	spanish	109	6	Spanish	2576128370	t	-1
104	1	108	49	119644513	mexican spanish	110	6	Mexican Spanish	1698200180	t	-1
105	1	108	49	2436862947	american spanish	111	6	American Spanish	3393926425	t	-1
106	1	36	49	2724690419	regions	112	6	Regions	267589045	t	-1
107	1	112	49	2521632419	africa	113	6	AFRICA	2466106489	t	-1
108	1	113	49	3544705375	eastern africa	114	6	Eastern Africa	394339075	t	-1
109	1	114	49	1928293556	burundi	115	6	Burundi	3749380338	t	-1
110	1	114	49	2691402736	comoros	116	6	Comoros	234874806	t	-1
111	1	114	49	2618175708	djibouti	117	6	Djibouti	52183061	t	-1
112	1	114	49	121454611	eritrea	118	6	Eritrea	2863213653	t	-1
113	1	114	49	750064544	ethiopia	119	6	Ethiopia	3014091625	t	-1
114	1	114	49	2721694507	kenya	120	6	Kenya	4282966329	t	-1
115	1	114	49	3049179811	madagascar	121	6	Madagascar	4286793866	t	-1
116	1	114	49	3440327867	malawi	122	6	Malawi	1055603921	t	-1
117	1	114	49	65273427	mauritius	123	6	Mauritius	3787757111	t	-1
118	1	114	49	2131622377	mozambique	124	6	Mozambique	892369856	t	-1
119	1	114	49	1526768770	reunion	125	6	Reunion	4136945860	t	-1
120	1	114	49	1177401495	rwanda	126	6	Rwanda	3049896189	t	-1
121	1	114	49	3046112852	seychelles	127	6	Seychelles	4289887357	t	-1
122	1	114	49	2486253753	somalia	128	6	Somalia	967136511	t	-1
123	1	114	49	1002971053	uganda	129	6	Uganda	3358334919	t	-1
124	1	114	49	1120322014	united republic of tanzania	130	6	United Republic of Tanzania	2518905732	t	-1
125	1	114	49	3015467081	zambia	131	6	Zambia	1079533603	t	-1
126	1	114	49	2221643360	zimbabwe	132	6	Zimbabwe	460973737	t	-1
127	1	113	49	20947320	middle africa	133	6	Middle Africa	1624403891	t	-1
128	1	133	49	1122992818	angola	134	6	Angola	2970321624	t	-1
129	1	133	49	971834596	cameroon	135	6	Cameroon	2801759277	t	-1
130	1	133	49	725561226	central african republic	136	6	Central African Republic	3625146340	t	-1
131	1	133	49	2016076494	chad	137	6	Chad	1628697140	t	-1
132	1	133	49	3456989782	congo	138	6	Congo	2474399812	t	-1
133	1	133	49	1584510254	democratic republic of the congo	139	6	Democratic Republic of the Congo	2223897072	t	-1
134	1	133	49	2985204337	equatorial guinea	140	6	Equatorial Guinea	302486197	t	-1
135	1	133	49	1838606431	gabon	141	6	Gabon	820496973	t	-1
136	1	133	49	3242386644	sao tome and principe	142	6	Sao Tome and Principe	1855268278	t	-1
137	1	113	49	1911316965	northern africa	143	6	Northern Africa	3689186906	t	-1
138	1	143	49	831440508	algeria	144	6	Algeria	2618993210	t	-1
139	1	143	49	309747606	egypt	145	6	Egypt	1325890948	t	-1
140	1	143	49	6336724	libyan arab jamahiriya	146	6	Libyan Arab Jamahiriya	3143393468	t	-1
141	1	143	49	3082038010	morocco	147	6	Morocco	438322876	t	-1
142	1	143	49	3179497705	sudan	148	6	Sudan	3773983483	t	-1
143	1	143	49	1723175352	tunisia	149	6	Tunisia	3408002558	t	-1
144	1	143	49	175292891	western sahara	150	6	Western Sahara	3467905927	t	-1
145	1	113	49	3035859710	southern africa	151	6	Southern Africa	519793985	t	-1
146	1	151	49	3672489918	botswana	152	6	Botswana	1173868407	t	-1
147	1	151	49	2007320486	lesotho	153	6	Lesotho	3660655584	t	-1
148	1	151	49	1729667362	namibia	154	6	Namibia	3398225252	t	-1
149	1	151	49	3174958594	south africa	155	6	South Africa	4251071726	t	-1
150	1	151	49	330040633	swaziland	156	6	Swaziland	4052446557	t	-1
151	1	113	49	2485287688	western africa	157	6	Western Africa	1357164884	t	-1
152	1	157	49	1968483994	benin	158	6	Benin	673549448	t	-1
153	1	157	49	2218827890	burkina faso	159	6	Burkina Faso	1669478550	t	-1
154	1	157	49	4050001938	cape verde	160	6	Cape Verde	2056949055	t	-1
155	1	157	49	504304762	cote d'ivoire	161	6	Cote d'Ivoire	2145573553	t	-1
156	1	157	49	217346316	gambia	162	6	Gambia	4279267686	t	-1
157	1	157	49	2608608604	ghana	163	6	Ghana	3322746702	t	-1
158	1	157	49	3008979313	guinea	164	6	Guinea	1086152987	t	-1
159	1	157	49	585069007	guinea-bissau	165	6	Guinea-Bissau	1127399172	t	-1
160	1	157	49	3363092863	liberia	166	6	Liberia	1709233465	t	-1
161	1	157	49	1547414658	mali	167	6	Mali	1157807224	t	-1
162	1	157	49	2134688598	mauritania	168	6	Mauritania	889274751	t	-1
163	1	157	49	1293407471	niger	169	6	Niger	275183357	t	-1
164	1	157	49	2534090534	nigeria	170	6	Nigeria	983518048	t	-1
165	1	157	49	2902273140	saint helena	171	6	Saint Helena	3969982104	t	-1
166	1	157	49	1196814092	senegal	172	6	Senegal	3938550602	t	-1
167	1	157	49	4211871653	sierra leone	173	6	Sierra Leone	2101155707	t	-1
168	1	157	49	1898177891	togo	174	6	Togo	1746597273	t	-1
169	1	112	49	2061703251	asia	175	6	ASIA	4118628899	t	-1
170	1	175	49	2704003441	eastern asia	176	6	Eastern Asia	1189693845	t	-1
171	1	176	49	1626325540	china	177	6	China	1033822262	t	-1
172	1	176	49	3890259192	democratic people's republic of korea	178	6	Democratic People's Republic of Korea	1741765450	t	-1
173	1	176	49	1876027915	hong kong sar	179	6	Hong Kong SAR	1715536170	t	-1
174	1	176	49	338130558	japan	180	6	Japan	1230394476	t	-1
175	1	176	49	2366445845	macao, china	181	6	Macao, China	188481995	t	-1
176	1	176	49	3873228617	mongolia	182	6	Mongolia	2043590528	t	-1
177	1	176	49	2622242312	republic of korea	183	6	Republic of Korea	4190641406	t	-1
178	1	175	49	2844876198	south-central asia	184	6	South-central Asia	1521755301	t	-1
179	1	184	49	1789607488	afghanistan	185	6	Afghanistan	676567982	t	-1
180	1	184	49	2427965986	bangladesh	186	6	Bangladesh	3666497547	t	-1
181	1	184	49	2219423205	bhutan	187	6	Bhutan	2007872911	t	-1
182	1	184	49	1219330253	india	188	6	India	366781151	t	-1
183	1	184	49	1077224957	iran (islamic republic of)	189	6	Iran (Islamic Republic of)	4114831845	t	-1
184	1	184	49	2787889741	kazakhstan	190	6	Kazakhstan	3960885348	t	-1
185	1	184	49	1429765081	kyrgyzstan	191	6	Kyrgyzstan	520485360	t	-1
186	1	184	49	3613204721	maldives	192	6	Maldives	1213157432	t	-1
187	1	184	49	2160797381	nepal	193	6	Nepal	3719955671	t	-1
188	1	184	49	3996924490	pakistan	194	6	Pakistan	1898859139	t	-1
189	1	184	49	4185751281	sri lanka	195	6	Sri Lanka	3667605905	t	-1
190	1	184	49	45768404	tajikistan	196	6	Tajikistan	1216863485	t	-1
191	1	184	49	927251696	turkmenistan	197	6	Turkmenistan	1890880298	t	-1
192	1	184	49	3618150535	uzbekistan	198	6	Uzbekistan	2643794606	t	-1
193	1	175	49	1235590902	south-eastern asia	199	6	South-eastern Asia	3129010165	t	-1
194	1	199	49	428996190	brunei darussalam	200	6	Brunei Darussalam	4069128316	t	-1
195	1	199	49	3809346112	cambodia	201	6	Cambodia	2082239113	t	-1
196	1	199	49	2805259669	indonesia	202	6	Indonesia	1158919665	t	-1
197	1	199	49	711454169	lao people's democratic republic	203	6	Lao People's Democratic Republic	1340021817	t	-1
198	1	199	49	375588017	malaysia	204	6	Malaysia	2305913976	t	-1
199	1	199	49	2791924250	myanmar	205	6	Myanmar	201133660	t	-1
200	1	199	49	422453359	philippines	206	6	Philippines	1540785537	t	-1
201	1	199	49	2194449579	singapore	207	6	Singapore	1626066127	t	-1
202	1	199	49	732922246	thailand	208	6	Thailand	3032346959	t	-1
203	1	199	49	480960120	timor-leste	209	6	Timor-Leste	2677232786	t	-1
204	1	199	49	3905329337	viet nam	210	6	Viet Nam	1335471760	t	-1
205	1	175	49	4057059728	western asia	211	6	Western Asia	370362740	t	-1
206	1	211	49	1474225954	armenia	212	6	Armenia	4199189348	t	-1
207	1	211	49	1865560516	azerbaijan	213	6	Azerbaijan	621786093	t	-1
208	1	211	49	2109290352	bahrain	214	6	Bahrain	3492633398	t	-1
209	1	211	49	1819209598	cyprus	215	6	Cyprus	2676682516	t	-1
210	1	211	49	2449663986	georgia	216	6	Georgia	1066830772	t	-1
211	1	211	49	1811661031	iraq	217	6	Iraq	1925369885	t	-1
212	1	211	49	4108721855	israel	218	6	Israel	117579477	t	-1
213	1	211	49	1540059217	jordan	219	6	Jordan	2821681211	t	-1
214	1	211	49	3194580348	kuwait	220	6	Kuwait	1301114134	t	-1
215	1	211	49	3809283664	lebanon	221	6	Lebanon	1318674966	t	-1
216	1	211	49	1717312488	occupied palestinian territory	222	6	Occupied Palestinian Territory	2426687139	t	-1
217	1	211	49	3571611267	oman	223	6	Oman	3453707897	t	-1
218	1	211	49	270476414	qatar	224	6	Qatar	1299056236	t	-1
219	1	211	49	2924782003	saudi arabia	225	6	Saudi Arabia	3993539423	t	-1
220	1	211	49	2197609827	syrian arab republic	226	6	Syrian Arab Republic	3450640520	t	-1
221	1	211	49	2762251111	turkey	227	6	Turkey	1463851789	t	-1
222	1	211	49	1491873575	united arab emirates	228	6	United Arab Emirates	398224076	t	-1
223	1	211	49	3432511836	yemen	229	6	Yemen	2447825742	t	-1
224	1	112	49	1217616094	europe	230	6	EUROPE	1277401604	t	-1
225	1	230	49	228179746	eastern europe	231	6	Eastern Europe	3378476414	t	-1
226	1	231	49	3390375802	belarus	232	6	Belarus	1736534844	t	-1
227	1	231	49	1207782951	bulgaria	233	6	Bulgaria	3639557870	t	-1
228	1	231	49	623353472	czech republic	234	6	Czech Republic	523973564	t	-1
229	1	231	49	2213295331	hungary	235	6	Hungary	779638949	t	-1
230	1	231	49	684082746	poland	236	6	Poland	3676456528	t	-1
231	1	231	49	93569048	republic of moldova	237	6	Republic of Moldova	2450891331	t	-1
232	1	231	49	834856803	romania	238	6	Romania	2622917413	t	-1
233	1	231	49	579704207	russian federation	239	6	Russian Federation	1053245538	t	-1
234	1	231	49	3444175596	slovakia	240	6	Slovakia	1381728805	t	-1
235	1	231	49	3223838707	ukraine	241	6	Ukraine	1840493493	t	-1
236	1	230	49	2939303832	northern europe	242	6	Northern Europe	87740455	t	-1
237	1	242	49	2571859775	channel islands	243	6	Channel Islands	4216499242	t	-1
238	1	242	49	3684617504	denmark	244	6	Denmark	1980408166	t	-1
239	1	242	49	1786774787	estonia	245	6	Estonia	3340003653	t	-1
240	1	242	49	1761911701	faeroe islands	246	6	Faeroe Islands	1708348771	t	-1
241	1	242	49	4122426331	finland	247	6	Finland	1478711197	t	-1
242	1	242	49	3585366341	iceland	248	6	Iceland	2015376643	t	-1
243	1	242	49	490637435	ireland	249	6	Ireland	2963989565	t	-1
244	1	242	49	1770003631	isle of man	250	6	Isle of Man	322305953	t	-1
245	1	242	49	1343066742	latvia	251	6	Latvia	2749993500	t	-1
246	1	242	49	286342226	lithuania	252	6	Lithuania	4080423990	t	-1
247	1	242	49	1575594665	norway	253	6	Norway	2920131267	t	-1
248	1	242	49	2250265955	sweden	254	6	Sweden	1975801097	t	-1
249	1	242	49	3344183625	united kingdom	255	6	United Kingdom	3414411199	t	-1
250	1	230	49	1781390467	southern europe	256	6	Southern Europe	3223665468	t	-1
251	1	256	49	1664123983	albania	257	6	Albania	3466913801	t	-1
252	1	256	49	4251792985	andorra	258	6	Andorra	1358518815	t	-1
253	1	256	49	3285898834	bosnia and herzegovina	259	6	Bosnia and Herzegovina	971158691	t	-1
254	1	256	49	609359002	croatia	260	6	Croatia	2311485660	t	-1
255	1	256	49	266022505	gibraltar	261	6	Gibraltar	3992733197	t	-1
256	1	256	49	382570151	greece	262	6	Greece	3844705997	t	-1
257	1	256	49	1139894006	holy see	263	6	Holy See	3836629215	t	-1
258	1	256	49	534354382	italy	264	6	Italy	1118354396	t	-1
259	1	256	49	338758655	malta	265	6	Malta	1228941805	t	-1
260	1	256	49	3618595502	portugal	266	6	Portugal	1220350567	t	-1
261	1	256	49	256616510	san marino	267	6	San Marino	1121595169	t	-1
262	1	256	49	1155573584	slovenia	268	6	Slovenia	3690125209	t	-1
263	1	256	49	1146089528	spain	269	6	Spain	423547434	t	-1
264	1	256	49	2437011711	the former yugoslav republic of macedonia	270	6	The Former Yugoslav Republic of Macedonia	1072209099	t	-1
265	1	256	49	2016032151	yugoslavia	271	6	Yugoslavia	840415166	t	-1
266	1	230	49	1258040693	western europe	272	6	Western Europe	2386224937	t	-1
267	1	272	49	1754436759	austria	273	6	Austria	3305568465	t	-1
268	1	272	49	84027732	belgium	274	6	Belgium	2828420370	t	-1
269	1	272	49	1587946932	france	275	6	France	2906793438	t	-1
270	1	272	49	1520992555	germany	276	6	Germany	4147965293	t	-1
271	1	272	49	457342887	liechtenstein	277	6	Liechtenstein	2097394778	t	-1
272	1	272	49	2623961533	luxembourg	278	6	Luxembourg	3596352404	t	-1
273	1	272	49	536557617	monaco	279	6	Monaco	3961469019	t	-1
274	1	272	49	977422236	netherlands	280	6	Netherlands	2025513586	t	-1
275	1	272	49	3665763213	switzerland	281	6	Switzerland	2559032931	t	-1
276	1	112	49	473456913	latin america	282	6	LATIN AMERICA	373129642	t	-1
277	1	282	49	562533037	caribbean	283	6	Caribbean	3282107081	t	-1
278	1	283	49	1916266241	anguilla	284	6	Anguilla	3978663880	t	-1
279	1	283	49	361675714	antigua and barbuda	285	6	Antigua and Barbuda	2181618073	t	-1
280	1	283	49	2617389991	aruba	286	6	Aruba	3245543861	t	-1
281	1	283	49	2647707828	bahamas	287	6	Bahamas	809811186	t	-1
282	1	283	49	2551714669	barbados	288	6	Barbados	118121380	t	-1
283	1	283	49	145415630	british virgin islands	289	6	British Virgin Islands	1993830828	t	-1
284	1	283	49	1160246246	cayman islands	290	6	Cayman Islands	1240466704	t	-1
285	1	283	49	932410785	cuba	291	6	Cuba	782919003	t	-1
286	1	283	49	2226085289	dominica	292	6	Dominica	465382752	t	-1
287	1	283	49	3401324796	dominican republic	293	6	Dominican Republic	1625140375	t	-1
288	1	283	49	1837967272	grenada	294	6	Grenada	3222883310	t	-1
289	1	283	49	777952348	guadeloupe	295	6	Guadeloupe	1684217461	t	-1
290	1	283	49	3569471062	haiti	296	6	Haiti	2310073412	t	-1
291	1	283	49	2690230965	jamaica	297	6	Jamaica	231589619	t	-1
292	1	283	49	263005616	martinique	298	6	Martinique	1167107993	t	-1
293	1	283	49	4171649994	montserrat	299	6	Montserrat	2996556259	t	-1
294	1	283	49	1066837157	netherlands antilles	300	6	Netherlands Antilles	3283659451	t	-1
295	1	283	49	1223509347	puerto rico	301	6	Puerto Rico	2854703027	t	-1
296	1	283	49	693817849	saint kitts and nevis	302	6	Saint Kitts and Nevis	408703405	t	-1
297	1	283	49	3698368659	saint lucia	303	6	Saint Lucia	1598630521	t	-1
298	1	283	49	1528299237	saint vincent and grenadines	304	6	Saint Vincent and Grenadines	42374613	t	-1
299	1	283	49	3335563666	trinidad and tobago	305	6	Trinidad and Tobago	2571630435	t	-1
300	1	283	49	2563879240	turks and caicos islands	306	6	Turks and Caicos Islands	2272104777	t	-1
301	1	283	49	2958894253	united states virgin islands	307	6	United States Virgin Islands	3139418642	t	-1
302	1	282	49	3201394492	central america	308	6	Central America	3704142889	t	-1
303	1	308	49	2077379440	belize	309	6	Belize	2285259546	t	-1
304	1	308	49	2420439506	costa rica	310	6	Costa Rica	2051790021	t	-1
305	1	308	49	2512286277	el salvador	311	6	El Salvador	774944253	t	-1
306	1	308	49	2780785696	guatemala	312	6	Guatemala	1201144900	t	-1
307	1	308	49	4225790268	honduras	313	6	Honduras	1693581813	t	-1
308	1	308	49	774535531	mexico	314	6	Mexico	3721296129	t	-1
309	1	308	49	3776404894	nicaragua	315	6	Nicaragua	53491194	t	-1
310	1	308	49	1723373468	panama	316	6	Panama	2505873398	t	-1
311	1	282	49	112881138	south america	317	6	South America	2940641171	t	-1
312	1	317	49	299819657	argentina	318	6	Argentina	4093217517	t	-1
313	1	317	49	3170732090	bolivia	319	6	Bolivia	292152444	t	-1
314	1	317	49	1563114528	brazil	320	6	Brazil	2932816970	t	-1
315	1	317	49	1437885631	chile	321	6	Chile	147146413	t	-1
316	1	317	49	779737648	colombia	322	6	Colombia	2976623353	t	-1
317	1	317	49	1805269653	ecuador	323	6	Ecuador	3322828499	t	-1
318	1	317	49	311414191	falkland islands (malvinas)	324	6	Falkland Islands (Malvinas)	4200036155	t	-1
319	1	317	49	3301978884	french guiana	325	6	French Guiana	2772303311	t	-1
320	1	317	49	199796760	guyana	326	6	Guyana	4161579122	t	-1
321	1	317	49	2818510304	paraguay	327	6	Paraguay	955088169	t	-1
322	1	317	49	956426380	peru	328	6	Peru	540604534	t	-1
323	1	317	49	1409461882	suriname	329	6	Suriname	3406880435	t	-1
324	1	317	49	4111472120	uruguay	330	6	Uruguay	1485076926	t	-1
325	1	317	49	745110801	venezuela	331	6	Venezuela	3461223797	t	-1
326	1	112	49	941148238	northern america	332	6	NORTHERN AMERICA	910848477	t	-1
327	1	332	49	4198290940	bermuda	333	6	Bermuda	1470675386	t	-1
328	1	332	49	842554592	canada	334	6	Canada	3252444298	t	-1
329	1	332	49	512708717	greenland	335	6	Greenland	4238882825	t	-1
330	1	332	49	74993950	saint pierre and miquelon	336	6	Saint Pierre and Miquelon	3709965602	t	-1
331	1	332	49	895026901	united states of america	337	6	United States of America	3374476534	t	-1
332	1	112	49	1887015383	oceania	338	6	OCEANIA	756365847	t	-1
333	1	338	49	834064608	australia and new zealand	339	6	Australia and New Zealand	2117908181	t	-1
334	1	339	49	3411872625	australia	340	6	Australia	695886613	t	-1
335	1	339	49	241715737	new zealand	341	6	New Zealand	2200819307	t	-1
336	1	339	49	254052704	norfolk island	342	6	Norfolk Island	3420603196	t	-1
337	1	338	49	2924986328	melanesia	343	6	Melanesia	1282463676	t	-1
338	1	343	49	3547585981	fiji	344	6	Fiji	3393899847	t	-1
339	1	343	49	2103458618	new caledonia	345	6	New Caledonia	2580574820	t	-1
340	1	343	49	44967114	papua new guinea	346	6	Papua New Guinea	3734420810	t	-1
341	1	343	49	3294343407	solomon islands	347	6	Solomon Islands	2789370874	t	-1
342	1	343	49	2310465348	vanuatu	348	6	Vanuatu	606243586	t	-1
343	1	338	49	430281384	micronesia	349	6	Micronesia	1402474625	t	-1
344	1	349	49	3428697731	federated states of micronesia	350	6	Federated States of Micronesia	2050844520	t	-1
345	1	349	49	2590702878	guam	351	6	Guam	2203315684	t	-1
346	1	349	49	3029445841	johnston island	352	6	Johnston Island	513362798	t	-1
347	1	349	49	2202151125	kiribati	353	6	Kiribati	475027484	t	-1
348	1	349	49	3667971656	marshall islands	354	6	Marshall Islands	2178181298	t	-1
349	1	349	49	216439339	nauru	355	6	Nauru	1368897593	t	-1
350	1	349	49	1941069965	northern mariana islands	356	6	Northern Mariana Islands	699336394	t	-1
351	1	349	49	2704173733	palau	357	6	Palau	4234102967	t	-1
352	1	338	49	2375911104	polynesia	358	6	Polynesia	1874521764	t	-1
353	1	358	49	2990942542	american samoa	359	6	American Samoa	2968373536	t	-1
354	1	358	49	646786247	cook islands	360	6	Cook Islands	2931827329	t	-1
355	1	358	49	1170779034	french polynesia	361	6	French Polynesia	1408284255	t	-1
356	1	358	49	3526080487	niue	362	6	Niue	3406997277	t	-1
357	1	358	49	3940692583	pitcairn	363	6	Pitcairn	1978679982	t	-1
358	1	358	49	1662354353	samoa	364	6	Samoa	1046782371	t	-1
359	1	358	49	2209823413	tokelau	365	6	Tokelau	774067955	t	-1
360	1	358	49	4218756291	tonga	366	6	Tonga	2785296081	t	-1
361	1	358	49	4263870084	tuvalu	367	6	Tuvalu	230784750	t	-1
362	1	358	49	2381817393	wallis and futuna islands	368	6	Wallis and Futuna Islands	2307208971	t	-1
363	1	36	49	1874629670	tags	369	6	Tags	1988461788	t	-1
364	1	12	4	-1283093197	2217cf6b-f74e-4340-ae63-1481fa4b70f8	370	6	multilingualRoot	2349380271	t	-1
365	1	15	33	3705542279	software engineering project	371	6	Software Engineering Project	2880742188	t	-1
366	1	371	33	1943382331	documentation	372	6	Documentation	362046150	t	-1
367	1	372	33	3962234048	drafts	373	6	Drafts	533652650	t	-1
368	1	372	33	3191428362	pending approval	374	6	Pending Approval	3548817466	t	-1
369	1	372	33	1748787223	published	375	6	Published	2317027443	t	-1
370	1	372	33	429021047	samples	376	6	Samples	3020307249	t	-1
371	1	376	33	2405749559	system-overview.html	377	6	system-overview.html	2428563316	t	-1
372	1	371	33	2339466083	discussions	378	6	Discussions	3381251725	t	-1
373	1	371	33	548006827	ui design	379	6	UI Design	1012196527	t	-1
374	1	371	33	1922263837	presentations	380	6	Presentations	349348064	t	-1
375	1	371	33	1750475286	quality assurance	381	6	Quality Assurance	1323478343	t	-1
376	1	16	33	3600071903	doc_info.ftl	382	6	doc_info.ftl	2304069885	t	-1
377	1	16	33	893522989	localizable.ftl	383	6	localizable.ftl	270780474	t	-1
378	1	16	33	1306378654	my_docs.ftl	384	6	my_docs.ftl	2310663079	t	-1
379	1	16	33	3127353310	my_spaces.ftl	385	6	my_spaces.ftl	1868046294	t	-1
380	1	16	33	2490960680	my_summary.ftl	386	6	my_summary.ftl	2591538330	t	-1
381	1	16	33	468580800	translatable.ftl	387	6	translatable.ftl	2551913947	t	-1
382	1	16	33	955890133	recent_docs.ftl	388	6	recent_docs.ftl	496526786	t	-1
383	1	16	33	3917212590	general_example.ftl	389	6	general_example.ftl	2546255485	t	-1
384	1	16	33	1772051304	my_docs_inline.ftl	390	6	my_docs_inline.ftl	1741567333	t	-1
385	1	16	33	647826368	show_audit.ftl	391	6	show_audit.ftl	680770674	t	-1
386	1	16	33	2183277388	readme.ftl	392	6	readme.ftl	2269293237	t	-1
387	1	17	33	3898432343	invite email templates	393	7	invite_email_templates	2118996995	t	-1
388	1	393	33	3989214391	invite_user_email.ftl	394	6	invite_user_email.ftl	34349217	t	-1
389	1	17	33	1907250866	notify email templates	395	7	notify_email_templates	3888011750	t	-1
390	1	395	33	3142229900	notify_user_email.ftl.sample	396	6	notify_user_email.ftl.sample	329696783	t	-1
391	1	17	33	3052515301	activities	397	6	activities	2962304540	t	-1
392	1	397	33	4067496925	activities-email.ftl	398	6	activities-email.ftl	3990171550	t	-1
393	1	397	33	2343757601	activities-email_fr.ftl	399	6	activities-email_fr.ftl	1529268905	t	-1
394	1	397	33	809942079	activities-email_es.ftl	400	6	activities-email_es.ftl	3771896247	t	-1
395	1	397	33	347737528	activities-email_de.ftl	401	6	activities-email_de.ftl	3291357232	t	-1
396	1	397	33	4121206868	activities-email_it.ftl	402	6	activities-email_it.ftl	623939036	t	-1
397	1	397	33	3677407752	activities-email_ja.ftl	403	6	activities-email_ja.ftl	195356544	t	-1
398	1	397	33	3090238639	activities-email_nl.ftl	404	6	activities-email_nl.ftl	1755668775	t	-1
399	1	17	33	2895700968	following email templates	405	7	following	3179229198	t	-1
400	1	405	33	496994026	following-email.html.ftl	406	6	following-email.html.ftl	4264303061	t	-1
401	1	405	33	2272498959	following-email_de.html.ftl	407	6	following-email_de.html.ftl	217400226	t	-1
402	1	405	33	1817033568	following-email_es.html.ftl	408	6	following-email_es.html.ftl	3888868813	t	-1
403	1	405	33	443397727	following-email_fr.html.ftl	409	6	following-email_fr.html.ftl	2448122098	t	-1
404	1	405	33	2223715038	following-email_it.html.ftl	410	6	following-email_it.html.ftl	252568691	t	-1
405	1	405	33	3706592883	following-email_ja.html.ftl	411	6	following-email_ja.html.ftl	1466484958	t	-1
406	1	405	33	2580145729	following-email_nl.html.ftl	412	6	following-email_nl.html.ftl	307179756	t	-1
407	1	17	33	3783950129	workflow notification	413	6	workflownotification	2825065354	t	-1
408	1	413	33	999600869	wf-email.html.ftl	414	6	invite-email.html.ftl	868286096	t	-1
409	1	413	33	2698508395	wf-email_de.html.ftl	415	6	invite-email_de.html.ftl	3257386812	t	-1
410	1	413	33	1273615876	wf-email_es.html.ftl	416	6	invite-email_es.html.ftl	689563987	t	-1
411	1	413	33	1036639035	wf-email_fr.html.ftl	417	6	invite-email_fr.html.ftl	1597629548	t	-1
412	1	413	33	2737790906	wf-email_it.html.ftl	418	6	invite-email_it.html.ftl	3252642029	t	-1
413	1	413	33	4215960343	wf-email_ja.html.ftl	419	6	invite-email_ja.html.ftl	2579123264	t	-1
414	1	413	33	3194850085	wf-email_nl.html.ftl	420	6	wf-email_nl.html.ftl	2714351462	t	-1
415	1	19	33	607514309	rss_2.0_recent_docs.ftl	421	6	RSS_2.0_recent_docs.ftl	3910367438	t	-1
416	1	21	33	2543791401	backup.js.sample	422	6	backup.js.sample	342477106	t	-1
417	1	21	33	1955080497	example test script.js.sample	423	6	example test script.js.sample	9508850	t	-1
418	1	21	33	2206926736	backup and log.js.sample	424	6	backup and log.js.sample	1614321839	t	-1
419	1	21	33	3426364731	append copyright.js.sample	425	6	append copyright.js.sample	4099172961	t	-1
420	1	21	33	1369286586	alfresco docs.js.sample	426	6	alfresco docs.js.sample	2164886066	t	-1
421	1	21	33	1270332241	test return value.js.sample	427	6	test return value.js.sample	3224464892	t	-1
422	1	14	33	1086438044	web scripts	428	6	webscripts	909597699	t	-1
423	1	428	33	271231772	readme.html	429	6	readme.html	3561914661	t	-1
424	1	428	33	2413130038	readme_ja.html	430	6	readme_ja.html	2178664068	t	-1
425	1	428	33	1148930173	readme_de.html	431	6	readme_de.html	1249247183	t	-1
426	1	428	33	3442961271	readme_fr.html	432	6	readme_fr.html	3275349189	t	-1
427	1	428	33	1914026624	org	433	6	org	528381942	t	-1
428	1	433	33	2706936736	alfresco	434	6	alfresco	3342631231	t	-1
429	1	434	33	4044060355	sample	435	6	sample	88306591	t	-1
430	1	435	33	3859521624	blogsearch.get.js	436	6	blogsearch.get.js	1827512144	t	-1
431	1	435	33	1484475657	blogsearch.get.atom.ftl	437	6	blogsearch.get.atom.ftl	2297389185	t	-1
432	1	435	33	2544799732	blogsearch.get.desc.xml	438	6	blogsearch.get.desc.xml	1195025020	t	-1
433	1	435	33	933027481	blogsearch.get.html.ftl	439	6	blogsearch.get.html.ftl	3876123409	t	-1
434	1	435	33	3721553185	blogsearch.get.html.400.ftl	440	6	blogsearch.get.html.400.ftl	1448391564	t	-1
435	1	435	33	1408605134	blogsearch.get.atom.400.ftl	441	6	blogsearch.get.atom.400.ftl	3631435107	t	-1
436	1	435	33	1711303757	categorysearch.get.js	442	6	categorysearch.get.js	2311772251	t	-1
437	1	435	33	296830842	categorysearch.get.atom.ftl	443	6	categorysearch.get.atom.ftl	2587333079	t	-1
438	1	435	33	3731129735	categorysearch.get.desc.xml	444	6	categorysearch.get.desc.xml	1440895786	t	-1
439	1	435	33	2119619818	categorysearch.get.html.ftl	445	6	categorysearch.get.html.ftl	4124049991	t	-1
440	1	435	33	1650102197	categorysearch.get.html.404.ftl	446	6	categorysearch.get.html.404.ftl	1139565194	t	-1
441	1	435	33	3967643994	categorysearch.get.atom.404.ftl	447	6	categorysearch.get.atom.404.ftl	3452673125	t	-1
442	1	435	33	3671472159	folder.get.js	448	6	folder.get.js	266975255	t	-1
443	1	435	33	1377789628	folder.get.atom.ftl	449	6	folder.get.atom.ftl	748702575	t	-1
444	1	435	33	2647303233	folder.get.desc.xml	450	6	folder.get.desc.xml	3816130962	t	-1
445	1	435	33	1039725868	folder.get.html.ftl	451	6	folder.get.html.ftl	1128782079	t	-1
446	1	14	33	395929441	web scripts extensions	452	6	extensionwebscripts	1135644710	t	-1
447	1	452	33	271231772	readme.html	453	6	readme.html	3561914661	t	-1
448	1	14	33	3839242249	models	454	7	models	3878565427	t	-1
449	1	454	60	-2797309060	228f32db-36e6-4658-8afa-6f2084137a18	455	8	ruleFolder	864502120	t	-1
450	1	455	33	791594146	ceca5a11-5c57-11dc-ad6c-5136d620963c	456	8	rulescc915a00-5c57-11dc-ad6c-5136d620963c	3752486723	t	-1
451	1	456	67	-3416815938	9902bc23-e857-446f-9f8a-e32f3ac6bbad	457	8	action	2726102540	t	-1
452	1	457	73	-3675513922	9c255bc5-4592-4c34-a0c4-343e46d88b67	458	9	conditions	3127092715	t	-1
453	1	458	76	-605825447	cdb88a23-78ef-4afe-918c-a096c9fccc88	459	9	parameters	1217848508	t	-1
454	1	457	80	-875406476	16484884-c344-4e84-8722-155c10e73cf6	460	9	actions	3055149561	t	-1
455	1	460	76	-3881081523	91196a5b-15c8-4304-b6c2-38b2aec37931	461	9	parameters	1217848508	t	-1
456	1	14	33	3674349206	messages	462	7	messages	399009314	t	-1
457	1	14	33	663197873	web client extension	463	7	webclient_extension	3725604994	t	-1
458	1	14	33	2476626106	workflow definitions	464	7	workflow_defs	3566462828	t	-1
459	1	464	60	-950207698	3d673c75-5e5f-47ed-a9d5-dc65dc319854	465	8	ruleFolder	864502120	t	-1
460	1	465	33	269678609	1e40c8cc-607e-11dc-af48-8b100325f217	466	8	rules1e40539b-607e-11dc-af48-8b100325f217	1892892178	t	-1
461	1	466	67	-2788082132	5d244871-a210-426c-bf2d-80603a42dbac	467	8	action	2726102540	t	-1
462	1	467	73	-2161279133	36b1b30e-ec50-4344-943e-6f6a73b3208a	468	9	conditions	3127092715	t	-1
463	1	468	76	-63718615	c41e4834-0038-40cc-b9ba-37da8b22373d	469	9	parameters	1217848508	t	-1
464	1	467	80	-3496585145	2d5d17ab-239c-4458-a6c6-07fa14b931fa	470	9	actions	3055149561	t	-1
465	1	470	76	-120371093	595b5537-59d1-40c4-92f0-f6a0a28eb53d	471	9	parameters	1217848508	t	-1
466	1	35	48	-1483420130	3fc5075d-f90e-415f-b347-4a44f81f87fb	472	6	taggable	69713702	t	-1
467	1	13	33	3154160227	sites	473	10	sites	411395544	t	-1
468	1	473	33	534011694	surf-config	474	6	surf-config	3685774615	t	-1
469	1	474	33	3589315753	extensions	475	6	extensions	3499105616	t	-1
470	1	474	33	1902532204	module-deployments	476	6	module-deployments	2134325345	t	-1
471	1	30	4	-4273713444	2a5d066e-c273-4cd3-aafa-9a81d0bf17b4	477	1	authorities	2510957676	t	-1
472	1	477	4	-457838910	4a5ae287-d4d3-4633-8892-8e4468b2aed5	478	6	GROUP_ALFRESCO_ADMINISTRATORS	778018641	t	-1
473	1	477	4	-1352669860	54fd6728-0f1d-4be9-b524-a5d44e61ea47	479	6	GROUP_EMAIL_CONTRIBUTORS	2786248885	t	-1
474	1	477	4	-726830075	fb9d3a63-ad6b-4401-a931-b114159ae017	480	6	GROUP_SITE_ADMINISTRATORS	3539425948	t	-1
475	1	477	4	-121438762	01a8aff7-4ea6-423c-aab3-e475d0eed287	481	6	GROUP_ALFRESCO_SEARCH_ADMINISTRATORS	4014781877	t	-1
476	1	477	4	-510203733	42e425e7-41ec-44b5-96d3-3931c17f0f3a	482	6	GROUP_ALFRESCO_MODEL_ADMINISTRATORS	2911185014	t	-1
477	1	30	4	-1306506139	16ff445e-d4c8-4c5d-87e1-defe476f848a	483	1	zones	2314500199	t	-1
478	1	483	4	-1699535072	cf9e75f6-b4b6-4cd1-82f9-cf67a7f033a8	484	6	AUTH.ALF	2596686762	t	-1
479	1	484	92	2536743080	group_alfresco_administrators	478	6	GROUP_ALFRESCO_ADMINISTRATORS	778018641	f	-1
480	1	484	92	141606041	group_email_contributors	479	6	GROUP_EMAIL_CONTRIBUTORS	2786248885	f	-1
481	1	484	92	2655924869	group_site_administrators	480	6	GROUP_SITE_ADMINISTRATORS	3539425948	f	-1
482	1	484	92	1623073823	group_alfresco_search_administrators	481	6	GROUP_ALFRESCO_SEARCH_ADMINISTRATORS	4014781877	f	-1
483	1	484	92	2133539788	group_alfresco_model_administrators	482	6	GROUP_ALFRESCO_MODEL_ADMINISTRATORS	2911185014	f	-1
484	1	483	4	-868771119	2da5847e-84ba-481b-974a-5604655f457c	485	6	APP.DEFAULT	3739798299	t	-1
485	1	485	92	2536743080	group_alfresco_administrators	478	6	GROUP_ALFRESCO_ADMINISTRATORS	778018641	f	-1
486	1	485	92	141606041	group_email_contributors	479	6	GROUP_EMAIL_CONTRIBUTORS	2786248885	f	-1
487	1	485	92	2655924869	group_site_administrators	480	6	GROUP_SITE_ADMINISTRATORS	3539425948	f	-1
488	1	485	92	1623073823	group_alfresco_search_administrators	481	6	GROUP_ALFRESCO_SEARCH_ADMINISTRATORS	4014781877	f	-1
489	1	485	92	2133539788	group_alfresco_model_administrators	482	6	GROUP_ALFRESCO_MODEL_ADMINISTRATORS	2911185014	f	-1
490	1	478	93	1525942438	2c4adf2e-1e68-4fe8-be3b-338ffdd0d688	32	6	admin	347996256	f	-1
491	1	479	93	1525942438	2c4adf2e-1e68-4fe8-be3b-338ffdd0d688	32	6	admin	347996256	f	-1
492	1	480	93	1525942438	2c4adf2e-1e68-4fe8-be3b-338ffdd0d688	32	6	admin	347996256	f	-1
493	1	481	93	1525942438	2c4adf2e-1e68-4fe8-be3b-338ffdd0d688	32	6	admin	347996256	f	-1
494	1	482	93	1525942438	2c4adf2e-1e68-4fe8-be3b-338ffdd0d688	32	6	admin	347996256	f	-1
495	1	484	92	1525942438	2c4adf2e-1e68-4fe8-be3b-338ffdd0d688	32	6	admin	347996256	f	-1
496	1	484	92	3359989148	8a4b32b0-e077-45b9-972c-677f983e826c	33	6	guest	805803811	f	-1
497	1	485	92	1525942438	2c4adf2e-1e68-4fe8-be3b-338ffdd0d688	32	6	admin	347996256	f	-1
498	1	485	92	3359989148	8a4b32b0-e077-45b9-972c-677f983e826c	33	6	guest	805803811	f	-1
499	1	30	4	-887366359	2093c1d5-6528-416d-bf2b-9ce2bbb6ba1e	486	1	remote_credentials	3212737544	t	-1
500	1	30	4	-1343143308	d340bd27-f4b7-4f0d-81b8-1048a4d6a8a1	487	1	syncset_definitions	4198702871	t	-1
501	1	14	33	3181060681	imap configs	488	7	imap_configs	2749296655	t	-1
502	1	488	33	1864924558	templates	489	7	imap_templates	4290309844	t	-1
503	1	489	33	1875732140	emailbody-textplain.ftl	490	6	emailbody-textplain.ftl	3210300196	t	-1
504	1	489	33	3090409056	emailbody-texthtml.ftl	491	6	emailbody-texthtml.ftl	1275632005	t	-1
505	1	14	33	2150250776	transfers	492	7	transfers	1290437877	t	-1
506	1	492	33	1570715444	transfer target groups	493	7	transfer_groups	957030808	t	-1
507	1	493	33	2123542495	default group	494	6	default	2172081413	t	-1
508	1	492	33	3801670724	inbound transfer records	495	7	inbound_transfer_records	310355882	t	-1
509	1	492	33	190023114	temp	496	7	temp	3957740328	t	-1
510	1	14	33	1529518448	rendering actions space	497	7	rendering_actions	1996713548	t	-1
511	1	14	33	3343785569	replication actions space	498	7	replication_actions	2660722499	t	-1
512	1	494	60	-2639847050	718cc6db-0a79-4373-b2b3-9fc644244ba7	499	8	ruleFolder	864502120	t	-1
513	1	499	33	310642117	6b737dc2-6787-4636-beab-e63ac7c18151	500	8	rules3245de8b-2cfe-42ed-8f8b-44089f99b265	3083479138	t	-1
514	1	500	67	-4145652807	7a9046e7-775c-4a59-bda6-fb53a8ccdee7	501	8	action	2726102540	t	-1
515	1	501	102	-4256057512	90cddd2a-4572-4cbf-9784-fef6af001558	502	9	actionFolder	2614599834	t	-1
516	1	501	80	-3510170111	0ba70717-e6c0-4b69-8ccd-297320cdd56c	503	9	actions	3055149561	t	-1
517	1	503	76	-2729775840	8b350532-94db-4a96-a6d7-d869132c3ff8	504	9	parameters	1217848508	t	-1
518	1	501	73	-3873684197	4086d555-5eec-43d7-b14e-9ccdaf8f3f32	505	9	conditions	3127092715	t	-1
519	1	505	76	-3052031519	ef8cc274-081c-4dfb-a37f-05c806af249c	506	9	parameters	1217848508	t	-1
520	1	14	33	352265367	scheduled actions	507	6	Scheduled Actions	2131169529	t	-1
521	1	18	33	445231378	new-user-email.html.ftl	508	6	new-user-email.html.ftl	3390938266	t	-1
522	1	18	33	3312025941	new-user-email_fr.html.ftl	509	6	new-user-email_fr.html.ftl	4245145103	t	-1
523	1	18	33	3007941738	new-user-email_es.html.ftl	510	6	new-user-email_es.html.ftl	2334640944	t	-1
524	1	18	33	1484235269	new-user-email_de.html.ftl	511	6	new-user-email_de.html.ftl	1612309855	t	-1
525	1	18	33	1536099796	new-user-email_it.html.ftl	512	6	new-user-email_it.html.ftl	1675707022	t	-1
526	1	18	33	65677689	new-user-email_ja.html.ftl	513	6	new-user-email_ja.html.ftl	998534691	t	-1
527	1	18	33	1187893579	new-user-email_nl.html.ftl	514	6	new-user-email_nl.html.ftl	2124650001	t	-1
528	1	18	33	3691661958	invite-email.html.ftl	515	6	invite-email.html.ftl	868286096	t	-1
529	1	18	33	3163192147	invite-email_fr.html.ftl	516	6	invite-email_fr.html.ftl	1597629548	t	-1
530	1	18	33	3400169068	invite-email_es.html.ftl	517	6	invite-email_es.html.ftl	689563987	t	-1
531	1	18	33	563369987	invite-email_de.html.ftl	518	6	invite-email_de.html.ftl	3257386812	t	-1
532	1	18	33	577568722	invite-email_it.html.ftl	519	6	invite-email_it.html.ftl	3252642029	t	-1
533	1	18	33	2047464319	invite-email_ja.html.ftl	520	6	invite-email_ja.html.ftl	2579123264	t	-1
534	1	18	33	1059990349	invite-email_nl.html.ftl	521	6	invite-email_nl.html.ftl	3701322866	t	-1
535	1	18	33	1305785334	invite-email-add-direct.html.ftl	522	6	invite-email-add-direct.html.ftl	4220725286	t	-1
536	1	18	33	3071386897	invite-email-add-direct.html_fr.ftl	523	6	invite-email-add-direct_fr.html.ftl	3152676049	t	-1
537	1	18	33	216399375	invite-email-add-direct.html_es.ftl	524	6	invite-email-add-direct_es.html.ftl	3452570094	t	-1
538	1	18	33	672747400	invite-email-add-direct.html_de.ftl	525	6	invite-email-add-direct_de.html.ftl	653535105	t	-1
539	1	18	33	3372737124	invite-email-add-direct.html_it.ftl	526	6	invite-email-add-direct_it.html.ftl	621576272	t	-1
540	1	18	33	3885205560	invite-email-add-direct.html_ja.ftl	527	6	invite-email-add-direct_ja.html.ftl	2104077565	t	-1
541	1	18	33	2224164511	invite-email-add-direct.html_nl.ftl	528	6	invite-email-add-direct_nl.html.ftl	944657615	t	-1
542	1	18	33	2574136958	invite-email-moderated.html.ftl	529	6	invite-email-moderated.html.ftl	3101219649	t	-1
543	1	395	33	4141493435	notify_user_email.html.ftl	530	6	notify_user_email.html.ftl	3467930593	t	-1
544	1	395	33	3092459551	notify_user_email_de.html.ftl	531	6	notify_user_email_de.html.ftl	3427405532	t	-1
545	1	395	33	1399660144	notify_user_email_es.html.ftl	532	6	notify_user_email_es.html.ftl	661921971	t	-1
546	1	395	33	625808207	notify_user_email_fr.html.ftl	533	6	notify_user_email_fr.html.ftl	1364471180	t	-1
547	1	395	33	3148584910	notify_user_email_it.html.ftl	534	6	notify_user_email_it.html.ftl	3484592397	t	-1
548	1	395	33	3821976419	notify_user_email_ja.html.ftl	535	6	notify_user_email_ja.html.ftl	2547484064	t	-1
549	1	395	33	2800304977	notify_user_email_nl.html.ftl	536	6	notify_user_email_nl.html.ftl	3538976146	t	-1
550	1	489	33	2852742012	emailbody_textplain_share.ftl	537	6	emailbody_textplain_share.ftl	3725614527	t	-1
551	1	489	33	1349507622	emailbody_textplain_alfresco.ftl	538	6	emailbody_textplain_alfresco.ftl	3861398006	t	-1
552	1	489	33	1214296187	emailbody_texthtml_alfresco.ftl	539	6	emailbody_texthtml_alfresco.ftl	1775656260	t	-1
553	1	489	33	2597111155	emailbody_texthtml_share.ftl	540	6	emailbody_texthtml_share.ftl	840998128	t	-1
554	1	489	33	3185687119	emailbody_textplain_share_de.ftl	541	6	emailbody_textplain_share_de.ftl	195436959	t	-1
555	1	489	33	1293729871	emailbody_textplain_alfresco_de.ftl	542	6	emailbody_textplain_alfresco_de.ftl	3130552875	t	-1
556	1	489	33	651551496	emailbody_texthtml_alfresco_de.ftl	543	6	emailbody_texthtml_alfresco_de.ftl	3224427164	t	-1
557	1	489	33	2783891474	emailbody_texthtml_share_de.ftl	544	6	emailbody_texthtml_share_de.ftl	2220375341	t	-1
558	1	489	33	2568817608	emailbody_textplain_share_es.ftl	545	6	emailbody_textplain_share_es.ftl	794464280	t	-1
559	1	489	33	1776316872	emailbody_textplain_alfresco_es.ftl	546	6	emailbody_textplain_alfresco_es.ftl	2657403820	t	-1
560	1	489	33	36262543	emailbody_texthtml_alfresco_es.ftl	547	6	emailbody_texthtml_alfresco_es.ftl	3838602011	t	-1
561	1	489	33	2165465493	emailbody_texthtml_share_es.ftl	548	6	emailbody_texthtml_share_es.ftl	2695138474	t	-1
562	1	489	33	585715926	emailbody_textplain_share_fr.ftl	549	6	emailbody_textplain_share_fr.ftl	2494483206	t	-1
563	1	489	33	3524537046	emailbody_textplain_alfresco_fr.ftl	550	6	emailbody_textplain_alfresco_fr.ftl	630233266	t	-1
564	1	489	33	3118270865	emailbody_texthtml_alfresco_fr.ftl	551	6	emailbody_texthtml_alfresco_fr.ftl	1597517829	t	-1
565	1	489	33	988166795	emailbody_texthtml_share_fr.ftl	552	6	emailbody_texthtml_share_fr.ftl	458282932	t	-1
566	1	489	33	1560221603	emailbody_textplain_share_it.ftl	553	6	emailbody_textplain_share_it.ftl	3937963123	t	-1
567	1	489	33	2885840291	emailbody_textplain_alfresco_it.ftl	554	6	emailbody_textplain_alfresco_it.ftl	1535565767	t	-1
568	1	489	33	3351989988	emailbody_texthtml_alfresco_it.ftl	555	6	emailbody_texthtml_alfresco_it.ftl	556693360	t	-1
569	1	489	33	1156611582	emailbody_texthtml_share_it.ftl	556	6	emailbody_texthtml_share_it.ftl	1699123393	t	-1
570	1	489	33	1919647231	emailbody_textplain_share_ja.ftl	557	6	emailbody_textplain_share_ja.ftl	3291276847	t	-1
571	1	489	33	2190870527	emailbody_textplain_alfresco_ja.ftl	558	6	emailbody_textplain_alfresco_ja.ftl	1964160411	t	-1
572	1	489	33	3915326648	emailbody_texthtml_alfresco_ja.ftl	559	6	emailbody_texthtml_alfresco_ja.ftl	263855404	t	-1
573	1	489	33	1784944546	emailbody_texthtml_share_ja.ftl	560	6	emailbody_texthtml_share_ja.ftl	1272117917	t	-1
574	1	489	33	2925151545	emailbody_textplain_share_nb.ftl	561	6	emailbody_textplain_share_nb.ftl	404610793	t	-1
575	1	489	33	1588019001	emailbody_textplain_alfresco_nb.ftl	562	6	emailbody_textplain_alfresco_nb.ftl	2837679453	t	-1
576	1	489	33	896408702	emailbody_texthtml_alfresco_nb.ftl	563	6	emailbody_texthtml_alfresco_nb.ftl	3549111786	t	-1
577	1	489	33	3059036004	emailbody_texthtml_share_nb.ftl	564	6	emailbody_texthtml_share_nb.ftl	2548286043	t	-1
578	1	489	33	292223832	emailbody_textplain_share_nl.ftl	565	6	emailbody_textplain_share_nl.ftl	2804768904	t	-1
579	1	489	33	3784802648	emailbody_textplain_alfresco_nl.ftl	566	6	emailbody_textplain_alfresco_nl.ftl	370357052	t	-1
580	1	489	33	2321457695	emailbody_texthtml_alfresco_nl.ftl	567	6	emailbody_texthtml_alfresco_nl.ftl	1824234379	t	-1
581	1	489	33	157651205	emailbody_texthtml_share_nl.ftl	568	6	emailbody_texthtml_share_nl.ftl	684948538	t	-1
582	1	489	33	541294538	emailbody_textplain_share_pt_br.ftl	569	6	emailbody_textplain_share_pt_BR.ftl	296413084	t	-1
583	1	489	33	916414695	emailbody_textplain_alfresco_pt_br.ftl	570	6	emailbody_textplain_alfresco_pt_BR.ftl	2198512349	t	-1
584	1	489	33	526120636	emailbody_texthtml_alfresco_pt_br.ftl	571	6	emailbody_texthtml_alfresco_pt_BR.ftl	4257765129	t	-1
585	1	489	33	1267358861	emailbody_texthtml_share_pt_br.ftl	572	6	emailbody_texthtml_share_pt_BR.ftl	1795313451	t	-1
586	1	489	33	143576139	emailbody_textplain_share_ru.ftl	573	6	emailbody_textplain_share_ru.ftl	3200866203	t	-1
587	1	489	33	4168332875	emailbody_textplain_alfresco_ru.ftl	574	6	emailbody_textplain_alfresco_ru.ftl	267846703	t	-1
588	1	489	33	2478478604	emailbody_texthtml_alfresco_ru.ftl	575	6	emailbody_texthtml_alfresco_ru.ftl	1969204376	t	-1
589	1	489	33	276932118	emailbody_texthtml_share_ru.ftl	576	6	emailbody_texthtml_share_ru.ftl	825707305	t	-1
590	1	489	33	4030035990	emailbody_textplain_share_zh_cn.ftl	577	6	emailbody_textplain_share_zh_CN.ftl	3252478016	t	-1
591	1	489	33	3874055995	emailbody_textplain_alfresco_zh_cn.ftl	578	6	emailbody_textplain_alfresco_zh_CN.ftl	1400677633	t	-1
592	1	489	33	3475894624	emailbody_texthtml_alfresco_zh_cn.ftl	579	6	emailbody_texthtml_alfresco_zh_CN.ftl	767447253	t	-1
593	1	489	33	2617006929	emailbody_texthtml_share_zh_cn.ftl	580	6	emailbody_texthtml_share_zh_CN.ftl	3144960247	t	-1
594	1	14	33	3661972972	publishing root	581	7	publishing_root	229799721	t	-1
595	1	30	4	-4146416826	16dae85e-a791-4b5c-af1b-b575b0fe8857	582	1	downloads	3307032186	t	-1
596	1	23	33	2732812139	smartfoldersexample.json	583	14	smartfolder.sample	3192301734	t	-1
597	1	21	33	1918060495	start-pooled-review-workflow.js	584	6	example.js	1403687563	t	-1
599	1	477	4	-2465559798	1b46dc01-692f-4a6d-a238-ea88ca356e4e	586	6	GROUP_site_swsdp	3760915499	t	-1
600	1	483	4	-376942789	f9c6bdfb-4c1f-45d8-a245-752b9ccf01b2	587	6	APP.SHARE	3658694637	t	-1
601	1	587	92	3284435889	4f78dc6e000a27fc3bb7e9c70aa6b5d9	586	6	GROUP_site_swsdp	3760915499	f	-1
602	1	484	92	3284435889	4f78dc6e000a27fc3bb7e9c70aa6b5d9	586	6	GROUP_site_swsdp	3760915499	f	-1
603	1	477	4	-1806157642	424e2940-a4d6-4e77-8bd7-7d917a9a4575	588	6	GROUP_site_swsdp_SiteManager	819207528	t	-1
604	1	587	92	2601610584	9e5cb3fa1850083495559ca2a4ca2de9	588	6	GROUP_site_swsdp_SiteManager	819207528	f	-1
605	1	484	92	2601610584	9e5cb3fa1850083495559ca2a4ca2de9	588	6	GROUP_site_swsdp_SiteManager	819207528	f	-1
606	1	586	93	2601610584	9e5cb3fa1850083495559ca2a4ca2de9	588	6	GROUP_site_swsdp_SiteManager	819207528	f	-1
607	1	477	4	-3630631913	fb54cdad-57e9-4f58-b164-a8bb1c464f1b	589	6	GROUP_site_swsdp_SiteCollaborator	1706459855	t	-1
608	1	587	92	1727778803	58d3dfc926fbcb0ce0a1213c37dc4711	589	6	GROUP_site_swsdp_SiteCollaborator	1706459855	f	-1
609	1	484	92	1727778803	58d3dfc926fbcb0ce0a1213c37dc4711	589	6	GROUP_site_swsdp_SiteCollaborator	1706459855	f	-1
610	1	586	93	1727778803	58d3dfc926fbcb0ce0a1213c37dc4711	589	6	GROUP_site_swsdp_SiteCollaborator	1706459855	f	-1
611	1	477	4	-4183762347	8e08862e-2d45-4f80-b63f-ffb513517597	590	6	GROUP_site_swsdp_SiteContributor	32651092	t	-1
612	1	587	92	2523597308	5b487fd6a02f7430721726163ba0daa9	590	6	GROUP_site_swsdp_SiteContributor	32651092	f	-1
613	1	484	92	2523597308	5b487fd6a02f7430721726163ba0daa9	590	6	GROUP_site_swsdp_SiteContributor	32651092	f	-1
614	1	586	93	2523597308	5b487fd6a02f7430721726163ba0daa9	590	6	GROUP_site_swsdp_SiteContributor	32651092	f	-1
615	1	477	4	-1029107868	af45dfcf-2d3f-454f-9dae-f27e0ca1c14b	591	6	GROUP_site_swsdp_SiteConsumer	2168792413	t	-1
616	1	587	92	2118386964	73714588eb587e2a207a436130080c9e	591	6	GROUP_site_swsdp_SiteConsumer	2168792413	f	-1
617	1	484	92	2118386964	73714588eb587e2a207a436130080c9e	591	6	GROUP_site_swsdp_SiteConsumer	2168792413	f	-1
618	1	586	93	2118386964	73714588eb587e2a207a436130080c9e	591	6	GROUP_site_swsdp_SiteConsumer	2168792413	f	-1
619	1	588	93	1525942438	2c4adf2e-1e68-4fe8-be3b-338ffdd0d688	32	6	admin	347996256	f	-1
620	1	3	4	-2222325513	3ed1399f-cdf1-499a-a482-822cf6d03242	592	2	abeecher	4294529677	t	-1
677	1	603	33	1931736815	video files	648	6	Video Files	4028267525	t	-1
621	1	3	4	-1172343580	d0fe3d94-8153-4ac5-9931-c655e3718651	593	2	mjackson	3024187048	t	-1
622	1	31	4	-2649097677	4c5b7616-3751-491f-a687-5b011da87c56	594	6	abeecher	3272809292	t	-1
623	1	594	138	-3179462056	307d00e7-7ac6-4a80-a6d5-4f08ef135069	595	6	abeecher-avatar.jpg	1156794817	t	-1
624	1	595	143	-4108190066	69963e74-68ef-4e36-bf2d-b4b7a8b0edf5	596	6	avatar	3795810163	t	-1
625	1	31	4	-1103197539	7876b3ec-773b-4e2e-b01c-45a460023eb7	597	6	mjackson	2292918121	t	-1
626	1	597	138	-615987489	61f8fdf8-1959-464a-877b-e1dd857468ac	598	6	mjackson-avatar.jpg	1186772188	t	-1
627	1	598	143	-3194949468	72d07874-a238-464f-913b-3500cc4a9a24	599	6	avatar	3795810163	t	-1
628	1	589	93	3063427348	dc103838-645f-43c1-8a2a-bc187e13c343	594	6	abeecher	3272809292	f	-1
629	1	588	93	504535620	b6d80d49-21cc-4f04-9c92-e7063037543f	597	6	mjackson	2292918121	f	-1
630	1	473	33	2308701361	swsdp	601	6	swsdp	355201447	t	-1
631	1	601	33	3872509529	documentlibrary	602	6	documentLibrary	202189778	t	-1
632	1	602	33	4069355619	agency files	603	6	Agency Files	1958504637	t	-1
633	1	603	33	156281203	contracts	604	6	Contracts	3950493975	t	-1
634	1	604	33	3266167157	project contract.pdf	605	6	Project Contract.pdf	3754194629	t	-1
635	1	10	165	4047806828	1a0b110f-1e09-4ca2-b367-fe25e4964a4e	606	5	1a0b110f-1e09-4ca2-b367-fe25e4964a4e	2976416666	t	-1
636	1	606	167	-2858480442	44e15401-b211-4431-a2ab-85fc0eef84a7	607	5	version-0	3486964613	t	-1
637	1	605	143	-2318616460	3be9c93b-3e5d-4302-99da-c4c628981568	608	6	doclib	2991633180	t	-1
638	1	605	143	-3685800442	ad97aa7e-d88f-4578-83ab-bf4deba41e3d	609	6	webpreview	1387062285	t	-1
639	1	603	33	3760176746	images	610	6	Images	335265280	t	-1
640	1	610	33	3788176685	coins.jpg	611	6	coins.JPG	398153056	t	-1
641	1	611	143	-2832912170	37ac78c5-3bac-4fc6-8d46-d49c7a08e377	612	6	doclib	2991633180	t	-1
642	1	610	33	1184564164	graph.jpg	613	6	graph.JPG	2968169353	t	-1
643	1	613	143	-1581800709	1fcc9b39-5f52-4eaa-b037-3a27cba77d4b	614	6	doclib	2991633180	t	-1
644	1	610	33	3611285497	grass.jpg	615	6	grass.jpg	3085516094	t	-1
645	1	615	143	-1698471554	d5db7fd8-7237-4da6-bf82-bf656c821cf8	616	6	doclib	2991633180	t	-1
646	1	615	143	-1925958512	464d7ca8-a93e-43ab-8cd6-ba007f2daf27	617	6	imgpreview	2566125866	t	-1
647	1	610	33	3436769363	money.jpg	618	6	money.JPG	984176670	t	-1
648	1	618	143	-265958316	3fe9f803-835c-41aa-b96a-c583247b99bd	619	6	doclib	2991633180	t	-1
649	1	610	33	2105090824	plugs.jpg	620	6	plugs.jpg	498059727	t	-1
650	1	620	143	-3235790671	7f0e6c06-963d-4534-988f-379c75af7f0f	621	6	doclib	2991633180	t	-1
651	1	610	33	4257289731	turbine.jpg	622	6	turbine.JPG	2936176304	t	-1
652	1	622	143	-3675032711	40c7e61c-6c68-4739-8e57-fcb03255b32e	623	6	doclib	2991633180	t	-1
653	1	610	33	3650608928	wires.jpg	624	6	wires.JPG	803633005	t	-1
654	1	624	143	-3337046828	9d77efc8-8f4b-4a42-990f-ca9359c411dd	625	6	doclib	2991633180	t	-1
655	1	610	33	4245898435	wind turbine.jpg	626	6	wind turbine.JPG	3896697426	t	-1
656	1	626	143	-510034440	e1d7a22f-db21-4728-95ce-de63c1e2d634	627	6	doclib	2991633180	t	-1
657	1	610	33	3010006787	header.png	628	6	header.png	3054079738	t	-1
658	1	628	143	-2568702790	6f98e141-0313-4333-9490-5ef264ac6224	629	6	doclib	2991633180	t	-1
659	1	610	33	2227112316	windmill.png	630	6	windmill.png	3682526558	t	-1
660	1	630	143	-2600736080	a0e1c616-69f9-4c77-826f-2a04804727cc	631	6	doclib	2991633180	t	-1
661	1	610	33	4117066625	low consumption bulb.png	632	6	low consumption bulb.png	383184062	t	-1
662	1	632	143	-474868404	b13d6b3f-ef9b-40b4-9942-ca6c3af27ab2	633	6	doclib	2991633180	t	-1
663	1	603	33	3420513569	logo files	634	6	Logo Files	1075595276	t	-1
664	1	634	33	1875520457	ge logo.png	635	6	GE Logo.png	2602168225	t	-1
665	1	635	143	-4144590516	bbdf5803-ea07-4792-a3be-fd4fd095e0ec	636	6	doclib	2991633180	t	-1
666	1	634	33	2915011424	logo.png	637	6	logo.png	3420166655	t	-1
667	1	637	143	-3204182047	3d76130a-cbcd-49f1-81b8-bb5cd1b8c369	638	6	doclib	2991633180	t	-1
668	1	603	33	3588352399	mock-ups	639	6	Mock-Ups	1925111718	t	-1
669	1	639	33	2490552511	sample 1.png	640	6	sample 1.png	3417521309	t	-1
670	1	640	143	-3100388837	925ccfd9-4c86-4f1b-bb0d-58e9c25dd9d8	641	6	doclib	2991633180	t	-1
671	1	639	33	3553798767	sample 2.png	642	6	sample 2.png	2350073421	t	-1
672	1	642	143	-868266974	c32af6e1-7172-407f-ba70-c0470ba5b7b1	643	6	doclib	2991633180	t	-1
673	1	642	143	-1512165058	32570941-753f-45d4-8e75-ce9b1f5111e5	644	6	imgpreview	2566125866	t	-1
674	1	639	33	4004676575	sample 3.png	645	6	sample 3.png	2977132541	t	-1
675	1	645	143	-2139602789	ea4aa9d2-624f-4850-8c95-36a8e9d961d5	646	6	doclib	2991633180	t	-1
676	1	645	143	-2332167840	d9ba3c8a-3aa1-460e-9914-62cf6cbd4ce0	647	6	imgpreview	2566125866	t	-1
678	1	648	33	2956299995	websitereview.mp4	649	6	WebSiteReview.mp4	2521430049	t	-1
679	1	602	33	2538629819	budget files	650	6	Budget Files	291598949	t	-1
680	1	650	33	1781477269	invoices	651	6	Invoices	4114440028	t	-1
681	1	651	33	2109261446	inv i200-109.png	652	6	inv I200-109.png	3867146597	t	-1
682	1	652	143	-3665662912	279c169d-497f-4299-8f22-1c4e681e1adb	653	6	doclib	2991633180	t	-1
683	1	651	33	2448114923	inv i200-189.png	654	6	inv I200-189.png	170687240	t	-1
684	1	654	143	-1782367757	60cb899e-cdd6-4e00-ba0f-5c8b2fd28279	655	6	doclib	2991633180	t	-1
685	1	650	33	3627867045	budget.xls	656	6	budget.xls	3713817180	t	-1
686	1	656	143	-640287847	e8a9dab0-3052-41dd-ae0a-f3fead9b0380	657	6	doclib	2991633180	t	-1
687	1	656	143	-1648093220	e86e41bf-2d57-4208-874b-a1cdb9dd7b3d	658	6	webpreview	1387062285	t	-1
688	1	656	197	4094595993	budget.xls discussion	659	17	discussion	2764908846	t	-1
689	1	659	33	1604228650	comments	660	6	Comments	3230459619	t	-1
690	1	660	33	4186633902	comment-1297852210661_622	661	6	comment-1297852210661_622	1326409740	t	-1
691	1	602	33	2472434584	meeting notes	662	6	Meeting Notes	887013217	t	-1
692	1	662	33	554498960	meeting notes 2011-01-27.doc	663	6	Meeting Notes 2011-01-27.doc	2778943928	t	-1
693	1	663	143	-3050682609	00a3e5d6-be46-4c2f-ae6b-4053b5bcd74d	664	6	doclib	2991633180	t	-1
694	1	663	143	-4145224306	f13168b2-50ad-462e-a4c2-4fc170a0c384	665	6	webpreview	1387062285	t	-1
695	1	662	33	399244216	meeting notes 2011-02-03.doc	666	6	Meeting Notes 2011-02-03.doc	2472825232	t	-1
696	1	666	143	-1663518979	7cdf9fbe-b022-4bdc-a4a4-47d94fe1a6a9	667	6	doclib	2991633180	t	-1
697	1	666	143	-2431202924	fd3e54fd-f459-449c-9a56-1c93ce622ede	668	6	webpreview	1387062285	t	-1
698	1	662	33	2604094157	meeting notes 2011-02-10.doc	669	6	Meeting Notes 2011-02-10.doc	530118885	t	-1
699	1	669	143	-658945411	9bba56d7-ff52-480b-93c6-dd65b7b794a4	670	6	doclib	2991633180	t	-1
700	1	669	143	-2909782729	2cfcc981-dbcf-49db-8f7c-e3d32ea501b1	671	6	webpreview	1387062285	t	-1
701	1	602	33	1922263837	presentations	672	6	Presentations	349348064	t	-1
702	1	672	33	1616623070	project objectives.ppt	673	6	Project Objectives.ppt	3516604448	t	-1
703	1	673	143	-1698282771	ea4a1634-7ecf-404f-b794-1548482e8456	674	6	doclib	2991633180	t	-1
704	1	673	143	-710800400	ca7b6a9d-e4d7-4163-887d-52c81908b7c1	675	6	webpreview	1387062285	t	-1
705	1	672	33	1655540618	project overview.ppt	676	6	Project Overview.ppt	2143566906	t	-1
706	1	676	143	-3936220001	7d33c40e-2d6e-4595-b92f-2ce9f11de134	677	6	doclib	2991633180	t	-1
707	1	676	143	-3942175569	51445feb-c5b7-4e2f-b1d3-ede62d91a332	678	6	webpreview	1387062285	t	-1
708	1	601	33	3514999064	links	679	6	links	1295166478	t	-1
709	1	679	33	2679163169	link-1297806194371_850	680	6	link-1297806194371_850	1804318404	t	-1
710	1	679	33	358194127	link-1297806244007_178	681	6	link-1297806244007_178	3781354538	t	-1
711	1	601	33	3997967452	datalists	682	6	dataLists	1331421599	t	-1
712	1	682	33	260683937	71824d77-9cd8-44c3-b3e4-dbca7e17dc49	683	6	71824d77-9cd8-44c3-b3e4-dbca7e17dc49	1168218450	t	-1
713	1	683	33	3513423167	e6fc15e9-5caf-4f17-857e-7b0cfbc655a9	684	6	e6fc15e9-5caf-4f17-857e-7b0cfbc655a9	2604840140	t	-1
714	1	683	33	64120555	42fcbae6-b1fe-4028-9f85-9ad7f81a8e3b	685	6	42fcbae6-b1fe-4028-9f85-9ad7f81a8e3b	1241138968	t	-1
715	1	683	33	2622673710	66028f46-c074-4cf5-9f37-8490e51ca540	686	6	66028f46-c074-4cf5-9f37-8490e51ca540	3598381789	t	-1
716	1	683	33	1496050538	50046ccd-9034-420f-925b-0530836488c4	687	6	50046ccd-9034-420f-925b-0530836488c4	319015577	t	-1
717	1	682	33	734398789	aea88103-517e-4aa0-a3be-de258d0e6465	688	6	aea88103-517e-4aa0-a3be-de258d0e6465	1642997942	t	-1
718	1	688	33	3109944928	9198bd31-a664-4584-a271-b529daf4793b	689	6	9198bd31-a664-4584-a271-b529daf4793b	4084588435	t	-1
719	1	688	33	138801921	eb1c2fda-4868-4384-b29e-78c01b6601ec	690	6	eb1c2fda-4868-4384-b29e-78c01b6601ec	1114493682	t	-1
720	1	688	33	2512162572	35b8be80-170f-40af-a173-513758b83165	691	6	35b8be80-170f-40af-a173-513758b83165	3751063295	t	-1
721	1	688	33	2362257682	567ee439-4ebc-40cf-a783-3e561ad5a605	692	6	567ee439-4ebc-40cf-a783-3e561ad5a605	3336900833	t	-1
722	1	688	33	3797031659	7a0bb872-bf7c-457b-831e-95f94efb9816	693	6	7a0bb872-bf7c-457b-831e-95f94efb9816	2826582808	t	-1
723	1	601	33	583916550	wiki	694	6	wiki	2613470146	t	-1
724	1	694	33	4105798722	main_page	695	6	Main_Page	3064742680	t	-1
725	1	10	165	417166766	d6f3a279-ce86-4a12-8985-93b71afbb71d	696	5	d6f3a279-ce86-4a12-8985-93b71afbb71d	1492211544	t	-1
726	1	696	167	-3357476009	1a0e3347-9ae1-4d3f-beb8-dee850625071	697	5	version-0	3486964613	t	-1
727	1	694	33	1157518050	meetings	698	6	Meetings	3689685547	t	-1
728	1	10	165	955032534	1373739a-2849-4647-9e97-7a4e05cc5841	699	5	1373739a-2849-4647-9e97-7a4e05cc5841	2025881888	t	-1
729	1	699	167	-115935335	a2243b00-c9f3-4682-965f-da3754ab4d3d	700	5	version-0	3486964613	t	-1
730	1	694	33	418873732	milestones	701	6	Milestones	1388970925	t	-1
731	1	10	165	1094547242	3c73aace-9f54-420d-a1c0-c54b6a116dcf	702	5	3c73aace-9f54-420d-a1c0-c54b6a116dcf	17913308	t	-1
732	1	702	167	-1100538459	d5820771-8147-4cf0-a62e-9fae29dc2b30	703	5	version-0	3486964613	t	-1
733	1	601	33	2339466083	discussions	704	6	discussions	1326793050	t	-1
734	1	704	33	1324234952	post-1297807546884_964	705	6	post-1297807546884_964	3134539565	t	-1
735	1	705	33	1324234952	post-1297807546884_964	706	6	post-1297807546884_964	3134539565	t	-1
736	1	705	33	2030775859	post-1297807619797_315	707	6	post-1297807619797_315	2368754134	t	-1
737	1	705	33	1963213525	post-1297807729794_112	708	6	post-1297807729794_112	2168405296	t	-1
738	1	705	33	1848061172	post-1297807767790_183	709	6	post-1297807767790_183	2585547537	t	-1
739	1	704	33	3424006769	post-1297807581026_873	710	6	post-1297807581026_873	942493076	t	-1
740	1	710	33	3424006769	post-1297807581026_873	711	6	post-1297807581026_873	942493076	t	-1
741	1	710	33	881747235	post-1297807650635_649	712	6	post-1297807650635_649	3233094342	t	-1
742	1	601	33	534011694	surf-config	713	6	surf-config	3685774615	t	-1
743	1	713	33	544531829	pages	714	6	pages	3167021155	t	-1
744	1	714	33	1766001124	site	715	6	site	3494426144	t	-1
745	1	715	33	2308701361	swsdp	716	6	swsdp	355201447	t	-1
746	1	716	33	631660036	dashboard.xml	717	6	dashboard.xml	4036615692	t	-1
747	1	713	33	3997758973	components	718	6	components	3945296900	t	-1
748	1	718	33	1334852793	page.component-1-1.site~swsdp~dashboard.xml	719	6	page.component-1-1.site~swsdp~dashboard.xml	3555596018	t	-1
749	1	718	33	1524266966	page.component-1-3.site~swsdp~dashboard.xml	720	6	page.component-1-3.site~swsdp~dashboard.xml	3332660637	t	-1
750	1	718	33	1296972702	page.component-2-1.site~swsdp~dashboard.xml	721	6	page.component-2-1.site~swsdp~dashboard.xml	3509588437	t	-1
751	1	718	33	3206141542	page.component-2-2.site~swsdp~dashboard.xml	722	6	page.component-2-2.site~swsdp~dashboard.xml	594017325	t	-1
752	1	718	33	1476686065	page.component-2-3.site~swsdp~dashboard.xml	723	6	page.component-2-3.site~swsdp~dashboard.xml	3296352954	t	-1
753	1	718	33	3046069903	page.navigation.site~swsdp~dashboard.xml	724	6	page.navigation.site~swsdp~dashboard.xml	3548890421	t	-1
754	1	718	33	861589342	page.title.site~swsdp~dashboard.xml	725	6	page.title.site~swsdp~dashboard.xml	3302915386	t	-1
755	1	718	33	3183989057	page.component-1-2.site~swsdp~dashboard.xml	726	6	page.component-1-2.site~swsdp~dashboard.xml	565836554	t	-1
756	1	718	33	2182679792	page.component-1-4.site~swsdp~dashboard.xml	727	6	page.component-1-4.site~swsdp~dashboard.xml	510076603	t	-1
757	1	8	4	-1454266326	48b8a799-3bb2-4524-939f-39f7f033cf0b	728	20	modules	462710347	t	-1
758	1	728	4	-2813381843	3e3b7afb-bb0b-45fc-abe3-9420a856adb8	729	20	alfresco-aos-module	2155693883	t	-1
759	1	728	4	-1456722806	07a99404-ebb5-4307-8ff4-719a23f9fdee	730	20	org.alfresco.integrations.google.docs	3196163045	t	-1
760	1	728	4	-2377911515	7beeb694-d46f-48ca-9e3f-c07f68705b2c	731	20	alfresco-share-services	3303942366	t	-1
761	1	728	4	-4008645952	ca5ee137-db77-4f68-b713-93879f2f3d79	732	20	alfresco-trashcan-cleaner	2285549386	t	-1
762	1	497	33	3026971897	49d47529-9f28-4ee7-a538-7cbb0dcd4d6d	733	6	imgpreview	2566125866	t	-1
763	1	733	76	-4280104904	dee3648e-6d74-4eb0-adbe-db2f0c934de3	734	9	parameters	1217848508	t	-1
764	1	733	76	-2271572907	20442a3f-82a2-49dd-a2fd-5287e7ed3047	735	9	parameters	1217848508	t	-1
765	1	733	76	-1379004510	811f7727-8430-47b7-8f68-37ae59369ae8	736	9	parameters	1217848508	t	-1
766	1	733	76	-2861620328	90f1afe3-0880-4589-b020-215d6af0b751	737	9	parameters	1217848508	t	-1
767	1	733	76	-2802674228	666fd76c-0050-4f87-a741-8f1e335c9685	738	9	parameters	1217848508	t	-1
768	1	733	76	-2955663270	f502671b-9e45-46e4-9b02-e0fdca181b74	739	9	parameters	1217848508	t	-1
769	1	733	76	-141824406	608ec455-ce4c-4c46-95d4-0c52dd5e7005	740	9	parameters	1217848508	t	-1
770	1	733	76	-1228628382	ed1f9e09-2c4a-46df-bbb9-908a7b0bb362	741	9	parameters	1217848508	t	-1
771	1	733	76	-498200958	ea53e7ec-0cee-4ed7-b3a2-c428f24eb983	742	9	parameters	1217848508	t	-1
772	1	733	76	-1790612763	5d3c57ad-eb2d-4f13-94e8-ca4550d61d0c	743	9	parameters	1217848508	t	-1
773	1	733	76	-3577866696	de4c8c86-2588-4119-98ca-5f9d95fce3d3	744	9	parameters	1217848508	t	-1
774	1	733	76	-2629156549	1f0fe65c-800f-4fa0-ac9e-81d6b9b64337	745	9	parameters	1217848508	t	-1
775	1	733	76	-2366938032	9e5c7756-5aeb-4b6e-bf88-c1109b2ce3b4	746	9	parameters	1217848508	t	-1
776	1	733	76	-4243796768	788d9424-2baf-4f02-be9d-5ab7b124f58a	747	9	parameters	1217848508	t	-1
777	1	733	76	-21092085	6d4dbee7-e55f-493e-bcc4-7b1dcaeeaed0	748	9	parameters	1217848508	t	-1
778	1	733	76	-4192547583	81d5ba86-8b41-4ed8-8477-2bee21ecf3ff	749	9	parameters	1217848508	t	-1
779	1	733	76	-3872448940	2d10966e-87b3-4527-88c8-f4dce199388d	750	9	parameters	1217848508	t	-1
780	1	733	76	-2090358100	4534e8c3-b8b1-47e7-8ad5-b6782a924d6d	751	9	parameters	1217848508	t	-1
781	1	733	76	-2111222536	819fcd93-22a7-40e2-9d28-505cbcb928ed	752	9	parameters	1217848508	t	-1
782	1	733	76	-1866691061	2587a550-412a-44ab-b808-e9536b7f124b	753	9	parameters	1217848508	t	-1
783	1	497	33	1775090832	841304d4-497d-406b-85e1-6f302d893708	754	6	doclib	2991633180	t	-1
784	1	754	76	-3430630154	4cc346c7-cb49-4f08-afca-abf5588cfe81	755	9	parameters	1217848508	t	-1
785	1	754	76	-4166323333	ad9f5224-24f9-4cea-bc41-17d3b7c42939	756	9	parameters	1217848508	t	-1
786	1	754	76	-2974195148	04df061c-091c-4adb-8541-f120bfeee4e6	757	9	parameters	1217848508	t	-1
787	1	754	76	-3383645779	a415a822-71bb-414c-a09f-64dfc39d7c77	758	9	parameters	1217848508	t	-1
788	1	754	76	-3405761300	b6466ccd-af03-4b79-a046-be6c6f151acc	759	9	parameters	1217848508	t	-1
789	1	754	76	-4271607025	9d106387-4a5f-49ee-9c93-43d5e10d8058	760	9	parameters	1217848508	t	-1
790	1	754	76	-1364376951	34a5a142-7ead-4bce-b093-899def59b0d9	761	9	parameters	1217848508	t	-1
791	1	754	76	-352965495	e1690d02-f22d-46d9-a32f-ccd207b6c477	762	9	parameters	1217848508	t	-1
792	1	754	76	-3989604081	22871f84-c092-4508-a603-e28eb82c68d2	763	9	parameters	1217848508	t	-1
793	1	754	76	-2310693652	9d0b26a5-147e-464b-8e35-1422d6c655b2	764	9	parameters	1217848508	t	-1
794	1	754	76	-3717253419	f93b4a37-81ab-45c9-96f9-8df138eba2bc	765	9	parameters	1217848508	t	-1
795	1	754	76	-2911693130	2ef116e7-43ed-4067-886d-7421d4af3ccb	766	9	parameters	1217848508	t	-1
796	1	754	76	-3566674521	9ea59a1d-ae43-49bc-bbdb-d37920b5687f	767	9	parameters	1217848508	t	-1
797	1	754	76	-1686253392	bfaf3587-340f-45e5-a339-b73b8ffdd91a	768	9	parameters	1217848508	t	-1
798	1	754	76	-2775578413	cd6a9e45-202d-43b0-a40e-909f080c2cd7	769	9	parameters	1217848508	t	-1
799	1	754	76	-51669010	f282072e-aa6b-4215-9e22-39308a26dec7	770	9	parameters	1217848508	t	-1
800	1	754	76	-3045008057	01cf7827-4112-4917-a9be-642182137119	771	9	parameters	1217848508	t	-1
801	1	754	76	-3514422033	6fdbed0c-577c-49a0-876d-f556ff08f599	772	9	parameters	1217848508	t	-1
802	1	754	76	-2402785495	f29dd1af-11ba-4449-9251-32705df0d51a	773	9	parameters	1217848508	t	-1
803	1	754	76	-893848688	1e8dbdfd-eaff-4d69-8423-256f944482d1	774	9	parameters	1217848508	t	-1
804	1	497	33	476698800	a50c21fa-2cc2-4217-9c7d-570cd2d8dd25	775	6	pdf	1671108346	t	-1
805	1	775	76	-1990251943	ec4506e0-bed3-4162-907d-c90e9f6c4e54	776	9	parameters	1217848508	t	-1
806	1	775	76	-962256523	af86dedc-1984-4d8f-890b-7f456ec956aa	777	9	parameters	1217848508	t	-1
807	1	775	76	-1602927178	d78407e8-1bd7-4de5-8fc0-15c4f0343bd9	778	9	parameters	1217848508	t	-1
808	1	775	76	-1703644366	3de1e603-8e74-400c-b9fd-da9f129021c5	779	9	parameters	1217848508	t	-1
809	1	775	76	-3964663403	df98d5e0-a06d-40b6-a6cd-86c03eb04f41	780	9	parameters	1217848508	t	-1
810	1	775	76	-2262147785	a1402be3-6cd9-4702-8938-728d663784d1	781	9	parameters	1217848508	t	-1
811	1	775	76	-1442870373	a616962b-11b6-4898-b35e-6538f3627bcc	782	9	parameters	1217848508	t	-1
812	1	775	76	-329997627	b3f4d6ae-29b7-4828-bdf2-06832272dd61	783	9	parameters	1217848508	t	-1
813	1	775	76	-2937142910	7a84473e-080e-4b02-86b8-8a54dd756334	784	9	parameters	1217848508	t	-1
814	1	775	76	-3573088997	19e6d8e5-3f07-4cf6-8e97-fabe354a6bd5	785	9	parameters	1217848508	t	-1
815	1	775	76	-2897013190	2887af46-49f2-4069-b8be-843d16cddec7	786	9	parameters	1217848508	t	-1
816	1	497	33	4263671048	04f2ee56-a0aa-4463-8b1e-f699ae946f68	787	6	medium	842744043	t	-1
817	1	787	76	-1609392109	186f802e-d4b0-42f5-97d2-ee539f96f385	788	9	parameters	1217848508	t	-1
818	1	787	76	-2445488102	8233f95d-2864-4667-8051-30e443c7b8b3	789	9	parameters	1217848508	t	-1
819	1	787	76	-3655057400	083ccef2-5f76-4142-bc2b-cd6c151f3604	790	9	parameters	1217848508	t	-1
820	1	787	76	-1357987825	0da17874-e27d-4497-b72b-9d7622341397	791	9	parameters	1217848508	t	-1
821	1	787	76	-1876646419	11687918-a67e-40ce-b3e3-12c1892a6e1d	792	9	parameters	1217848508	t	-1
822	1	787	76	-2200119267	f473f568-cb06-4a79-9cd1-85ed76c7c27e	793	9	parameters	1217848508	t	-1
823	1	787	76	-1838550490	894d0505-a15b-443e-a5aa-6a2a38f7b374	794	9	parameters	1217848508	t	-1
824	1	787	76	-2048092723	35b20313-6d56-45d8-a1c2-029496fb420a	795	9	parameters	1217848508	t	-1
825	1	787	76	-1949945749	67689b45-d66d-419f-b3a4-e1abf362fed0	796	9	parameters	1217848508	t	-1
826	1	787	76	-3176381286	7f65fabb-517e-4483-aa35-00bffa6682ec	797	9	parameters	1217848508	t	-1
827	1	787	76	-1708669127	e920d0ab-1279-4a43-831b-62bcc876bb2d	798	9	parameters	1217848508	t	-1
828	1	787	76	-723292250	0ac94847-feca-4eb5-83c4-22b90b4e76d3	799	9	parameters	1217848508	t	-1
829	1	787	76	-1457450669	5314e051-384b-4574-8018-d6aefd8e9ec4	800	9	parameters	1217848508	t	-1
830	1	787	76	-3080943101	7bad24c3-a772-4759-b0ab-2af114218ba8	801	9	parameters	1217848508	t	-1
831	1	787	76	-668889780	e58d49f8-8279-437e-9423-d3a1bd085887	802	9	parameters	1217848508	t	-1
832	1	787	76	-2635955365	bc1a1198-5fee-40db-b064-68d28987f9c6	803	9	parameters	1217848508	t	-1
833	1	787	76	-573926783	a8d5c1ba-62ac-46ee-91de-c7904e7a1f98	804	9	parameters	1217848508	t	-1
834	1	787	76	-216692562	fd5a6329-88d1-4aae-a6a1-8cbf4ea1c988	805	9	parameters	1217848508	t	-1
835	1	787	76	-3798270232	a393564a-4c16-4461-9cfc-2a0e2e922984	806	9	parameters	1217848508	t	-1
836	1	787	76	-882321334	ca68c79b-c010-49a7-82d1-40fabeb22178	807	9	parameters	1217848508	t	-1
837	1	497	33	479305915	67a8255f-b3ce-4f5b-8fe8-d56d81c21900	808	6	avatar	3795810163	t	-1
838	1	808	76	-2528773330	79981ca0-ac08-42c4-8ae7-cf862c223fd9	809	9	parameters	1217848508	t	-1
839	1	808	76	-1475777755	a5ef046b-af11-4a86-9df1-b335c5d7c776	810	9	parameters	1217848508	t	-1
840	1	808	76	-3076716860	8f0de5a5-f4f0-48bf-927a-7b0f48666c75	811	9	parameters	1217848508	t	-1
841	1	808	76	-704701697	0f01fc28-3723-447f-960e-50e2a2245cd9	812	9	parameters	1217848508	t	-1
842	1	808	76	-2941115885	983d8aa1-56e2-4d8e-bbe9-24765d073706	813	9	parameters	1217848508	t	-1
843	1	808	76	-3003986453	eaa3566d-d205-4649-8bf3-4d0604597d3f	814	9	parameters	1217848508	t	-1
844	1	808	76	-3100566769	bf8fe0d0-e78b-4715-8496-b56a16c10988	815	9	parameters	1217848508	t	-1
845	1	808	76	-1058379705	79a5de84-ec22-41f4-9b69-fa4dbacf97db	816	9	parameters	1217848508	t	-1
846	1	808	76	-823959725	fd18a149-66cb-4061-8136-f48dfd5bb3bc	817	9	parameters	1217848508	t	-1
847	1	808	76	-2291999099	db6a7c68-59e5-4b4d-9b6f-e9898dd2171d	818	9	parameters	1217848508	t	-1
848	1	808	76	-1171305193	69e4f63b-c88d-4526-8274-f82bda57b79c	819	9	parameters	1217848508	t	-1
849	1	808	76	-200994393	c76b4e74-e7fc-4a1d-ad9b-33f2d668331f	820	9	parameters	1217848508	t	-1
850	1	808	76	-2410098511	fa406ea6-5d47-4fa3-9370-fa88f9613277	821	9	parameters	1217848508	t	-1
851	1	808	76	-2897265472	eeb39b2e-3daa-45b4-9308-df781727a959	822	9	parameters	1217848508	t	-1
852	1	808	76	-2939395092	c65619d1-ce4a-467a-af8c-dfc673fd4e3b	823	9	parameters	1217848508	t	-1
853	1	808	76	-700805785	3d568047-1855-4d02-b0d5-00eca0d18f52	824	9	parameters	1217848508	t	-1
854	1	808	76	-2225973956	a027a6a9-5f77-4203-a453-0d4352a46a0a	825	9	parameters	1217848508	t	-1
855	1	808	76	-3921815436	10f2c5ef-5c9a-4016-b1c3-98ee0bab2c99	826	9	parameters	1217848508	t	-1
856	1	808	76	-3457385106	2a87e9da-6c00-4e5c-8351-828e8667fcc1	827	9	parameters	1217848508	t	-1
857	1	808	76	-1924077827	2424b2bd-b0b4-4790-9ab1-d04f0647a9d1	828	9	parameters	1217848508	t	-1
858	1	497	33	424111677	9e2bc198-41c6-4cdd-a712-675bf86edd64	829	6	webpreview	1387062285	t	-1
859	1	829	76	-63372438	91e0686a-d3c5-428a-af9b-934e915db0f8	830	9	parameters	1217848508	t	-1
860	1	829	76	-2582534819	0aa662d1-c59a-4a1e-b950-4fccd0ac575b	831	9	parameters	1217848508	t	-1
861	1	829	76	-2904143826	76e1e777-1164-4a4d-8706-25997aaee715	832	9	parameters	1217848508	t	-1
862	1	829	76	-3118715681	6ac57990-912a-41c9-9a70-5838f19b9ad1	833	9	parameters	1217848508	t	-1
863	1	829	76	-3670035169	29ff1491-714e-457c-a40a-e71206aa426c	834	9	parameters	1217848508	t	-1
864	1	829	76	-2744907036	ef794947-8a09-4322-92ed-7ee9daf0b05d	835	9	parameters	1217848508	t	-1
865	1	829	76	-1173869383	08b26ec9-3cbf-4566-b3df-279d791301fa	836	9	parameters	1217848508	t	-1
866	1	829	76	-3502151350	286787c5-2a09-425d-99c1-18332db32e98	837	9	parameters	1217848508	t	-1
867	1	829	76	-2052250759	2b51fcf3-8c29-47dd-aef4-76f3985c14b3	838	9	parameters	1217848508	t	-1
868	1	829	76	-2091307664	484a2813-83d4-4079-80a7-a526e536c6d4	839	9	parameters	1217848508	t	-1
869	1	829	76	-4019423394	d6576075-ae63-4230-9ee7-59a6ffb623ea	840	9	parameters	1217848508	t	-1
870	1	829	76	-2680414866	5eaae0cd-7514-41a7-8512-be50e68a2162	841	9	parameters	1217848508	t	-1
871	1	497	33	1688393951	7f051ef5-19e8-430d-ba47-17de68ed57f1	842	6	avatar32	3071675098	t	-1
872	1	842	76	-677703942	d7cc2df0-b630-4fdc-a951-10a2af1d1c36	843	9	parameters	1217848508	t	-1
873	1	842	76	-3012111263	a8c742fe-2c57-4525-8428-198297440a08	844	9	parameters	1217848508	t	-1
874	1	842	76	-882013081	77de09b2-5309-47f6-80e3-9aabd00b2757	845	9	parameters	1217848508	t	-1
875	1	842	76	-3853488450	b8d28436-4c0f-46b1-8668-88669780cd68	846	9	parameters	1217848508	t	-1
876	1	842	76	-1109279631	6f87c173-f39c-4982-b8e3-bea4f2da50e0	847	9	parameters	1217848508	t	-1
877	1	842	76	-2279796038	4ee01ff9-909f-46d2-adb3-9498df6303d9	848	9	parameters	1217848508	t	-1
878	1	842	76	-1081511958	6cd71912-ae4e-4095-8683-d17afd77421e	849	9	parameters	1217848508	t	-1
879	1	842	76	-3152676694	3ad9cb63-cf88-41c3-9e2c-60a0a97cd14a	850	9	parameters	1217848508	t	-1
880	1	842	76	-1452462128	0bb22c0e-ae46-4d00-94b4-b80a2d10caef	851	9	parameters	1217848508	t	-1
881	1	842	76	-2673160509	fbb89218-0672-44bc-8abc-6c05386b6a7c	852	9	parameters	1217848508	t	-1
882	1	842	76	-619500998	a2f30301-ca6b-4177-a8d5-89131accf55a	853	9	parameters	1217848508	t	-1
883	1	842	76	-2407707943	4e81ef96-8ab5-4600-bcc3-89b90c2aa91a	854	9	parameters	1217848508	t	-1
884	1	842	76	-486425302	f4dab1cf-07e4-4e04-920e-f53b1f81bfca	855	9	parameters	1217848508	t	-1
885	1	842	76	-3444491305	cb58f02d-73a4-4232-9327-e5a3a65d041e	856	9	parameters	1217848508	t	-1
886	1	842	76	-497162555	7ece9265-9ff4-46df-884c-cffd6c33e472	857	9	parameters	1217848508	t	-1
887	1	842	76	-3581819690	1f55079b-fc8f-4935-b054-961e3931b735	858	9	parameters	1217848508	t	-1
888	1	842	76	-3556966272	d8372b72-8f9a-44aa-96d6-ee30e5065ab0	859	9	parameters	1217848508	t	-1
889	1	842	76	-3521018735	af2fb64a-aed2-4168-8c2e-74ba49e767f8	860	9	parameters	1217848508	t	-1
890	1	842	76	-3592486865	c77406e0-39f6-4411-8cd4-d6655295eda8	861	9	parameters	1217848508	t	-1
891	1	842	76	-3429425424	2e138eef-ce9c-4479-99a6-147798ba44fe	862	9	parameters	1217848508	t	-1
892	1	14	33	2443821992	solr facets space	863	21	facets	1198935629	t	-1
893	1	474	33	3997758973	components	864	6	components	3945296900	t	-1
894	1	864	33	2786798001	page.title.user~admin~dashboard.xml	865	6	page.title.user~admin~dashboard.xml	1369414613	t	-1
895	1	864	33	3900866617	page.full-width-dashlet.user~admin~dashboard.xml	866	6	page.full-width-dashlet.user~admin~dashboard.xml	2343904887	t	-1
896	1	864	33	3671186006	page.component-1-1.user~admin~dashboard.xml	867	6	page.component-1-1.user~admin~dashboard.xml	1185935389	t	-1
897	1	864	33	679884718	page.component-1-2.user~admin~dashboard.xml	868	6	page.component-1-2.user~admin~dashboard.xml	3036159461	t	-1
898	1	864	33	3624918385	page.component-2-1.user~admin~dashboard.xml	869	6	page.component-2-1.user~admin~dashboard.xml	1148319546	t	-1
899	1	864	33	710422665	page.component-2-2.user~admin~dashboard.xml	870	6	page.component-2-2.user~admin~dashboard.xml	3055950530	t	-1
900	1	474	33	544531829	pages	871	6	pages	3167021155	t	-1
901	1	871	33	2375276105	user	872	6	user	882403725	t	-1
902	1	872	33	2282622326	admin	873	6	admin	347996256	t	-1
903	1	873	33	631660036	dashboard.xml	874	6	dashboard.xml	4036615692	t	-1
904	1	473	33	3351621307	avattar-alfresco	875	6	avattar-alfresco	1144212128	t	-1
905	1	477	4	-2050337555	999cb4e0-5183-481d-ad68-d6b995bee00d	876	6	GROUP_site_avattar-alfresco	2015801355	t	-1
906	1	587	92	540640072	72ee4f33070dca0fd01f878c04c2e572	876	6	GROUP_site_avattar-alfresco	2015801355	f	-1
907	1	484	92	540640072	72ee4f33070dca0fd01f878c04c2e572	876	6	GROUP_site_avattar-alfresco	2015801355	f	-1
908	1	477	4	-2547853026	409ccda4-80fb-4dbe-9506-07dd3c4cd216	877	6	GROUP_site_avattar-alfresco_SiteManager	1124376583	t	-1
909	1	587	92	1532531717	9cad04baf51f3ba1325c95b1c29e2f70	877	6	GROUP_site_avattar-alfresco_SiteManager	1124376583	f	-1
910	1	484	92	1532531717	9cad04baf51f3ba1325c95b1c29e2f70	877	6	GROUP_site_avattar-alfresco_SiteManager	1124376583	f	-1
911	1	876	93	1532531717	9cad04baf51f3ba1325c95b1c29e2f70	877	6	GROUP_site_avattar-alfresco_SiteManager	1124376583	f	-1
912	1	477	4	-2104769860	c93f8602-6905-4aeb-894f-f948bf2125e6	878	6	GROUP_site_avattar-alfresco_SiteCollaborator	408414993	t	-1
913	1	587	92	1294856835	3371721f4bd5c451d330c7ba3105cb4d	878	6	GROUP_site_avattar-alfresco_SiteCollaborator	408414993	f	-1
914	1	484	92	1294856835	3371721f4bd5c451d330c7ba3105cb4d	878	6	GROUP_site_avattar-alfresco_SiteCollaborator	408414993	f	-1
915	1	876	93	1294856835	3371721f4bd5c451d330c7ba3105cb4d	878	6	GROUP_site_avattar-alfresco_SiteCollaborator	408414993	f	-1
916	1	477	4	-1668779587	f8cb2ba7-7d04-468c-bd54-90f6a0a196d6	879	6	GROUP_site_avattar-alfresco_SiteContributor	3875887323	t	-1
917	1	587	92	3915629737	25088bcde5dcead03a271a0e8892b092	879	6	GROUP_site_avattar-alfresco_SiteContributor	3875887323	f	-1
918	1	484	92	3915629737	25088bcde5dcead03a271a0e8892b092	879	6	GROUP_site_avattar-alfresco_SiteContributor	3875887323	f	-1
919	1	876	93	3915629737	25088bcde5dcead03a271a0e8892b092	879	6	GROUP_site_avattar-alfresco_SiteContributor	3875887323	f	-1
920	1	477	4	-1988424773	e2ef6b83-80d9-4397-8c8e-4f49b6123a6c	880	6	GROUP_site_avattar-alfresco_SiteConsumer	1547405609	t	-1
921	1	587	92	1819118750	50773562cc2f6ef0cd77a94a2a131609	880	6	GROUP_site_avattar-alfresco_SiteConsumer	1547405609	f	-1
922	1	484	92	1819118750	50773562cc2f6ef0cd77a94a2a131609	880	6	GROUP_site_avattar-alfresco_SiteConsumer	1547405609	f	-1
923	1	876	93	1819118750	50773562cc2f6ef0cd77a94a2a131609	880	6	GROUP_site_avattar-alfresco_SiteConsumer	1547405609	f	-1
924	1	877	93	1525942438	2c4adf2e-1e68-4fe8-be3b-338ffdd0d688	32	6	admin	347996256	f	-1
925	1	875	33	534011694	surf-config	881	6	surf-config	3685774615	t	-1
926	1	881	33	3997758973	components	882	6	components	3945296900	t	-1
927	1	882	33	414477680	page.title.site~avattar-alfresco~dashboard.xml	883	6	page.title.site~avattar-alfresco~dashboard.xml	3165495262	t	-1
928	1	882	33	538931459	page.navigation.site~avattar-alfresco~dashboard~~~	884	6	page.navigation.site~avattar-alfresco~dashboard.xml	452685770	t	-1
929	1	882	33	1004003783	page.component-1-1.site~avattar-alfresco~dashbo~~~	885	6	page.component-1-1.site~avattar-alfresco~dashboard.xml	3599717772	t	-1
930	1	882	33	3897359676	page.component-2-1.site~avattar-alfresco~dashbo~~~	886	6	page.component-2-1.site~avattar-alfresco~dashboard.xml	85215607	t	-1
931	1	882	33	2989343324	page.component-2-2.site~avattar-alfresco~dashbo~~~	887	6	page.component-2-2.site~avattar-alfresco~dashboard.xml	1601533463	t	-1
932	1	881	33	544531829	pages	888	6	pages	3167021155	t	-1
933	1	888	33	1766001124	site	889	6	site	3494426144	t	-1
934	1	889	33	3351621307	avattar-alfresco	890	6	avattar-alfresco	1144212128	t	-1
935	1	890	33	631660036	dashboard.xml	891	6	dashboard.xml	4036615692	t	-1
936	1	875	33	3872509529	documentlibrary	892	6	documentLibrary	202189778	t	-1
937	1	892	33	3167524287	avattar	893	6	Avattar	291043833	t	-1
938	1	893	33	3727685424	avtr.html	894	6	AVTR.html	225427880	t	-1
939	1	10	165	4035512999	e0a2499a-8217-439d-b0c1-9eb385bebefe	895	5	e0a2499a-8217-439d-b0c1-9eb385bebefe	2963613777	t	-1
940	1	895	167	-278035859	8c14f757-5c30-4594-a7a9-871e7ae01c6d	896	5	version-0	3486964613	t	-1
942	1	894	143	-1731775351	543e62b4-20a8-41e7-9958-396f658aa8a9	898	6	doclib	2991633180	t	-1
943	1	893	33	1878710736	compu-06.png	900	6	COMPU-06.png	2588705528	t	-1
944	1	10	165	1265212441	cecbc25a-5e1f-4beb-ac58-7e21bbe7e804	901	5	cecbc25a-5e1f-4beb-ac58-7e21bbe7e804	189120239	t	-1
945	1	901	167	-1633909822	571c13da-6acd-4be6-9336-3c8c8c14c52e	902	5	version-0	3486964613	t	-1
946	1	893	33	39569227	icono-06.png	903	6	ICONO-06.png	4159544419	t	-1
947	1	10	165	3342433232	d2882da6-dbad-4e4a-80f5-ef8380f6f526	904	5	d2882da6-dbad-4e4a-80f5-ef8380f6f526	2266323238	t	-1
948	1	904	167	-3412894489	b70298cc-82ef-4212-ab12-1920fe80889e	905	5	version-0	3486964613	t	-1
949	1	893	33	1470813231	logo-avtr.png	906	6	logo-avtr.png	2190824487	t	-1
950	1	10	165	214895533	053777c9-5ebf-402f-aeff-7e405d3c76dd	907	5	053777c9-5ebf-402f-aeff-7e405d3c76dd	1289955675	t	-1
951	1	907	167	-2668477208	9c2d0d8b-ba53-42ac-8ce4-e8591797faab	908	5	version-0	3486964613	t	-1
952	1	893	33	3063918320	robot-06.png	909	6	ROBOT-06.png	1126823384	t	-1
953	1	10	165	2853115391	89c2308b-2ecc-46f2-8995-f851fa91039f	910	5	89c2308b-2ecc-46f2-8995-f851fa91039f	3928176393	t	-1
954	1	910	167	-4198229771	179bc96b-f3bc-4986-837c-c5005bd52730	911	5	version-0	3486964613	t	-1
\.


--
-- Name: alf_child_assoc_seq; Type: SEQUENCE SET; Schema: public; Owner: alfresco
--

SELECT pg_catalog.setval('alf_child_assoc_seq', 954, true);


--
-- Data for Name: alf_content_data; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY alf_content_data (id, version, content_url_id, content_mimetype_id, content_encoding_id, content_locale_id) FROM stdin;
1	0	1	1	1	2
2	0	2	1	1	2
3	0	3	1	1	2
4	0	4	2	2	2
5	0	5	3	\N	2
6	0	6	2	1	2
7	0	7	2	1	2
8	0	8	2	1	2
9	0	9	2	1	2
10	0	10	2	1	2
11	0	11	2	1	2
12	0	12	2	1	2
13	0	13	2	1	2
14	0	14	2	1	2
15	0	15	2	1	2
16	0	16	2	1	2
17	0	17	2	1	2
18	0	18	2	1	2
19	0	19	2	1	2
20	0	20	2	1	2
21	0	21	2	1	2
22	0	22	2	1	2
23	0	23	2	1	2
24	0	24	2	1	2
25	0	25	2	1	2
26	0	26	2	1	2
27	0	27	2	1	2
28	0	28	2	1	2
29	0	29	2	1	2
30	0	30	2	1	2
31	0	31	2	1	2
32	0	32	2	1	2
33	0	33	2	1	2
34	0	34	2	1	2
35	0	35	2	1	2
36	0	36	2	1	2
37	0	37	2	1	2
38	0	38	2	1	2
39	0	39	2	1	2
40	0	40	2	1	2
41	0	41	4	1	2
42	0	42	4	1	2
43	0	43	4	1	2
44	0	44	4	1	2
45	0	45	4	1	2
46	0	46	4	1	2
47	0	47	3	1	2
48	0	48	3	1	2
49	0	49	3	1	2
50	0	50	3	1	2
51	0	51	4	1	2
52	0	52	2	1	2
53	0	53	1	1	2
54	0	54	2	1	2
55	0	55	2	1	2
56	0	56	2	1	2
57	0	57	4	1	2
58	0	58	2	1	2
59	0	59	1	1	2
60	0	60	2	1	2
61	0	61	2	1	2
62	0	62	2	1	2
63	0	63	4	1	2
64	0	64	2	1	2
65	0	65	1	1	2
66	0	66	2	1	2
67	0	67	3	1	2
68	0	68	2	1	2
69	0	69	2	1	2
70	0	70	2	1	2
71	0	71	2	1	2
72	0	72	2	1	2
73	0	73	2	1	2
74	0	74	2	1	2
75	0	75	2	1	2
76	0	76	2	1	2
77	0	77	2	1	2
78	0	78	2	1	2
79	0	79	2	1	2
80	0	80	2	1	2
81	0	81	2	1	2
82	0	82	2	1	2
83	0	83	2	1	2
84	0	84	2	1	2
85	0	85	2	1	2
86	0	86	2	1	2
87	0	87	2	1	2
88	0	88	2	1	2
89	0	89	2	1	2
90	0	90	2	1	2
91	0	91	2	1	2
92	0	92	2	1	2
93	0	93	2	1	2
94	0	94	2	1	2
95	0	95	2	1	2
96	0	96	2	1	2
97	0	97	2	1	2
98	0	98	2	1	2
99	0	99	2	1	2
100	0	100	2	1	2
101	0	101	2	1	2
102	0	102	2	1	2
103	0	103	2	1	2
104	0	104	2	1	2
105	0	105	2	1	2
106	0	106	2	1	2
107	0	107	2	1	2
108	0	108	2	1	2
109	0	109	2	1	2
110	0	110	2	1	2
111	0	111	2	1	2
112	0	112	2	1	2
113	0	113	2	1	2
114	0	114	2	1	2
115	0	115	2	1	2
116	0	116	2	1	2
117	0	117	2	1	2
118	0	118	2	1	2
119	0	119	2	1	2
120	0	120	2	1	2
121	0	121	2	1	2
122	0	122	2	1	2
123	0	123	2	1	2
124	0	124	2	1	2
125	0	125	2	1	2
126	0	126	2	1	2
127	0	127	2	1	2
128	0	128	2	1	2
129	0	129	2	1	2
130	0	130	2	1	2
131	0	131	2	1	2
132	0	132	2	1	2
133	0	133	2	1	2
134	0	134	2	1	2
135	0	135	2	1	2
136	0	136	2	1	2
137	0	137	2	1	2
138	0	138	2	1	2
139	0	139	2	1	2
140	0	140	2	1	2
141	0	141	2	1	2
142	0	142	2	1	2
143	0	143	5	\N	2
144	0	\N	\N	\N	2
145	0	144	4	1	2
146	0	145	2	1	2
147	0	146	6	1	2
148	0	147	7	1	2
149	0	148	8	1	2
150	0	149	2	1	2
151	0	150	6	1	2
152	0	151	7	1	2
153	0	152	8	1	2
154	0	153	2	1	2
155	0	154	2	1	2
156	0	155	9	1	2
157	0	155	9	1	2
158	0	157	8	1	2
159	0	158	10	1	2
160	0	159	7	1	2
161	0	160	8	1	2
162	0	161	7	1	2
163	0	162	8	1	2
164	0	163	7	1	2
165	0	164	8	1	2
166	0	165	8	1	2
167	0	166	7	1	2
168	0	167	8	1	2
169	0	168	7	1	2
170	0	169	8	1	2
171	0	170	7	1	2
172	0	171	8	1	2
173	0	172	7	1	2
174	0	173	8	1	2
175	0	174	7	1	2
176	0	175	8	1	2
177	0	176	8	1	2
178	0	177	8	1	2
179	0	178	8	1	2
180	0	179	8	1	2
181	0	180	8	1	2
182	0	181	8	1	2
183	0	182	8	1	2
184	0	183	8	1	2
185	0	184	8	1	2
186	0	185	8	1	2
187	0	186	8	1	2
188	0	187	8	1	2
189	0	188	8	1	2
190	0	189	8	1	2
191	0	190	8	1	2
192	0	191	8	1	2
193	0	192	8	1	2
194	0	193	8	1	2
195	0	194	11	1	2
196	0	195	8	1	2
197	0	196	8	1	2
198	0	197	8	1	2
199	0	198	8	1	2
200	0	199	12	1	2
201	0	200	8	1	2
202	0	201	10	1	2
203	0	202	3	1	2
204	0	203	13	1	2
205	0	204	8	1	2
206	0	205	10	1	2
207	0	206	13	1	2
208	0	207	8	1	2
209	0	208	10	1	2
210	0	209	13	1	2
211	0	210	8	1	2
212	0	211	10	1	2
213	0	212	14	1	2
214	0	213	8	1	2
215	0	214	10	1	2
216	0	215	14	1	2
217	0	216	8	1	2
218	0	217	10	1	2
219	0	218	3	1	2
220	0	219	3	1	2
221	0	220	3	1	2
222	0	220	3	1	2
223	0	222	3	1	2
224	0	222	3	1	2
225	0	224	3	1	2
226	0	224	3	1	2
227	0	226	3	1	2
228	0	227	3	1	2
229	0	228	3	1	2
230	0	229	3	1	2
231	0	230	3	1	2
232	0	231	3	1	2
233	0	232	1	3	2
234	0	233	1	3	2
235	0	234	1	3	2
236	0	235	1	3	2
237	0	236	1	3	2
238	0	237	1	3	2
239	0	238	1	3	2
240	0	239	1	3	2
241	0	240	1	3	2
242	0	241	1	3	2
250	0	249	1	1	2
251	0	250	1	1	2
252	0	251	1	1	2
253	0	252	1	1	2
254	0	253	1	1	2
255	0	254	1	1	2
256	0	255	1	1	2
257	0	256	1	1	2
258	0	257	1	1	2
259	0	258	1	1	2
260	0	259	1	1	2
261	0	260	1	1	2
262	0	261	1	1	2
266	0	265	2	1	2
268	0	266	3	1	2
269	0	266	3	1	2
271	0	268	8	1	2
273	0	270	8	1	2
274	0	270	8	1	2
276	0	272	8	1	2
277	0	272	8	1	2
279	0	274	8	1	2
280	0	274	8	1	2
282	0	276	8	1	2
283	0	276	8	1	2
\.


--
-- Name: alf_content_data_seq; Type: SEQUENCE SET; Schema: public; Owner: alfresco
--

SELECT pg_catalog.setval('alf_content_data_seq', 283, true);


--
-- Data for Name: alf_content_url; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY alf_content_url (id, content_url, content_url_short, content_url_crc, content_size, orphan_time) FROM stdin;
1	store://2022/1/19/22/30/811869db-3c32-4c61-b940-5c9d3af0eb3f.bin	3af0eb3f.bin	3319486876	1026	\N
2	store://2022/1/19/22/30/e2a1584e-9fbc-48bc-8ec4-677758e7e65c.bin	58e7e65c.bin	3071257864	3845	\N
3	store://2022/1/19/22/30/3678cf8f-00f3-4541-9d20-ff7457628c2a.bin	57628c2a.bin	2035739735	6083	\N
4	store://2022/1/19/22/30/9a58920c-3a69-44c0-8bcb-22c717cf33fd.bin	17cf33fd.bin	3458939983	370	\N
5	store://2022/1/19/22/30/d703463d-d5d6-494b-bf0d-4ea709cc01a2.bin	09cc01a2.bin	4216934519	549	\N
6	store://2022/1/19/22/30/037fb142-5b85-4535-b15f-38acf1fb47d3.bin	f1fb47d3.bin	1031076019	2625	\N
7	store://2022/1/19/22/30/b6071988-38db-4b36-b33c-fb18387a4d27.bin	387a4d27.bin	3011619419	555	\N
8	store://2022/1/19/22/30/c19b81f2-e530-465e-b915-ea92f0ddf1b6.bin	f0ddf1b6.bin	882328968	923	\N
9	store://2022/1/19/22/30/0a747068-f790-4e0b-a13a-5e0008eeca64.bin	08eeca64.bin	1468538890	690	\N
10	store://2022/1/19/22/30/33aaf63f-813e-4a6a-b4b7-87ab1c806bf9.bin	1c806bf9.bin	1985571745	715	\N
11	store://2022/1/19/22/30/0ce1b5ea-9d8f-4e60-ad5c-aa6d85202e5d.bin	85202e5d.bin	967397813	643	\N
12	store://2022/1/19/22/30/34185909-2a80-48a2-bef3-b288c6fa6ee6.bin	c6fa6ee6.bin	3827769684	1106	\N
13	store://2022/1/19/22/30/0459080d-19aa-4dab-8f05-3251a43f7c1b.bin	a43f7c1b.bin	4145948896	1963	\N
14	store://2022/1/19/22/30/ffa3f1ed-281b-4364-8688-eab3dde89531.bin	dde89531.bin	3927737054	641	\N
15	store://2022/1/19/22/30/47805e71-5561-4c0f-a038-1a629b71be0a.bin	9b71be0a.bin	1377695307	3500	\N
16	store://2022/1/19/22/30/4b3344cc-67f0-4093-82db-267a4973b4fb.bin	4973b4fb.bin	775114053	909	\N
17	store://2022/1/19/22/30/bfb56047-cc6e-4c62-ac68-41def80d8c66.bin	f80d8c66.bin	4109561942	489	\N
18	store://2022/1/19/22/30/b116fe71-c3d4-4bb8-9aaf-e929710b51f5.bin	710b51f5.bin	1902514539	539	\N
19	store://2022/1/19/22/30/92110526-e412-4112-b2b3-5d89f2e6972c.bin	f2e6972c.bin	3285006990	9132	\N
20	store://2022/1/19/22/30/427e2237-9654-4fe8-8e7d-732d43b5f3ad.bin	43b5f3ad.bin	1308670977	9140	\N
21	store://2022/1/19/22/30/3043a74b-b1e9-4dce-8c11-54e4394a319f.bin	394a319f.bin	1557832837	9148	\N
22	store://2022/1/19/22/30/c1cb28b5-7a14-4e82-8c90-f0ff059951be.bin	059951be.bin	2665305707	9150	\N
23	store://2022/1/19/22/30/1f36b312-baf1-4119-a0c4-ea58fc32e2fd.bin	fc32e2fd.bin	3228186109	9134	\N
24	store://2022/1/19/22/30/ba43e119-dcfe-45fa-98cb-c1cb785058af.bin	785058af.bin	3260043847	9165	\N
25	store://2022/1/19/22/30/6fe9a25b-e899-4cea-9bc2-867ebe671c57.bin	be671c57.bin	3268784754	9125	\N
26	store://2022/1/19/22/30/783cf028-fda0-43f4-a40a-610ea42a0027.bin	a42a0027.bin	4006913420	3701	\N
27	store://2022/1/19/22/30/3d8f6030-2aa4-4742-ab37-ac609b79524b.bin	9b79524b.bin	3651239727	3721	\N
28	store://2022/1/19/22/30/7aa5d42e-6a8f-468f-a2da-44175e757654.bin	5e757654.bin	511523653	3717	\N
29	store://2022/1/19/22/30/36fb1b9a-60b0-43e8-aaf0-52316b210722.bin	6b210722.bin	1264239517	3708	\N
30	store://2022/1/19/22/30/5496632d-494d-48b0-a1b7-273b29026925.bin	29026925.bin	4063919795	3701	\N
31	store://2022/1/19/22/30/5c9e0dae-6bc0-4e40-8d2c-461fd8750df6.bin	d8750df6.bin	3987446005	3783	\N
32	store://2022/1/19/22/30/cd4a2995-30c7-4d93-9a76-7be45d2682f1.bin	5d2682f1.bin	3836052993	3700	\N
33	store://2022/1/19/22/30/92cb87dd-d893-43d8-9628-bdee99091221.bin	99091221.bin	4025399731	10436	\N
34	store://2022/1/19/22/30/496c6933-8459-4054-b2bf-3c08e45b2903.bin	e45b2903.bin	1310095858	10711	\N
35	store://2022/1/19/22/30/d2589190-7566-4878-9ff9-fcbe82420e91.bin	82420e91.bin	960762994	10656	\N
36	store://2022/1/19/22/30/1e595c9b-2cae-404b-8a00-d1813956a476.bin	3956a476.bin	3374578648	10658	\N
37	store://2022/1/19/22/30/afe226fd-bcc3-4f6f-b0a9-a93c31c1a77d.bin	31c1a77d.bin	2254966302	10677	\N
38	store://2022/1/19/22/30/6c02cbd2-20fd-4bc9-a956-ee8e34a59135.bin	34a59135.bin	3677965554	10744	\N
39	store://2022/1/19/22/30/402f8b96-199f-4fbf-a9ff-17632b88732f.bin	2b88732f.bin	927354	10497	\N
40	store://2022/1/19/22/30/1ed72aba-856b-49ba-8b98-f4b3f16c68d8.bin	f16c68d8.bin	4234054856	1859	\N
41	store://2022/1/19/22/30/9997a51e-951a-4f78-901b-b94d77fb23b9.bin	77fb23b9.bin	2909264574	596	\N
42	store://2022/1/19/22/30/0c6cac65-fc23-4fd4-bc3d-49fb19d67f46.bin	19d67f46.bin	182910960	2271	\N
43	store://2022/1/19/22/30/8deaf2e1-3461-4ca3-ab9b-b650d3cdd3d9.bin	d3cdd3d9.bin	929560806	1061	\N
44	store://2022/1/19/22/30/70fdbeda-df6a-4305-9d46-b00876ad69d8.bin	76ad69d8.bin	934273601	341	\N
45	store://2022/1/19/22/30/48494ab0-c91e-46ce-a4a6-9fdb4fdf7477.bin	4fdf7477.bin	2750934569	535	\N
46	store://2022/1/19/22/30/94ecbe37-a45b-48f9-af07-331548cc4154.bin	48cc4154.bin	3453141419	118	\N
47	store://2022/1/19/22/30/d9d4561b-6c3c-4115-8309-afdc99b483c0.bin	99b483c0.bin	1400996953	1349	\N
48	store://2022/1/19/22/30/eb31ce7c-6a95-4fa1-a141-67c884ce8462.bin	84ce8462.bin	2109171227	1252	\N
49	store://2022/1/19/22/30/052f35d2-5b6a-47f3-9ce3-ff901824419b.bin	1824419b.bin	2643364376	1252	\N
50	store://2022/1/19/22/30/c70643d1-9ecc-42b0-be2f-3d4e125d4bf2.bin	125d4bf2.bin	3814547331	1252	\N
51	store://2022/1/19/22/30/218f3ab0-adde-4aa5-bd21-b7dfffd7971e.bin	ffd7971e.bin	2932992184	314	\N
52	store://2022/1/19/22/30/06169fba-46d8-4621-aafd-f4ca999683da.bin	999683da.bin	523426313	878	\N
53	store://2022/1/19/22/30/f6abc3c1-b4d0-489c-bce1-85a2d16c3e36.bin	d16c3e36.bin	3192376247	543	\N
54	store://2022/1/19/22/30/f6903543-c5ec-4387-958f-ded9dc58eb69.bin	dc58eb69.bin	4215374691	469	\N
55	store://2022/1/19/22/30/e81ef079-58e7-4b52-b68b-619389e38251.bin	89e38251.bin	1251377966	55	\N
56	store://2022/1/19/22/30/a364ebd9-3174-40c0-a9e9-bcef2c91c8c9.bin	2c91c8c9.bin	1553728832	235	\N
57	store://2022/1/19/22/30/53e1cbe4-b9b6-4760-9368-419aa2a1f68c.bin	a2a1f68c.bin	4112997274	441	\N
58	store://2022/1/19/22/30/a9776f10-50bd-44d5-855b-ea72e8570ab0.bin	e8570ab0.bin	4251707643	885	\N
59	store://2022/1/19/22/30/b31d8075-aea4-496f-bf61-ac9a8f778f4b.bin	8f778f4b.bin	3214477183	369	\N
60	store://2022/1/19/22/30/64afa93a-6795-43e1-8161-4017a2a5802d.bin	a2a5802d.bin	897131959	476	\N
61	store://2022/1/19/22/30/57c7fdca-2761-4933-9bf8-0a031270504a.bin	1270504a.bin	397928776	55	\N
62	store://2022/1/19/22/30/00b9505a-6255-4ef0-a3d4-542247f0fced.bin	47f0fced.bin	604745940	235	\N
63	store://2022/1/19/22/30/e1b55b66-1ea0-4c84-a22e-02e1ea12f10e.bin	ea12f10e.bin	3560401169	334	\N
64	store://2022/1/19/22/30/4d6ca968-8756-4fba-b1ec-e57ca90b096f.bin	a90b096f.bin	3484449307	1199	\N
65	store://2022/1/19/22/30/1705c284-9e18-4af3-8f6d-432418bba09f.bin	18bba09f.bin	4091118453	347	\N
66	store://2022/1/19/22/30/6646a2fb-68d8-4b8c-a8aa-61ecd54bb08d.bin	d54bb08d.bin	1457369947	904	\N
67	store://2022/1/19/22/30/b9b7f40a-19c9-442f-9bec-306f19297494.bin	19297494.bin	1299133142	1116	\N
68	store://2022/1/19/22/30/a88fe1d2-7700-4448-9adb-7f430e354369.bin	0e354369.bin	2668410335	735	\N
69	store://2022/1/19/22/30/2fee5e88-264b-45e3-9032-8733e9b4528d.bin	e9b4528d.bin	1827313669	2294	\N
70	store://2022/1/19/22/30/05f3923e-59d0-4d66-9c5a-f485563ed3bd.bin	563ed3bd.bin	2306436043	5093	\N
71	store://2022/1/19/22/30/4f8895eb-f01c-48db-ad5a-f48c955ab6f3.bin	955ab6f3.bin	1426449149	5196	\N
72	store://2022/1/19/22/30/a5cc6ddd-96fd-4049-bf9c-f8e1924b856a.bin	924b856a.bin	2519533569	5155	\N
73	store://2022/1/19/22/30/13852a6a-7424-44e0-849c-54659a7a0da6.bin	9a7a0da6.bin	2197397009	5144	\N
74	store://2022/1/19/22/30/e303f83f-39b3-4021-b34c-9934f474c945.bin	f474c945.bin	3616423095	5171	\N
75	store://2022/1/19/22/30/efd72888-d9a3-43fb-b2be-2e108321831a.bin	8321831a.bin	1987261648	5361	\N
76	store://2022/1/19/22/30/984ac49e-ccca-432d-b2bd-146c8b181130.bin	8b181130.bin	2257034554	5086	\N
77	store://2022/1/19/22/30/2ab6f170-d55d-4ddd-b06d-a04354e1790a.bin	54e1790a.bin	524657923	6069	\N
78	store://2022/1/19/22/30/eae90dbe-8941-42ec-b392-3b717d342a6f.bin	7d342a6f.bin	3254418576	6180	\N
79	store://2022/1/19/22/30/a7254c8c-5aec-4fec-8da4-14265dad074b.bin	5dad074b.bin	111913271	6120	\N
80	store://2022/1/19/22/30/c4323cf5-1a5d-4ea9-a322-f5b678cb4623.bin	78cb4623.bin	2541444169	6144	\N
81	store://2022/1/19/22/30/7300dfb2-7a2c-45ed-a505-e7195414886a.bin	5414886a.bin	92829003	6156	\N
82	store://2022/1/19/22/30/83161b40-6186-4de1-a019-bdf95b1bd0c0.bin	5b1bd0c0.bin	3509907709	6333	\N
83	store://2022/1/19/22/30/3eea9b0e-ae9d-486d-9b7d-17532fbe9f57.bin	2fbe9f57.bin	3487399298	6125	\N
84	store://2022/1/19/22/30/470ca8c2-5e11-4d10-8e22-e51213511629.bin	13511629.bin	1879067917	5321	\N
85	store://2022/1/19/22/30/f9e92027-357a-40b4-aa1d-a29025c1f255.bin	25c1f255.bin	1857353369	5301	\N
86	store://2022/1/19/22/30/9f9c7325-0c5e-40a7-a935-3251455ad9ab.bin	455ad9ab.bin	2684643870	5301	\N
87	store://2022/1/19/22/30/ed605dd5-a653-4783-b98f-7976828bcc4e.bin	828bcc4e.bin	3134821209	5301	\N
88	store://2022/1/19/22/30/a584a31b-63f3-46ce-a359-1bb2ef3688e5.bin	ef3688e5.bin	3901689750	5301	\N
89	store://2022/1/19/22/30/2eb8bfb8-f62d-412c-a30b-e6ff462d664a.bin	462d664a.bin	2224239110	5301	\N
90	store://2022/1/19/22/30/e2f814cf-2cb9-4916-95dc-e675099319e2.bin	099319e2.bin	3187740229	5301	\N
91	store://2022/1/19/22/30/f47b17cd-83d1-4bae-a2a4-0f97b0990f6b.bin	b0990f6b.bin	3346674641	4572	\N
92	store://2022/1/19/22/30/a6bc0cf3-48d3-4100-aa21-6e71d4d83293.bin	d4d83293.bin	834957948	4120	\N
93	store://2022/1/19/22/30/f2436a1b-b8cb-475d-9908-16fd76e371f4.bin	76e371f4.bin	2721432934	4225	\N
94	store://2022/1/19/22/30/3c74612d-5202-42e4-b60e-830a48345ca5.bin	48345ca5.bin	2868092452	4210	\N
95	store://2022/1/19/22/30/0bf41c14-6423-43b2-95ac-af450d23654d.bin	0d23654d.bin	1673348268	4205	\N
96	store://2022/1/19/22/30/2f65a7f4-9e3a-4c64-bf91-fd67cc5091ba.bin	cc5091ba.bin	411572357	4213	\N
97	store://2022/1/19/22/30/19eb4934-c492-4cc0-847a-5515e9581d33.bin	e9581d33.bin	4144042342	4355	\N
98	store://2022/1/19/22/30/ef7582e7-16ad-4d18-a950-76ce2fbdfd85.bin	2fbdfd85.bin	1168850087	4060	\N
99	store://2022/1/19/22/30/a1be7d94-0746-4c7e-9e70-434c8e18eaf6.bin	8e18eaf6.bin	401294530	1067	\N
100	store://2022/1/19/22/30/c2552284-026c-4066-87f2-c2b4fa74238b.bin	fa74238b.bin	1823082431	1101	\N
101	store://2022/1/19/22/30/854a4808-28c2-4633-843e-b04c45009996.bin	45009996.bin	4220419313	3144	\N
102	store://2022/1/19/22/30/f8feaed1-c152-4923-b566-5bc6fa8e9b10.bin	fa8e9b10.bin	4156112185	3442	\N
103	store://2022/1/19/22/30/ad8de88d-f8ad-49d1-a730-9e6f66ee4e94.bin	66ee4e94.bin	524030942	1091	\N
104	store://2022/1/19/22/30/3cfc4b55-45dd-4855-a398-729021de0a88.bin	21de0a88.bin	794259490	1121	\N
105	store://2022/1/19/22/30/9ac2c067-b6c2-4442-8c90-fb971e1b98f8.bin	1e1b98f8.bin	538806774	3086	\N
106	store://2022/1/19/22/30/f85f4163-5ee0-41df-913c-f98e2b7b13b1.bin	2b7b13b1.bin	2359953474	3462	\N
107	store://2022/1/19/22/30/627dc34e-8966-4758-b931-1eaa9ede727c.bin	9ede727c.bin	489525373	1121	\N
108	store://2022/1/19/22/30/2591d7bd-0fda-4a13-a73c-2154dc8e797d.bin	dc8e797d.bin	1787323020	1157	\N
109	store://2022/1/19/22/30/e07b35d3-22b0-4478-9ecd-516cc6a7c06f.bin	c6a7c06f.bin	928300016	3106	\N
110	store://2022/1/19/22/30/888a01ec-67cc-458c-9ca6-94a16754748f.bin	6754748f.bin	2033124352	3480	\N
111	store://2022/1/19/22/30/c743ec93-e57e-467c-a675-8f8527d7bd5d.bin	27d7bd5d.bin	875853061	1133	\N
112	store://2022/1/19/22/30/7952b382-7c42-495e-924f-ac25c584f50a.bin	c584f50a.bin	3850588523	1169	\N
113	store://2022/1/19/22/30/dd3f431b-44a8-49cf-a9d8-58c33aaf1dcb.bin	3aaf1dcb.bin	1434887870	3111	\N
114	store://2022/1/19/22/30/ac232492-0eb4-4a96-b59c-7d8853320e1a.bin	53320e1a.bin	1968317639	3490	\N
115	store://2022/1/19/22/30/5bd4bb45-8702-4566-a3e3-4866aea187c9.bin	aea187c9.bin	197110215	1123	\N
116	store://2022/1/19/22/30/5180b314-7215-49c3-9773-bb420a8086a2.bin	0a8086a2.bin	833800722	1161	\N
117	store://2022/1/19/22/30/b07d7d2e-a45c-4906-bf2c-767d7c79e649.bin	7c79e649.bin	2458288984	3101	\N
118	store://2022/1/19/22/30/19344f85-46f1-4361-914b-4b8f34a0a952.bin	34a0a952.bin	1147332807	3479	\N
119	store://2022/1/19/22/30/2e2bf9eb-e473-4015-9238-e0564bc508a1.bin	4bc508a1.bin	2347217452	1138	\N
120	store://2022/1/19/22/30/541a7973-6fab-4cc4-a808-b16f95594a76.bin	95594a76.bin	4148371646	1168	\N
121	store://2022/1/19/22/30/7a96ab6e-f2a5-4e8c-a387-55e76d2cee4b.bin	6d2cee4b.bin	747076625	3149	\N
122	store://2022/1/19/22/30/957c1ae1-5beb-40ed-aff9-9f7cf7d685ab.bin	f7d685ab.bin	1428380823	3521	\N
123	store://2022/1/19/22/30/ff1b7a7d-9746-483d-b0d7-5da3074d8281.bin	074d8281.bin	1372378613	1097	\N
124	store://2022/1/19/22/30/9c01e06a-64ff-49de-9bda-ae8837a5142e.bin	37a5142e.bin	2023425471	1134	\N
125	store://2022/1/19/22/30/aae084c1-94ae-4909-a0a4-a0ce8e6366d4.bin	8e6366d4.bin	746570206	3100	\N
126	store://2022/1/19/22/30/c0b7085d-3ddc-4e05-bcfa-5e4ce93d2613.bin	e93d2613.bin	2990395940	3477	\N
127	store://2022/1/19/22/30/b62bf43e-b0b2-4f39-811a-a559882bda73.bin	882bda73.bin	3963360677	1068	\N
128	store://2022/1/19/22/30/63e9e7a3-7f2e-4876-b6f6-dce830f95cf8.bin	30f95cf8.bin	3985871686	1099	\N
129	store://2022/1/19/22/30/3941cf5a-dd88-4fac-8716-469a9834ee13.bin	9834ee13.bin	3138088261	3080	\N
130	store://2022/1/19/22/30/e84dceee-a732-40b3-bffd-64b829311e8d.bin	29311e8d.bin	3248240337	3458	\N
131	store://2022/1/19/22/30/cde11f55-9c8f-4e4d-930b-9a3dba4beab4.bin	ba4beab4.bin	2750453737	1107	\N
132	store://2022/1/19/22/30/f53a8b13-ae02-4601-8931-4f9a3d4a19ab.bin	3d4a19ab.bin	884729912	1143	\N
133	store://2022/1/19/22/30/9cda9ce9-d5ff-4b1d-9750-3a35c049f93e.bin	c049f93e.bin	2494594464	3098	\N
134	store://2022/1/19/22/30/b54fb6d8-a41f-4d63-8221-3ebc48d4f2ef.bin	48d4f2ef.bin	1476441983	3472	\N
135	store://2022/1/19/22/30/33500dcd-52b3-4faf-b50d-fc26c67a7836.bin	c67a7836.bin	420393296	1277	\N
136	store://2022/1/19/22/30/6e7636cd-4502-415f-bbd0-3f72c28a3d1c.bin	c28a3d1c.bin	3435482977	1330	\N
137	store://2022/1/19/22/30/353bd3e8-735e-40b8-932b-2e8fa566089a.bin	a566089a.bin	222176744	3262	\N
138	store://2022/1/19/22/30/9c93697a-a3aa-4542-aee8-53d9e62da98e.bin	e62da98e.bin	1775762475	3631	\N
139	store://2022/1/19/22/30/c70417f3-56f4-463a-a5b4-7b24f15995d6.bin	f15995d6.bin	2394534461	1077	\N
140	store://2022/1/19/22/30/73738e68-d094-4046-b4be-28a00a6a4b2d.bin	0a6a4b2d.bin	1628440048	1106	\N
141	store://2022/1/19/22/30/673139d1-825b-4426-96a1-a2de8525bcee.bin	8525bcee.bin	395165784	3101	\N
142	store://2022/1/19/22/30/bfec876a-150c-46c6-86d4-de1898870844.bin	98870844.bin	2432205787	3576	\N
143	store://2022/1/19/22/30/7928d4f1-3aa9-4f37-a6e3-e7671e7e4eb7.bin	1e7e4eb7.bin	1499632202	9453	\N
144	store://2022/1/19/22/31/c4e1c946-5f0e-4a02-ad67-de194333cfbc.bin	4333cfbc.bin	3445126872	1490	\N
145	store://2022/1/19/22/31/df70bc04-d2ea-4b47-9a09-4ffcff74367d.bin	ff74367d.bin	2494798752	709	\N
146	store://2022/1/19/22/31/1fe12957-2348-40c1-b662-ba1d99f33a0e.bin	99f33a0e.bin	285471136	55	\N
147	store://2022/1/19/22/31/683bb18b-5996-4906-a9f1-267565ebb71e.bin	65ebb71e.bin	2604554326	2347	\N
148	store://2022/1/19/22/31/c6ee82b8-7cfd-4299-9355-b8f1d74c4871.bin	d74c4871.bin	1713871869	6573	\N
149	store://2022/1/19/22/31/1c78bc18-1acc-4587-a804-2bd5bed69a14.bin	bed69a14.bin	3426385553	817	\N
150	store://2022/1/19/22/31/bf379ed7-4f6a-444e-92dc-2855ca5ce533.bin	ca5ce533.bin	188927471	54	\N
151	store://2022/1/19/22/31/ba4b1eb7-9832-403c-bf34-2606c5fc141b.bin	c5fc141b.bin	3446733416	2823	\N
152	store://2022/1/19/22/31/33d8eba3-3c89-4f95-b760-b99ac12d5081.bin	c12d5081.bin	1789928533	8910	\N
153	store://2022/1/19/22/31/ab6a775d-76b1-40d9-b329-c008f0c68b08.bin	f0c68b08.bin	3539211033	0	\N
154	store://2022/1/19/22/31/1dbaf0e0-37ef-44ae-b3ba-7a3502fb65f2.bin	02fb65f2.bin	846030337	0	\N
155	store://2022/1/19/22/31/cf329e44-f213-49ad-8331-6b4a1a1edfbc.bin	1a1edfbc.bin	2237889134	381778	\N
157	store://2022/1/19/22/31/f0b05fd6-9981-4288-ad11-b85d6b4441e8.bin	6b4441e8.bin	2611877233	3526	\N
158	store://2022/1/19/22/31/7f8b1d5b-6398-4bb3-9023-2afdabb172e7.bin	abb172e7.bin	2119367340	87522	\N
159	store://2022/1/19/22/31/876a9e94-a6b5-4ffd-a046-a6cdadb686b3.bin	adb686b3.bin	2566584033	501641	\N
160	store://2022/1/19/22/31/8363b568-ceff-4344-baef-3c55adf2b0a7.bin	adf2b0a7.bin	3438856346	17951	\N
161	store://2022/1/19/22/31/99c99bae-bd16-4dd5-a877-631006c7e2b7.bin	06c7e2b7.bin	4233336818	342155	\N
162	store://2022/1/19/22/31/b982bd21-2775-4aaa-9af6-3736e7a9217b.bin	e7a9217b.bin	2951267097	19847	\N
163	store://2022/1/19/22/31/e11fe7b2-e04e-45ee-b50a-ea6abdea73c5.bin	bdea73c5.bin	4292705257	145863	\N
164	store://2022/1/19/22/31/5a3dd3f3-6634-43fe-8338-6bd204e52101.bin	04e52101.bin	1844805484	33644	\N
165	store://2022/1/19/22/31/9c018e42-e76d-4e49-b322-7ef3a7221be4.bin	a7221be4.bin	3264216213	266338	\N
166	store://2022/1/19/22/31/7ccaa7e1-c410-4b17-ba79-35107fb6992e.bin	7fb6992e.bin	2981173511	540412	\N
167	store://2022/1/19/22/31/0b9e5155-ba1d-4f10-8073-ee6e8fde74a6.bin	8fde74a6.bin	127231788	39387	\N
168	store://2022/1/19/22/31/70327ec1-a82c-4347-9d58-3405c0cbd0eb.bin	c0cbd0eb.bin	2167382185	105685	\N
169	store://2022/1/19/22/31/a7205931-4420-4d5a-a2b1-7dc5c98cf07c.bin	c98cf07c.bin	2465035782	22473	\N
170	store://2022/1/19/22/31/03b56b21-cb94-4799-9b40-435d5bf63275.bin	5bf63275.bin	899225872	165798	\N
171	store://2022/1/19/22/31/dfb3b01b-e0ec-45a2-803e-dd29c9e5132f.bin	c9e5132f.bin	1413846018	32865	\N
172	store://2022/1/19/22/31/c9776a02-9d39-41ca-954a-a85817d540f2.bin	17d540f2.bin	2744799395	64724	\N
173	store://2022/1/19/22/31/853290ca-82f0-47ae-849d-cd2fda4d1795.bin	da4d1795.bin	2787718092	40385	\N
174	store://2022/1/19/22/31/06f02dcc-b98c-4e32-b489-c6eb5dee6ec8.bin	5dee6ec8.bin	2356122768	37453	\N
175	store://2022/1/19/22/31/f974a1d8-dbb7-4b2d-a4d1-ea9c7650e274.bin	7650e274.bin	245515065	13516	\N
176	store://2022/1/19/22/31/bf1baa96-f30c-4309-b178-ce4158e4e925.bin	58e4e925.bin	4113101970	146544	\N
177	store://2022/1/19/22/31/a95532c9-f472-488f-9390-682e2400bae7.bin	2400bae7.bin	1617770398	6016	\N
178	store://2022/1/19/22/31/bf5816a4-95b9-4964-831c-14ab887b93a6.bin	887b93a6.bin	1247832737	679602	\N
179	store://2022/1/19/22/31/e890de3c-e5a5-44fe-8c6b-a22ecd5bba8b.bin	cd5bba8b.bin	1609333421	11610	\N
180	store://2022/1/19/22/31/0896c93f-ac9a-4fe4-b85f-87d93cad69a8.bin	3cad69a8.bin	140562859	172648	\N
181	store://2022/1/19/22/31/811960a9-001a-45fb-ad0e-d69b0556d0c9.bin	0556d0c9.bin	3959545270	9680	\N
182	store://2022/1/19/22/31/aa7ac67f-4874-4ee8-be19-8964e075989c.bin	e075989c.bin	3803618080	34482	\N
183	store://2022/1/19/22/31/dc2f5ce7-d5ef-4018-9256-a312b0997353.bin	b0997353.bin	2721961719	4213	\N
184	store://2022/1/19/22/31/95844fa2-a29e-47cf-a445-dcf55edd0181.bin	5edd0181.bin	2536815010	90797	\N
185	store://2022/1/19/22/31/9a8c9b07-57bd-4a1d-b5cd-0d36b7729f24.bin	b7729f24.bin	3939634385	12701	\N
186	store://2022/1/19/22/31/f8321929-ec53-419a-a8da-e2900f778826.bin	0f778826.bin	1491018685	188533	\N
187	store://2022/1/19/22/31/6ed2313e-9694-4fdb-a3ce-f06f0db93a6f.bin	0db93a6f.bin	2099251102	9025	\N
188	store://2022/1/19/22/31/a42dd518-8cee-437b-ab1d-d196994cf54a.bin	994cf54a.bin	1180066046	375396	\N
189	store://2022/1/19/22/31/733a470c-d896-4ac8-b2a9-4f268988c7e1.bin	8988c7e1.bin	1686655201	12288	\N
190	store://2022/1/19/22/31/7e062d14-a49a-42a7-ab0a-3215a5d825a0.bin	a5d825a0.bin	602199532	155620	\N
191	store://2022/1/19/22/31/42f90a5b-2f92-4b58-aafd-3f919d46317f.bin	9d46317f.bin	3389296866	350217	\N
192	store://2022/1/19/22/31/888b4f4a-d78f-4b3d-9cfd-01168b13cd32.bin	8b13cd32.bin	2388441297	14569	\N
193	store://2022/1/19/22/31/cf09fabc-db21-44b9-a81d-15465b735d5c.bin	5b735d5c.bin	2564469058	196506	\N
194	store://2022/1/19/22/31/0be3b174-2042-45e3-ac74-91f361d447e7.bin	61d447e7.bin	1275624223	3737049	\N
195	store://2022/1/19/22/31/0fc3af94-88e8-4002-960c-7aada19158ca.bin	a19158ca.bin	2497788825	212734	\N
196	store://2022/1/19/22/31/553b507d-b9f4-4ce4-92cb-95543dba2656.bin	3dba2656.bin	3886721873	6217	\N
197	store://2022/1/19/22/31/f4e5e5eb-976a-41c1-a8a8-f8544be0121b.bin	4be0121b.bin	71297496	777461	\N
198	store://2022/1/19/22/31/f997e064-57a9-43e4-aef6-c508f8db3f97.bin	f8db3f97.bin	4211774681	8085	\N
199	store://2022/1/19/22/31/6a27f585-1dfd-439d-8a4f-8e885417df1a.bin	5417df1a.bin	3271536104	26112	\N
200	store://2022/1/19/22/31/2d2c2bac-1749-460d-b366-da5ff498a42c.bin	f498a42c.bin	3129020286	2388	\N
201	store://2022/1/19/22/31/06dc345b-b3af-4229-a3d4-b6921339677e.bin	1339677e.bin	190975927	20964	\N
202	store://2022/1/19/22/31/b4044be7-cb9c-437c-b493-0dd96b6ff151.bin	6b6ff151.bin	617462286	162	\N
203	store://2022/1/19/22/31/18b22e23-312d-4a95-abc2-d92a7de8dcc0.bin	7de8dcc0.bin	4100966729	73728	\N
204	store://2022/1/19/22/31/5874a9c2-c087-4ade-bca9-35ab6da83765.bin	6da83765.bin	2674537590	4778	\N
205	store://2022/1/19/22/31/cae547b3-2956-48ce-b2d9-f123136f34b9.bin	136f34b9.bin	1627670756	42016	\N
206	store://2022/1/19/22/31/5fbea0b4-7481-40a3-a9e5-090834d9c012.bin	34d9c012.bin	1475805201	73728	\N
207	store://2022/1/19/22/31/a9caee79-b919-4f81-a0c6-65a72cde57d3.bin	2cde57d3.bin	2418609459	4774	\N
208	store://2022/1/19/22/31/54d944c8-ba1d-4eb7-9c0d-dfaffae92620.bin	fae92620.bin	2871825740	42502	\N
209	store://2022/1/19/22/31/e6828c03-83e0-49ce-9264-6ef2cc780fa2.bin	cc780fa2.bin	1781118368	74240	\N
210	store://2022/1/19/22/31/baf43a37-87d2-48fc-b6a5-7cf046f4a8e3.bin	46f4a8e3.bin	460375906	4849	\N
211	store://2022/1/19/22/31/75d49266-330e-46a0-81e7-1e1d6d319cfe.bin	6d319cfe.bin	2322790017	42890	\N
212	store://2022/1/19/22/31/a5b95937-2747-4deb-a5bd-8a95c92c279f.bin	c92c279f.bin	459660100	2117632	\N
213	store://2022/1/19/22/31/a2977189-d817-46cd-a1b9-6d407b6ad0ac.bin	7b6ad0ac.bin	996336457	6540	\N
214	store://2022/1/19/22/31/06b37de5-e25a-4d98-b134-c7ed0a77c981.bin	0a77c981.bin	973474546	672905	\N
215	store://2022/1/19/22/31/33e4b6f7-998e-448a-aad3-9e92be268f6e.bin	be268f6e.bin	3812990129	2898432	\N
216	store://2022/1/19/22/31/f20fc264-a632-4133-be8c-5fbdc28b3048.bin	c28b3048.bin	3502439022	6414	\N
217	store://2022/1/19/22/31/e270af8b-4f9b-4a6e-8fb9-9c63fc69ebbe.bin	fc69ebbe.bin	960521431	976492	\N
218	store://2022/1/19/22/31/ef1d3669-de9e-4549-a7cf-fc823ce0c6f9.bin	3ce0c6f9.bin	1795328708	25	\N
219	store://2022/1/19/22/31/6ea9dc38-b965-497c-88af-4e68d355b2c4.bin	d355b2c4.bin	3849124580	38	\N
220	store://2022/1/19/22/31/f18785d0-c35e-42fa-a55a-16235720d78e.bin	5720d78e.bin	3999266578	1175	\N
222	store://2022/1/19/22/31/789dec46-311b-479c-a24f-48645d8ed0e0.bin	5d8ed0e0.bin	2685891312	1771	\N
224	store://2022/1/19/22/31/9d09bf71-f396-4130-a9f3-fde35db3b5bc.bin	5db3b5bc.bin	3058646111	3430	\N
226	store://2022/1/19/22/31/b5bcfe6b-5038-4bfb-a0eb-16dcdf4534b0.bin	df4534b0.bin	2129320317	105	\N
227	store://2022/1/19/22/31/fcc8a78a-fc3d-4903-a6ff-076f819e227c.bin	819e227c.bin	1971623083	230	\N
228	store://2022/1/19/22/31/d460a208-354d-41f1-bb9f-07d364bf976b.bin	64bf976b.bin	141978690	151	\N
229	store://2022/1/19/22/31/558fd6df-49ee-4931-bac6-dc7d968ce85c.bin	968ce85c.bin	1195631207	317	\N
230	store://2022/1/19/22/31/ff0ba776-3985-43fe-af2e-e88e22fc23fb.bin	22fc23fb.bin	384005090	110	\N
231	store://2022/1/19/22/31/946c6cfa-3515-4f23-8007-9e2a6a07fe7b.bin	6a07fe7b.bin	1058584102	153	\N
232	store://2022/1/19/22/31/894198b3-f551-47fb-8c97-59126d7724f8.bin	6d7724f8.bin	586687113	797	\N
233	store://2022/1/19/22/31/a1dd2835-57fd-484f-8c2d-5acdb442f651.bin	b442f651.bin	2316510379	274	\N
234	store://2022/1/19/22/31/6ff0c97d-d332-48c2-9adf-d353c569f061.bin	c569f061.bin	292432607	341	\N
235	store://2022/1/19/22/31/ef1e0049-a5ff-45b7-9d50-97f7a766414a.bin	a766414a.bin	490912134	330	\N
236	store://2022/1/19/22/31/d587e388-1755-466d-8ba8-a2053aa6f69a.bin	3aa6f69a.bin	3568975231	328	\N
237	store://2022/1/19/22/31/ff3ebac4-afd3-4ebf-9e27-e60d711038db.bin	711038db.bin	2539692350	330	\N
238	store://2022/1/19/22/31/7f5f4113-50e7-4196-807a-38e7c2dba0bc.bin	c2dba0bc.bin	4250203070	282	\N
239	store://2022/1/19/22/31/c07f39a5-00b7-4151-90ca-bd0e2d60bd33.bin	2d60bd33.bin	1535118463	262	\N
240	store://2022/1/19/22/31/991bc854-969d-45c0-8402-084079695b37.bin	79695b37.bin	4276468348	272	\N
241	store://2022/1/19/22/31/c844cdf8-d63e-4190-b4d5-fe840b11c415.bin	0b11c415.bin	3612488581	346	\N
249	store://2022/1/19/22/34/ac49b2d7-03ec-4566-b330-65d66055bc1d.bin	6055bc1d.bin	1073834623	290	\N
250	store://2022/1/19/22/34/29bbcb0d-f95d-4aa6-8465-e9cfce6357ca.bin	ce6357ca.bin	1452919463	400	\N
251	store://2022/1/19/22/34/0400b4f9-c9ef-49af-9a0c-fd2a14e2950c.bin	14e2950c.bin	3092700960	297	\N
252	store://2022/1/19/22/34/e9512dc7-b23f-4c9d-a328-a54f9f6d3811.bin	9f6d3811.bin	1381900577	297	\N
253	store://2022/1/19/22/34/dff5afd9-5551-41af-a581-197a22f71831.bin	22f71831.bin	2465138807	302	\N
254	store://2022/1/19/22/34/c30097b9-8103-4c37-a665-cd83562788b3.bin	562788b3.bin	1348649490	372	\N
255	store://2022/1/19/22/34/5581acb9-f9f2-461c-b5c2-bd3b5c194bbf.bin	5c194bbf.bin	3160120178	395	\N
244	store://2022/1/19/22/34/0ec3442e-6359-4cf7-b245-df73ed548c6c.bin	ed548c6c.bin	2147843279	297	1642631674833
248	store://2022/1/19/22/34/2794c2ee-d773-46e9-9de6-48ce9a8e2d3b.bin	9a8e2d3b.bin	3848302463	395	1642631674833
245	store://2022/1/19/22/34/857af66b-01cb-4bf4-8ccc-70f97c039e98.bin	7c039e98.bin	3192738502	297	1642631674833
243	store://2022/1/19/22/34/11a3c5c5-8447-4559-a83b-bab7d866dbad.bin	d866dbad.bin	1429865512	400	1642631674833
246	store://2022/1/19/22/34/9b5a9f40-c281-4278-8487-06e31e8caec3.bin	1e8caec3.bin	2575158286	302	1642631674833
242	store://2022/1/19/22/34/f945e227-a263-4607-bcc8-b61275ba237a.bin	75ba237a.bin	2940419557	290	1642631674833
247	store://2022/1/19/22/34/90804630-cc35-4be4-86a3-1f9369c54de5.bin	69c54de5.bin	1378776844	372	1642631674833
256	store://2022/1/19/22/37/bec5159c-7b63-4768-95e3-652e27ad5c04.bin	27ad5c04.bin	1315621024	311	\N
257	store://2022/1/19/22/37/b84f541c-7055-486e-96c3-7df1a0b1094b.bin	a0b1094b.bin	3182310388	331	\N
258	store://2022/1/19/22/37/78501bc3-095c-46f1-a35f-09f0ba24b06b.bin	ba24b06b.bin	294255689	392	\N
259	store://2022/1/19/22/37/87f0b083-ebd6-472d-a276-21834945ab05.bin	4945ab05.bin	1480080152	321	\N
260	store://2022/1/19/22/37/bbde7b84-dd8a-43db-9ec7-b5e9808487d6.bin	808487d6.bin	3999702483	323	\N
261	store://2022/1/19/22/37/aca0abd0-0685-4861-a381-dab311cd77de.bin	11cd77de.bin	1020686362	605	\N
262	store://2022/1/19/22/37/cede6b09-8fa4-43b8-b4ba-4ccb12113600.bin	12113600.bin	4114623042	61	1642631855561
263	store://2022/1/19/22/37/6f505ded-ebda-4106-9947-bbdf20ceaa5e.bin	20ceaa5e.bin	1060752033	117	1642631925921
265	store://2022/1/19/22/38/f54d3785-8d48-4e0d-ad4c-d545e85bf08a.bin	e85bf08a.bin	2701284178	188	\N
264	store://2022/1/19/22/38/aff2374b-4bcc-4189-8fc4-0ab8672e1a72.bin	672e1a72.bin	343740575	187	1642631927013
266	store://2022/1/19/22/47/d6a2cc0b-a60c-4553-b1e6-c5d2e3235c58.bin	e3235c58.bin	436780642	155542	\N
268	store://2022/1/19/22/47/556cb230-1519-4e19-b0f5-11b073f15c40.bin	73f15c40.bin	3131358904	3811	\N
270	store://2022/1/19/22/47/50436ae6-18f5-49a3-9e05-b30880f0d224.bin	80f0d224.bin	1175043570	954002	\N
272	store://2022/1/19/22/47/755978a0-e0e0-4131-8f7c-08ae802f3ce4.bin	802f3ce4.bin	105147895	1131411	\N
274	store://2022/1/19/22/47/1315c923-3490-424e-b439-a95a4974dc60.bin	4974dc60.bin	2460013938	942	\N
276	store://2022/1/19/22/47/b0583071-41bf-4d1e-a8ab-5e656c964dbf.bin	6c964dbf.bin	3988678883	526164	\N
\.


--
-- Name: alf_content_url_enc_seq; Type: SEQUENCE SET; Schema: public; Owner: alfresco
--

SELECT pg_catalog.setval('alf_content_url_enc_seq', 1, false);


--
-- Data for Name: alf_content_url_encryption; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY alf_content_url_encryption (id, content_url_id, algorithm, key_size, encrypted_key, master_keystore_id, master_key_alias, unencrypted_file_size) FROM stdin;
\.


--
-- Name: alf_content_url_seq; Type: SEQUENCE SET; Schema: public; Owner: alfresco
--

SELECT pg_catalog.setval('alf_content_url_seq', 277, true);


--
-- Data for Name: alf_encoding; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY alf_encoding (id, version, encoding_str) FROM stdin;
1	0	utf-8
2	0	utf8
3	0	iso-8859-1
\.


--
-- Name: alf_encoding_seq; Type: SEQUENCE SET; Schema: public; Owner: alfresco
--

SELECT pg_catalog.setval('alf_encoding_seq', 3, true);


--
-- Data for Name: alf_locale; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY alf_locale (id, version, locale_str) FROM stdin;
1	0	.default
2	0	en_US_
3	0	en_
4	0	en_GB_
\.


--
-- Name: alf_locale_seq; Type: SEQUENCE SET; Schema: public; Owner: alfresco
--

SELECT pg_catalog.setval('alf_locale_seq', 4, true);


--
-- Data for Name: alf_lock; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY alf_lock (id, version, shared_resource_id, excl_resource_id, lock_token, start_time, expiry_time) FROM stdin;
26	1	21	21	not-locked	0	0
5	5	1	1	not-locked	0	0
1	5	2	1	not-locked	0	0
2	5	3	1	not-locked	0	0
3	5	4	1	not-locked	0	0
4	5	5	1	not-locked	0	0
6	9	6	6	not-locked	0	0
28	1	23	23	not-locked	0	0
27	1	22	22	not-locked	0	0
23	3	18	18	not-locked	0	0
9	105	2	9	not-locked	0	0
10	105	3	9	not-locked	0	0
11	105	4	9	not-locked	0	0
12	105	11	9	not-locked	0	0
25	3	20	20	not-locked	0	0
24	3	19	19	not-locked	0	0
13	105	12	9	not-locked	0	0
14	105	13	9	not-locked	0	0
15	105	9	9	not-locked	0	0
16	105	2	15	not-locked	0	0
17	105	3	15	not-locked	0	0
18	105	4	15	not-locked	0	0
19	105	11	15	not-locked	0	0
20	105	16	15	not-locked	0	0
21	105	17	15	not-locked	0	0
8	2109	8	8	not-locked	0	0
7	4219	7	7	not-locked	0	0
22	105	15	15	not-locked	0	0
\.


--
-- Data for Name: alf_lock_resource; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY alf_lock_resource (id, version, qname_ns_id, qname_localname) FROM stdin;
1	0	1	org.alfresco.repo.usage.userusagetrackingcomponent
2	0	1	org
3	0	1	org.alfresco
4	0	1	org.alfresco.repo
5	0	1	org.alfresco.repo.usage
6	0	1	chaininguserregistrysynchronizer
7	0	1	activitypostlookup
8	0	1	feedgenerator
9	0	1	org.alfresco.repo.activities.post.cleanup.postcleaner
11	0	1	org.alfresco.repo.activities
12	0	1	org.alfresco.repo.activities.post
13	0	1	org.alfresco.repo.activities.post.cleanup
15	0	1	org.alfresco.repo.activities.feed.cleanup.feedcleaner
16	0	1	org.alfresco.repo.activities.feed
17	0	1	org.alfresco.repo.activities.feed.cleanup
18	0	1	repousagemonitor
19	0	1	activityfeednotifier
20	0	1	fixedaclupdater
21	0	1	solrbackupclient-alfresco
22	0	1	solrbackupclient-archive
23	0	1	contentstorecleaner
\.


--
-- Name: alf_lock_resource_seq; Type: SEQUENCE SET; Schema: public; Owner: alfresco
--

SELECT pg_catalog.setval('alf_lock_resource_seq', 23, true);


--
-- Name: alf_lock_seq; Type: SEQUENCE SET; Schema: public; Owner: alfresco
--

SELECT pg_catalog.setval('alf_lock_seq', 28, true);


--
-- Data for Name: alf_mimetype; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY alf_mimetype (id, version, mimetype_str) FROM stdin;
1	0	text/xml
2	0	text/plain
3	0	text/html
4	0	application/x-javascript
5	0	application/json
6	0	application/octet-stream
7	0	image/jpeg
8	0	image/png
9	0	application/pdf
10	0	application/x-shockwave-flash
11	0	video/mp4
12	0	application/vnd.ms-excel
13	0	application/msword
14	0	application/vnd.ms-powerpoint
\.


--
-- Name: alf_mimetype_seq; Type: SEQUENCE SET; Schema: public; Owner: alfresco
--

SELECT pg_catalog.setval('alf_mimetype_seq', 14, true);


--
-- Data for Name: alf_namespace; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY alf_namespace (id, version, uri) FROM stdin;
1	0	http://www.alfresco.org/model/system/1.0
2	0	http://www.alfresco.org/model/user/1.0
3	0	http://www.alfresco.org/model/security/1.0
4	0	http://www.alfresco.org/model/versionstore/1.0
5	0	http://www.alfresco.org/model/versionstore/2.0
6	0	http://www.alfresco.org/model/content/1.0
7	0	http://www.alfresco.org/model/application/1.0
8	0	http://www.alfresco.org/model/rule/1.0
9	0	http://www.alfresco.org/model/action/1.0
10	0	http://www.alfresco.org/model/site/1.0
11	0	http://www.alfresco.org/model/transfer/1.0
12	0	http://www.alfresco.org/model/publishing/1.0
13	0	http://www.alfresco.org/model/content/smartfolder/1.0
14	0	.empty
15	0	http://www.alfresco.org/model/rendition/1.0
16	0	http://www.alfresco.org/model/exif/1.0
17	0	http://www.alfresco.org/model/forum/1.0
18	0	http://www.alfresco.org/model/linksmodel/1.0
19	0	http://www.alfresco.org/model/datalist/1.0
20	0	http://www.alfresco.org/system/modules/1.0
21	0	http://www.alfresco.org/model/solrfacet/1.0
\.


--
-- Name: alf_namespace_seq; Type: SEQUENCE SET; Schema: public; Owner: alfresco
--

SELECT pg_catalog.setval('alf_namespace_seq', 21, true);


--
-- Data for Name: alf_node; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY alf_node (id, version, store_id, uuid, transaction_id, type_qname_id, locale_id, acl_id, audit_creator, audit_created, audit_modifier, audit_modified, audit_accessed) FROM stdin;
1	1	1	abbbb5e9-abc1-44ee-9558-7189f744745e	1	1	1	1	\N	\N	\N	\N	\N
2	1	1	dcdf1808-f961-47ff-9aef-6043ca8de173	1	3	2	2	\N	\N	\N	\N	\N
3	1	1	d0d155c4-ed68-4fb6-819f-dc4fe058be28	1	3	2	2	\N	\N	\N	\N	\N
4	1	1	13faa544-8ed7-4ee6-bfec-a58bb4fc9957	1	5	2	2	\N	\N	\N	\N	\N
5	1	2	b207f931-3c2d-4216-a959-02b8a3241509	2	1	1	3	\N	\N	\N	\N	\N
6	1	2	5363e0c3-befd-4c0b-9c24-d0cce0d98a64	2	12	2	4	\N	\N	\N	\N	\N
733	1	6	49d47529-9f28-4ee7-a538-7cbb0dcd4d6d	13	79	2	13	System	2022-01-19T22:31:19.654Z	System	2022-01-19T22:31:19.654Z	\N
8	1	2	a899dbe9-82c8-44c2-b0a2-5925a01f248f	2	3	2	4	\N	\N	\N	\N	\N
9	1	3	4abded49-11f7-406d-81a9-8f4e71409339	3	1	1	5	\N	\N	\N	\N	\N
10	1	4	222c2d96-58a3-4dfe-aeed-d6b463479def	4	1	1	6	\N	\N	\N	\N	\N
11	1	5	9807d312-7746-462f-88e2-ad570fd89e26	5	1	1	7	\N	\N	\N	\N	\N
12	1	6	406a2101-3393-453b-8cd7-d32be618c954	6	1	1	8	\N	\N	\N	\N	\N
734	1	6	96af919a-69d0-4cec-97da-77491965e9a5	13	75	2	13	System	2022-01-19T22:31:19.685Z	System	2022-01-19T22:31:19.685Z	\N
735	1	6	fc44eeb1-10fd-4e53-996a-8ae69d9cf989	13	75	2	13	System	2022-01-19T22:31:19.701Z	System	2022-01-19T22:31:19.701Z	\N
736	1	6	c8222b9e-9527-46d8-9778-4ba4663dab9f	13	75	2	13	System	2022-01-19T22:31:19.701Z	System	2022-01-19T22:31:19.701Z	\N
737	1	6	e80faf16-631c-41b7-b235-b136265343b4	13	75	2	13	System	2022-01-19T22:31:19.717Z	System	2022-01-19T22:31:19.717Z	\N
738	1	6	dd836c6b-50bd-4692-a6b7-76dcebb9859d	13	75	2	13	System	2022-01-19T22:31:19.717Z	System	2022-01-19T22:31:19.717Z	\N
739	1	6	39e7d711-9753-4647-9e3a-2e0c8a0ad96b	13	75	2	13	System	2022-01-19T22:31:19.732Z	System	2022-01-19T22:31:19.732Z	\N
740	1	6	8d191421-9207-45ea-afd8-76260fc657fb	13	75	2	13	System	2022-01-19T22:31:19.748Z	System	2022-01-19T22:31:19.748Z	\N
18	1	6	70e26f6e-b9fc-4c4b-a6d0-5c3f4e6dfe34	6	24	2	13	System	2022-01-19T22:30:48.076Z	System	2022-01-19T22:30:48.076Z	\N
741	1	6	53050abb-9de4-474a-9d39-3eee8d5f872f	13	75	2	13	System	2022-01-19T22:31:19.748Z	System	2022-01-19T22:31:19.748Z	\N
742	1	6	a16c7899-3a19-4c9c-96a4-dab4d4f9b90f	13	75	2	13	System	2022-01-19T22:31:19.764Z	System	2022-01-19T22:31:19.764Z	\N
743	1	6	c49b5231-c3ce-4c5e-b58c-380e578f8595	13	75	2	13	System	2022-01-19T22:31:19.779Z	System	2022-01-19T22:31:19.779Z	\N
20	2	6	251f954d-90da-4c8a-8d32-64f8f8f564fe	6	24	2	16	System	2022-01-19T22:30:48.201Z	System	2022-01-19T22:30:48.201Z	\N
744	1	6	f15af5ac-ff8d-4d84-a476-0a4523a0ed60	13	75	2	13	System	2022-01-19T22:31:19.779Z	System	2022-01-19T22:31:19.779Z	\N
22	1	6	0407baaa-596c-4599-9a4a-1c36c1610177	6	24	2	13	System	2022-01-19T22:30:48.326Z	System	2022-01-19T22:30:48.326Z	\N
745	1	6	98b8c23c-ecbf-4ca7-933b-812d8825bdd1	13	75	2	13	System	2022-01-19T22:31:19.842Z	System	2022-01-19T22:31:19.842Z	\N
746	1	6	d4eb8a2d-06cf-45cf-a1af-90b821a65302	13	75	2	13	System	2022-01-19T22:31:19.842Z	System	2022-01-19T22:31:19.842Z	\N
747	1	6	0e26bd27-ed8d-4423-a9f5-1d2a3eaaaf8c	13	75	2	13	System	2022-01-19T22:31:19.857Z	System	2022-01-19T22:31:19.857Z	\N
24	2	6	34ba6b13-5730-48bf-a192-1af5822a7f03	6	24	2	20	System	2022-01-19T22:30:48.436Z	System	2022-01-19T22:30:48.436Z	\N
748	1	6	d6fa0b2d-7dc9-4ee5-b8fe-ddfac9c85d24	13	75	2	13	System	2022-01-19T22:31:19.857Z	System	2022-01-19T22:31:19.857Z	\N
25	2	6	50baa488-9b06-46d2-a461-827af15b25af	6	24	2	22	System	2022-01-19T22:30:48.498Z	System	2022-01-19T22:30:48.498Z	\N
26	1	6	46eaaf18-6b02-4779-b432-f82194865954	6	24	2	11	System	2022-01-19T22:30:48.576Z	System	2022-01-19T22:30:48.576Z	\N
749	1	6	fff2a3d8-5dc2-4226-9103-ae3197520d46	13	75	2	13	System	2022-01-19T22:31:19.873Z	System	2022-01-19T22:31:19.873Z	\N
27	2	6	50ad2fec-f467-4ca4-9de6-8d35ebea84f4	6	24	2	24	System	2022-01-19T22:30:48.607Z	System	2022-01-19T22:30:48.607Z	\N
28	1	6	abaf554b-e2f4-4e26-9b6d-05cd51f131e6	6	24	2	11	System	2022-01-19T22:30:48.670Z	System	2022-01-19T22:30:48.670Z	\N
29	1	6	8496a8c5-18a2-4d05-8e28-f5c777f37825	6	24	2	11	System	2022-01-19T22:30:48.701Z	System	2022-01-19T22:30:48.701Z	\N
750	1	6	1cddfe1c-a16e-423b-b0c1-4a420373c9c6	13	75	2	13	System	2022-01-19T22:31:19.873Z	System	2022-01-19T22:31:19.873Z	\N
30	2	6	75ebd0c1-2a14-451e-af40-693cdfd0ba1d	6	3	2	26	\N	\N	\N	\N	\N
31	1	6	cea23a8b-b8c9-4e5c-8586-cbe4336b06e8	6	3	2	27	\N	\N	\N	\N	\N
33	2	6	8a4b32b0-e077-45b9-972c-677f983e826c	6	35	2	30	\N	\N	\N	\N	\N
34	1	6	cc0c7472-519c-4e11-a4ea-eb70a8245d84	6	3	2	27	\N	\N	\N	\N	\N
35	1	6	bb31dd2b-4e92-4da4-888d-08b547c96f7e	6	46	2	9	System	2022-01-19T22:30:49.029Z	System	2022-01-19T22:30:49.029Z	\N
36	1	6	20363823-ee5d-49aa-87d9-41686d4cf19b	6	47	2	9	System	2022-01-19T22:30:49.045Z	System	2022-01-19T22:30:49.045Z	\N
37	1	6	2b11e453-9222-4b48-9508-4625ff27caed	6	47	2	9	System	2022-01-19T22:30:49.076Z	System	2022-01-19T22:30:49.076Z	\N
7	2	2	bf99f8f3-778d-48e4-93a8-f88280af3142	7	12	2	4	\N	\N	\N	\N	\N
38	1	6	55a057a3-3a7d-4f75-8e62-d2cf7b687f9d	6	47	2	9	System	2022-01-19T22:30:49.092Z	System	2022-01-19T22:30:49.092Z	\N
39	1	6	335b5c5f-976d-4752-b8e4-db51e0244a31	6	47	2	9	System	2022-01-19T22:30:49.107Z	System	2022-01-19T22:30:49.107Z	\N
40	1	6	c6a618df-cd63-46f2-872b-3ab0932ad604	6	47	2	9	System	2022-01-19T22:30:49.123Z	System	2022-01-19T22:30:49.123Z	\N
41	1	6	55951f82-11c8-4b56-9664-6da885bbe624	6	47	2	9	System	2022-01-19T22:30:49.139Z	System	2022-01-19T22:30:49.139Z	\N
42	1	6	0fcd88c0-c67a-4617-88e2-c06d6107cc6c	6	47	2	9	System	2022-01-19T22:30:49.154Z	System	2022-01-19T22:30:49.154Z	\N
43	1	6	f322d186-d505-47e6-92b5-9edf9f07563f	6	47	2	9	System	2022-01-19T22:30:49.186Z	System	2022-01-19T22:30:49.186Z	\N
44	1	6	5fb1524b-7929-42b9-bf24-61116bbe5b9b	6	47	2	9	System	2022-01-19T22:30:49.217Z	System	2022-01-19T22:30:49.217Z	\N
45	1	6	c8d9290a-3fea-44c6-9641-7ceaa1f0b4fc	6	47	2	9	System	2022-01-19T22:30:49.233Z	System	2022-01-19T22:30:49.233Z	\N
46	1	6	7c5fe9d2-853a-45df-b803-4209b6467e2f	6	47	2	9	System	2022-01-19T22:30:49.248Z	System	2022-01-19T22:30:49.248Z	\N
47	1	6	679f5058-aecd-4d69-b4a2-df10ce74b860	6	47	2	9	System	2022-01-19T22:30:49.279Z	System	2022-01-19T22:30:49.279Z	\N
48	1	6	c7b909e5-39a2-47c7-9fc1-03ba62874e3f	6	47	2	9	System	2022-01-19T22:30:49.295Z	System	2022-01-19T22:30:49.295Z	\N
49	1	6	2937757d-ca7b-44ef-a5f0-19c8fa8676fa	6	47	2	9	System	2022-01-19T22:30:49.320Z	System	2022-01-19T22:30:49.320Z	\N
50	1	6	3c25bca3-fbff-4c03-828a-d655341e45e0	6	47	2	9	System	2022-01-19T22:30:49.326Z	System	2022-01-19T22:30:49.326Z	\N
51	1	6	bddf4beb-99cc-4a05-9e54-9418a8ea7399	6	47	2	9	System	2022-01-19T22:30:49.357Z	System	2022-01-19T22:30:49.357Z	\N
52	1	6	9c514ec8-118c-449d-8264-0e0f7f22005b	6	47	2	9	System	2022-01-19T22:30:49.357Z	System	2022-01-19T22:30:49.357Z	\N
53	1	6	edd2070e-6281-435a-b80b-16b28fe5496c	6	47	2	9	System	2022-01-19T22:30:49.373Z	System	2022-01-19T22:30:49.373Z	\N
54	1	6	a5d6b5cb-5210-496c-9ec0-ec4c77a20b4b	6	47	2	9	System	2022-01-19T22:30:49.420Z	System	2022-01-19T22:30:49.420Z	\N
55	1	6	b19e717d-e613-4a0d-ae63-bf1fa7bc117d	6	47	2	9	System	2022-01-19T22:30:49.462Z	System	2022-01-19T22:30:49.462Z	\N
56	1	6	47b15d59-14a1-4a96-8eab-ae2415a96b14	6	47	2	9	System	2022-01-19T22:30:49.482Z	System	2022-01-19T22:30:49.482Z	\N
57	1	6	3295e1f2-8142-4a9a-8683-e4e0a0642e48	6	47	2	9	System	2022-01-19T22:30:49.513Z	System	2022-01-19T22:30:49.513Z	\N
58	1	6	db2c7883-7fe1-4d56-99df-669d90d65849	6	47	2	9	System	2022-01-19T22:30:49.529Z	System	2022-01-19T22:30:49.529Z	\N
59	1	6	5083d4d1-10da-4efe-8444-cdb0b12b4475	6	47	2	9	System	2022-01-19T22:30:49.555Z	System	2022-01-19T22:30:49.555Z	\N
60	1	6	5155f2df-67bc-4ec3-bbf6-a2c773501d9d	6	47	2	9	System	2022-01-19T22:30:49.573Z	System	2022-01-19T22:30:49.573Z	\N
61	1	6	0202c53e-7123-4353-90b2-f5e0c20c2989	6	47	2	9	System	2022-01-19T22:30:49.587Z	System	2022-01-19T22:30:49.587Z	\N
62	1	6	23db6f56-0266-4d71-a6d4-f66f679b261d	6	47	2	9	System	2022-01-19T22:30:49.617Z	System	2022-01-19T22:30:49.617Z	\N
63	1	6	0b52b97c-7ad2-48ee-8318-70c7c6367fc9	6	47	2	9	System	2022-01-19T22:30:49.630Z	System	2022-01-19T22:30:49.630Z	\N
64	1	6	4c2d37cd-4675-4365-8dd4-1e7cf726c6a8	6	47	2	9	System	2022-01-19T22:30:49.645Z	System	2022-01-19T22:30:49.645Z	\N
65	1	6	1748cf53-e2ed-4981-a693-55fa25bc902d	6	47	2	9	System	2022-01-19T22:30:49.655Z	System	2022-01-19T22:30:49.655Z	\N
66	1	6	93398c5c-1ea5-4b3e-acca-d02cbee3c2fd	6	47	2	9	System	2022-01-19T22:30:49.670Z	System	2022-01-19T22:30:49.670Z	\N
67	1	6	835d8d14-3a80-4fd4-a0ab-36d5c19d2505	6	47	2	9	System	2022-01-19T22:30:49.686Z	System	2022-01-19T22:30:49.686Z	\N
68	1	6	057e432c-52a1-4c30-ac8a-94500ba64582	6	47	2	9	System	2022-01-19T22:30:49.701Z	System	2022-01-19T22:30:49.701Z	\N
69	1	6	f3917313-bb22-43cb-9217-d1c5690cbf20	6	47	2	9	System	2022-01-19T22:30:49.717Z	System	2022-01-19T22:30:49.717Z	\N
70	1	6	be68f347-c964-4b57-8f2f-a5ae6a259542	6	47	2	9	System	2022-01-19T22:30:49.732Z	System	2022-01-19T22:30:49.732Z	\N
71	1	6	9172f0f3-624d-4350-ac5f-bf6d80f35afa	6	47	2	9	System	2022-01-19T22:30:49.748Z	System	2022-01-19T22:30:49.748Z	\N
72	1	6	ba5da72a-31f4-47fa-96fa-88ed7a5ed9ab	6	47	2	9	System	2022-01-19T22:30:49.764Z	System	2022-01-19T22:30:49.764Z	\N
73	1	6	2672c39f-2410-4190-8e35-3b9a21ee4ae1	6	47	2	9	System	2022-01-19T22:30:49.779Z	System	2022-01-19T22:30:49.779Z	\N
74	1	6	a4fe6898-25ce-446b-a40a-bf1450aa8e1d	6	47	2	9	System	2022-01-19T22:30:49.795Z	System	2022-01-19T22:30:49.795Z	\N
75	1	6	d806d2dd-57c9-4789-ad9f-b1fa2264568f	6	47	2	9	System	2022-01-19T22:30:49.811Z	System	2022-01-19T22:30:49.811Z	\N
76	1	6	653340db-7fe7-4a20-8a8b-4915430abe12	6	47	2	9	System	2022-01-19T22:30:49.826Z	System	2022-01-19T22:30:49.826Z	\N
77	1	6	92fc5c32-3367-4507-8699-ad53cee3255f	6	47	2	9	System	2022-01-19T22:30:49.826Z	System	2022-01-19T22:30:49.826Z	\N
78	1	6	7d6431af-8d2c-4e35-b37f-ce65b9120da7	6	47	2	9	System	2022-01-19T22:30:49.842Z	System	2022-01-19T22:30:49.842Z	\N
728	1	2	7ca61d6a-6781-48c3-9aaf-d5931f97ca8b	12	3	2	4	\N	\N	\N	\N	\N
79	1	6	c6ba039f-8daf-48b1-a964-4d01f23f1ad8	6	47	2	9	System	2022-01-19T22:30:49.873Z	System	2022-01-19T22:30:49.873Z	\N
80	1	6	e58aedc1-ed4c-4c56-8937-1a73913a8648	6	47	2	9	System	2022-01-19T22:30:49.889Z	System	2022-01-19T22:30:49.889Z	\N
81	1	6	4668e19d-fb6a-4707-82a9-54f4e320ccf9	6	47	2	9	System	2022-01-19T22:30:49.904Z	System	2022-01-19T22:30:49.904Z	\N
82	1	6	22fdc0ae-ace2-499e-8b3e-7eb0dfd98632	6	47	2	9	System	2022-01-19T22:30:49.904Z	System	2022-01-19T22:30:49.904Z	\N
83	1	6	cdddfce1-ba1d-42de-b477-f31019401608	6	47	2	9	System	2022-01-19T22:30:49.936Z	System	2022-01-19T22:30:49.936Z	\N
84	1	6	7181b0fa-5f99-4f53-989a-bb9eea8bbf36	6	47	2	9	System	2022-01-19T22:30:49.951Z	System	2022-01-19T22:30:49.951Z	\N
85	1	6	4076afb3-040a-4661-8332-809133751777	6	47	2	9	System	2022-01-19T22:30:49.951Z	System	2022-01-19T22:30:49.951Z	\N
86	1	6	a60cea6b-ee49-4c68-a642-f58884916b77	6	47	2	9	System	2022-01-19T22:30:49.967Z	System	2022-01-19T22:30:49.967Z	\N
87	1	6	edc3beec-9b8c-4b12-88ea-26ac46a5be28	6	47	2	9	System	2022-01-19T22:30:49.982Z	System	2022-01-19T22:30:49.982Z	\N
88	1	6	4686f47d-be4f-4644-9137-e0dc9fae3999	6	47	2	9	System	2022-01-19T22:30:49.998Z	System	2022-01-19T22:30:49.998Z	\N
89	1	6	cb3b769b-2787-4eda-8737-e6ccd5f01164	6	47	2	9	System	2022-01-19T22:30:50.014Z	System	2022-01-19T22:30:50.014Z	\N
90	1	6	b5bc1bdd-5d72-44f4-9a58-782e6b85d1de	6	47	2	9	System	2022-01-19T22:30:50.014Z	System	2022-01-19T22:30:50.014Z	\N
91	1	6	8e216775-549c-4aec-a4d1-672b89b993a0	6	47	2	9	System	2022-01-19T22:30:50.029Z	System	2022-01-19T22:30:50.029Z	\N
92	1	6	b80d72a4-0506-4b9b-bf64-b2b219442998	6	47	2	9	System	2022-01-19T22:30:50.045Z	System	2022-01-19T22:30:50.045Z	\N
93	1	6	0785946d-584e-425d-8fc7-f31bb9089a7c	6	47	2	9	System	2022-01-19T22:30:50.045Z	System	2022-01-19T22:30:50.045Z	\N
94	1	6	9dbd44e3-e925-46c4-a1a2-c15d672810fd	6	47	2	9	System	2022-01-19T22:30:50.061Z	System	2022-01-19T22:30:50.061Z	\N
95	1	6	cffd2b96-cc6a-4769-93d9-838dbc91e106	6	47	2	9	System	2022-01-19T22:30:50.061Z	System	2022-01-19T22:30:50.061Z	\N
96	1	6	dfa33d4d-4e0d-4484-b675-2fe0c4282e33	6	47	2	9	System	2022-01-19T22:30:50.076Z	System	2022-01-19T22:30:50.076Z	\N
97	1	6	df2dca9f-e35b-4eed-998c-0e8680274d8a	6	47	2	9	System	2022-01-19T22:30:50.076Z	System	2022-01-19T22:30:50.076Z	\N
98	1	6	eb675ae9-106f-4163-8203-01d9b43c1285	6	47	2	9	System	2022-01-19T22:30:50.092Z	System	2022-01-19T22:30:50.092Z	\N
99	1	6	952f9d0c-8330-49b0-a1ef-c09cfdfdf298	6	47	2	9	System	2022-01-19T22:30:50.092Z	System	2022-01-19T22:30:50.092Z	\N
100	1	6	c5dcae47-5b2e-4df7-a7e2-8ab72ad7f6e1	6	47	2	9	System	2022-01-19T22:30:50.107Z	System	2022-01-19T22:30:50.107Z	\N
101	1	6	499c8049-28e6-4bf9-919b-6b4b7e489b7f	6	47	2	9	System	2022-01-19T22:30:50.123Z	System	2022-01-19T22:30:50.123Z	\N
102	1	6	c3a4a3ee-4471-4554-aee3-f0e4358ab3a2	6	47	2	9	System	2022-01-19T22:30:50.123Z	System	2022-01-19T22:30:50.123Z	\N
103	1	6	d77c99ea-b625-4445-8475-0b2056138e05	6	47	2	9	System	2022-01-19T22:30:50.123Z	System	2022-01-19T22:30:50.123Z	\N
104	1	6	3ec7baf3-7519-41a7-a2f3-ad3be83acb31	6	47	2	9	System	2022-01-19T22:30:50.139Z	System	2022-01-19T22:30:50.139Z	\N
105	1	6	e7e43e8b-1b01-4370-b6b1-99fd3773ffc1	6	47	2	9	System	2022-01-19T22:30:50.139Z	System	2022-01-19T22:30:50.139Z	\N
106	1	6	2f69498f-1be0-4ac2-bb00-4ef41b81d58f	6	47	2	9	System	2022-01-19T22:30:50.154Z	System	2022-01-19T22:30:50.154Z	\N
107	1	6	7eeaf1f2-6928-419b-88ec-12d2a42db613	6	47	2	9	System	2022-01-19T22:30:50.170Z	System	2022-01-19T22:30:50.170Z	\N
108	1	6	4f747160-c399-4d77-800b-b07be4c232b2	6	47	2	9	System	2022-01-19T22:30:50.170Z	System	2022-01-19T22:30:50.170Z	\N
109	1	6	12e1a3c1-e8a3-43a9-be08-317573f64e7f	6	47	2	9	System	2022-01-19T22:30:50.186Z	System	2022-01-19T22:30:50.186Z	\N
110	1	6	faaada9a-8af3-4f89-81d1-010bc3b7b42e	6	47	2	9	System	2022-01-19T22:30:50.201Z	System	2022-01-19T22:30:50.201Z	\N
111	1	6	2d95e1f3-657c-45b3-9fc4-eea443734526	6	47	2	9	System	2022-01-19T22:30:50.217Z	System	2022-01-19T22:30:50.217Z	\N
112	1	6	7da7ea5f-0727-4928-9925-10d26ff60551	6	47	2	9	System	2022-01-19T22:30:50.232Z	System	2022-01-19T22:30:50.232Z	\N
113	1	6	414a5539-df5a-44d5-bca4-cccf0055e259	6	47	2	9	System	2022-01-19T22:30:50.232Z	System	2022-01-19T22:30:50.232Z	\N
114	1	6	240c2e3a-7a03-400b-ac34-f08249cea956	6	47	2	9	System	2022-01-19T22:30:50.248Z	System	2022-01-19T22:30:50.248Z	\N
115	1	6	467e28a4-f5f3-4144-8f78-e2fd284231a1	6	47	2	9	System	2022-01-19T22:30:50.264Z	System	2022-01-19T22:30:50.264Z	\N
116	1	6	29f57b67-a590-4242-a68e-f9a56147206c	6	47	2	9	System	2022-01-19T22:30:50.279Z	System	2022-01-19T22:30:50.279Z	\N
117	1	6	496862a5-99ce-49b7-b974-d5097fee0b0c	6	47	2	9	System	2022-01-19T22:30:50.279Z	System	2022-01-19T22:30:50.279Z	\N
118	1	6	f95203db-a892-4f5e-9851-f785c2bb06a4	6	47	2	9	System	2022-01-19T22:30:50.295Z	System	2022-01-19T22:30:50.295Z	\N
119	1	6	24b041af-1ac0-4188-8309-1456ca442439	6	47	2	9	System	2022-01-19T22:30:50.295Z	System	2022-01-19T22:30:50.295Z	\N
729	1	2	e9f24f70-4955-4e99-be83-0d9257404238	12	3	2	4	\N	\N	\N	\N	\N
120	1	6	e2ea4599-de4f-4053-977d-1fc0c69a287b	6	47	2	9	System	2022-01-19T22:30:50.311Z	System	2022-01-19T22:30:50.311Z	\N
121	1	6	938bc928-32dc-4fef-a483-23398d1aa5a5	6	47	2	9	System	2022-01-19T22:30:50.311Z	System	2022-01-19T22:30:50.311Z	\N
122	1	6	fcd920a4-d578-4ec7-8a1b-730ef1f34a3d	6	47	2	9	System	2022-01-19T22:30:50.326Z	System	2022-01-19T22:30:50.326Z	\N
123	1	6	ad485750-3982-4dc2-9f90-1f3086e6ec51	6	47	2	9	System	2022-01-19T22:30:50.342Z	System	2022-01-19T22:30:50.342Z	\N
124	1	6	f5f2cdfe-a6b2-4b0b-8b57-195c5970dbb0	6	47	2	9	System	2022-01-19T22:30:50.357Z	System	2022-01-19T22:30:50.357Z	\N
125	1	6	e159a025-589d-474f-9951-0249d633da7c	6	47	2	9	System	2022-01-19T22:30:50.357Z	System	2022-01-19T22:30:50.357Z	\N
126	1	6	67769375-f02f-40d8-a5cd-f1d97fee0312	6	47	2	9	System	2022-01-19T22:30:50.373Z	System	2022-01-19T22:30:50.373Z	\N
127	1	6	f05f088e-4491-418a-a8d9-1a2ea07769de	6	47	2	9	System	2022-01-19T22:30:50.373Z	System	2022-01-19T22:30:50.373Z	\N
128	1	6	92c66677-c160-47ac-8001-6b6c23bc7fe3	6	47	2	9	System	2022-01-19T22:30:50.389Z	System	2022-01-19T22:30:50.389Z	\N
129	1	6	251aa9f0-12f8-45be-a1bf-fb7965314124	6	47	2	9	System	2022-01-19T22:30:50.389Z	System	2022-01-19T22:30:50.389Z	\N
130	1	6	972bb98c-8c81-44a3-92ac-0a753ffac737	6	47	2	9	System	2022-01-19T22:30:50.420Z	System	2022-01-19T22:30:50.420Z	\N
131	1	6	f557de0b-67ef-4b9b-a525-751830f123a1	6	47	2	9	System	2022-01-19T22:30:50.436Z	System	2022-01-19T22:30:50.436Z	\N
132	1	6	ea7384f2-eb77-440b-a0b2-e2f1c08d04c0	6	47	2	9	System	2022-01-19T22:30:50.451Z	System	2022-01-19T22:30:50.451Z	\N
133	1	6	2003ea52-4e0c-4e60-9990-2349e064731b	6	47	2	9	System	2022-01-19T22:30:50.482Z	System	2022-01-19T22:30:50.482Z	\N
134	1	6	8cb3d691-95e8-4de2-a1bf-50eb87df1412	6	47	2	9	System	2022-01-19T22:30:50.498Z	System	2022-01-19T22:30:50.498Z	\N
135	1	6	cf51bb7e-4990-4982-b591-61d98779de0d	6	47	2	9	System	2022-01-19T22:30:50.514Z	System	2022-01-19T22:30:50.514Z	\N
136	1	6	7f8484b0-4e1b-4d56-a110-d097d1a8ff74	6	47	2	9	System	2022-01-19T22:30:50.514Z	System	2022-01-19T22:30:50.514Z	\N
137	1	6	6e1d23a9-644d-4167-b6ba-c7446890a57d	6	47	2	9	System	2022-01-19T22:30:50.529Z	System	2022-01-19T22:30:50.529Z	\N
138	1	6	cc268238-1d5a-446a-a945-ad79f0c30611	6	47	2	9	System	2022-01-19T22:30:50.545Z	System	2022-01-19T22:30:50.545Z	\N
139	1	6	0e543aa2-c86b-4bf5-ab29-8833ed3e0785	6	47	2	9	System	2022-01-19T22:30:50.561Z	System	2022-01-19T22:30:50.561Z	\N
140	1	6	7e3d7aad-c1d8-46cc-89e2-bae163ee5f20	6	47	2	9	System	2022-01-19T22:30:50.561Z	System	2022-01-19T22:30:50.561Z	\N
141	1	6	7cc92801-9142-4f26-b164-3ee8f93104a0	6	47	2	9	System	2022-01-19T22:30:50.576Z	System	2022-01-19T22:30:50.576Z	\N
142	1	6	72ed5f8a-97ad-4e69-bc07-d4543820bf6a	6	47	2	9	System	2022-01-19T22:30:50.576Z	System	2022-01-19T22:30:50.576Z	\N
143	1	6	be2eeb7f-540a-45cb-84ef-e98e496599d8	6	47	2	9	System	2022-01-19T22:30:50.607Z	System	2022-01-19T22:30:50.607Z	\N
144	1	6	c88a49db-e5e8-476d-be0c-6ed5f453bd0f	6	47	2	9	System	2022-01-19T22:30:50.623Z	System	2022-01-19T22:30:50.623Z	\N
145	1	6	887c6ea9-6074-4561-84b3-68c582fdf893	6	47	2	9	System	2022-01-19T22:30:50.623Z	System	2022-01-19T22:30:50.623Z	\N
146	1	6	5be98f5b-9e90-455d-965f-65e5adf5fc50	6	47	2	9	System	2022-01-19T22:30:50.639Z	System	2022-01-19T22:30:50.639Z	\N
147	1	6	3311152a-50e8-4e80-a63e-57d345ac2b12	6	47	2	9	System	2022-01-19T22:30:50.639Z	System	2022-01-19T22:30:50.639Z	\N
148	1	6	409e35f9-e198-4b5f-96e1-177cdb76fac3	6	47	2	9	System	2022-01-19T22:30:50.654Z	System	2022-01-19T22:30:50.654Z	\N
149	1	6	d163e1ca-48dc-4181-b12c-ad73c706de16	6	47	2	9	System	2022-01-19T22:30:50.654Z	System	2022-01-19T22:30:50.654Z	\N
150	1	6	072158cc-e280-40a3-b5c6-87079719e57b	6	47	2	9	System	2022-01-19T22:30:50.670Z	System	2022-01-19T22:30:50.670Z	\N
151	1	6	b822188c-534f-40c1-99cc-dddf6a44c2f0	6	47	2	9	System	2022-01-19T22:30:50.670Z	System	2022-01-19T22:30:50.670Z	\N
152	1	6	59541c64-b844-437a-b59c-0cbef4c6bd1e	6	47	2	9	System	2022-01-19T22:30:50.686Z	System	2022-01-19T22:30:50.686Z	\N
153	1	6	f6c80d5c-8bda-49a9-9a07-d3318b00468a	6	47	2	9	System	2022-01-19T22:30:50.686Z	System	2022-01-19T22:30:50.686Z	\N
154	1	6	c7eb29fc-da5f-4534-a9c5-727e480b09d0	6	47	2	9	System	2022-01-19T22:30:50.701Z	System	2022-01-19T22:30:50.701Z	\N
155	1	6	f9b90f74-044f-4d3d-99f9-bba35808f0c9	6	47	2	9	System	2022-01-19T22:30:50.701Z	System	2022-01-19T22:30:50.701Z	\N
156	1	6	e927372b-26e8-4e19-b3f2-5d6f2d431b73	6	47	2	9	System	2022-01-19T22:30:50.717Z	System	2022-01-19T22:30:50.717Z	\N
157	1	6	b038200d-2a5d-41c2-b08e-04971275abae	6	47	2	9	System	2022-01-19T22:30:50.717Z	System	2022-01-19T22:30:50.717Z	\N
158	1	6	7546c045-ead6-4d81-ad7a-2e92291ecc8e	6	47	2	9	System	2022-01-19T22:30:50.732Z	System	2022-01-19T22:30:50.732Z	\N
159	1	6	cfa6a25c-22b0-4701-89ad-cfe28f8d06d0	6	47	2	9	System	2022-01-19T22:30:50.732Z	System	2022-01-19T22:30:50.732Z	\N
160	1	6	a17d18ca-5b3f-4278-a83b-3a93c8b7b7e1	6	47	2	9	System	2022-01-19T22:30:50.748Z	System	2022-01-19T22:30:50.748Z	\N
730	1	2	6aa946ff-df56-4db4-9163-f2b45b33a739	12	3	2	4	\N	\N	\N	\N	\N
161	1	6	19394ee5-b79a-4b7f-a8db-edbcc9e4d4f3	6	47	2	9	System	2022-01-19T22:30:50.764Z	System	2022-01-19T22:30:50.764Z	\N
162	1	6	1cf46a8b-b9ea-4da0-8402-42ff64bd0eb2	6	47	2	9	System	2022-01-19T22:30:50.764Z	System	2022-01-19T22:30:50.764Z	\N
163	1	6	af0268d4-d9ca-4b43-9aef-18209ac37657	6	47	2	9	System	2022-01-19T22:30:50.779Z	System	2022-01-19T22:30:50.779Z	\N
164	1	6	b18158cf-170a-4983-8c96-1829185788b3	6	47	2	9	System	2022-01-19T22:30:50.779Z	System	2022-01-19T22:30:50.779Z	\N
165	1	6	3d6d2538-d0dc-4808-8e39-e9c820ad464f	6	47	2	9	System	2022-01-19T22:30:50.795Z	System	2022-01-19T22:30:50.795Z	\N
166	1	6	8a7d1251-4f3c-4ce4-adcf-35440344c32d	6	47	2	9	System	2022-01-19T22:30:50.795Z	System	2022-01-19T22:30:50.795Z	\N
167	1	6	1cba5fee-1c65-4fc8-bd7a-658244aebbbe	6	47	2	9	System	2022-01-19T22:30:50.811Z	System	2022-01-19T22:30:50.811Z	\N
168	1	6	743644db-22ba-4c14-ab21-1c83c4c506de	6	47	2	9	System	2022-01-19T22:30:50.826Z	System	2022-01-19T22:30:50.826Z	\N
169	1	6	22492c1a-1ee7-4b54-b554-147db55c03fb	6	47	2	9	System	2022-01-19T22:30:50.842Z	System	2022-01-19T22:30:50.842Z	\N
170	1	6	6f0d5cb5-8d43-4005-a88c-c6558e002a4c	6	47	2	9	System	2022-01-19T22:30:50.842Z	System	2022-01-19T22:30:50.842Z	\N
171	1	6	c5f3a0ea-20aa-4a35-ae4a-d271534886ae	6	47	2	9	System	2022-01-19T22:30:50.857Z	System	2022-01-19T22:30:50.857Z	\N
172	1	6	2a17c505-4c98-4d80-a8d4-fe78b26d79d2	6	47	2	9	System	2022-01-19T22:30:50.857Z	System	2022-01-19T22:30:50.857Z	\N
173	1	6	b60691ce-3459-495b-a7c7-26bb04321221	6	47	2	9	System	2022-01-19T22:30:50.873Z	System	2022-01-19T22:30:50.873Z	\N
174	1	6	4bd2c849-743b-4726-9012-962f203897df	6	47	2	9	System	2022-01-19T22:30:50.873Z	System	2022-01-19T22:30:50.873Z	\N
175	1	6	5976d5d4-81ac-48bd-b00c-9fc7fd3a10e0	6	47	2	9	System	2022-01-19T22:30:50.889Z	System	2022-01-19T22:30:50.889Z	\N
176	1	6	b3d04cc5-d8b6-41c2-acf2-0f14ff119d89	6	47	2	9	System	2022-01-19T22:30:50.889Z	System	2022-01-19T22:30:50.889Z	\N
177	1	6	a04759e3-5c3a-46ff-b30c-1a29c3fc86b5	6	47	2	9	System	2022-01-19T22:30:50.904Z	System	2022-01-19T22:30:50.904Z	\N
178	1	6	95f88545-e272-4b1b-b559-feab843f3a13	6	47	2	9	System	2022-01-19T22:30:50.904Z	System	2022-01-19T22:30:50.904Z	\N
179	1	6	1d6e5f4e-4ab7-4ea6-a52d-30f8bdb3ed20	6	47	2	9	System	2022-01-19T22:30:50.920Z	System	2022-01-19T22:30:50.920Z	\N
180	1	6	1b5c6f0f-41e7-44d6-b495-883d37412e66	6	47	2	9	System	2022-01-19T22:30:50.920Z	System	2022-01-19T22:30:50.920Z	\N
181	1	6	b0babd40-2407-4dd1-afa0-ee69441545ca	6	47	2	9	System	2022-01-19T22:30:50.936Z	System	2022-01-19T22:30:50.936Z	\N
182	1	6	1414ad47-2944-4683-94d3-2d5c83b62d17	6	47	2	9	System	2022-01-19T22:30:50.951Z	System	2022-01-19T22:30:50.951Z	\N
183	1	6	5c21f429-5f44-40dd-a9aa-47e01f219194	6	47	2	9	System	2022-01-19T22:30:50.951Z	System	2022-01-19T22:30:50.951Z	\N
184	1	6	80225136-4a55-481b-88b2-86a03f8623b5	6	47	2	9	System	2022-01-19T22:30:50.967Z	System	2022-01-19T22:30:50.967Z	\N
185	1	6	dd82c0f4-36d6-4cc5-9fbf-c235636ca0be	6	47	2	9	System	2022-01-19T22:30:50.982Z	System	2022-01-19T22:30:50.982Z	\N
186	1	6	f262a08d-78ea-4c14-a91a-a2dfc7af6423	6	47	2	9	System	2022-01-19T22:30:51.014Z	System	2022-01-19T22:30:51.014Z	\N
187	1	6	9cd15c84-d2c8-4158-8f22-3bb409cbaa41	6	47	2	9	System	2022-01-19T22:30:51.014Z	System	2022-01-19T22:30:51.014Z	\N
188	1	6	4283eba4-4091-4acd-84be-dcad65e1c65f	6	47	2	9	System	2022-01-19T22:30:51.029Z	System	2022-01-19T22:30:51.029Z	\N
189	1	6	6daa7e6d-7bc4-4343-860f-c67fd0f92a59	6	47	2	9	System	2022-01-19T22:30:51.029Z	System	2022-01-19T22:30:51.029Z	\N
190	1	6	7b9ac1c5-ebd1-458b-b937-650e768dc51b	6	47	2	9	System	2022-01-19T22:30:51.045Z	System	2022-01-19T22:30:51.045Z	\N
191	1	6	a4c2c31c-3556-4ee6-8656-dec942ed3db0	6	47	2	9	System	2022-01-19T22:30:51.045Z	System	2022-01-19T22:30:51.045Z	\N
192	1	6	294014df-403e-4551-a9a9-ad7f1e6eb833	6	47	2	9	System	2022-01-19T22:30:51.061Z	System	2022-01-19T22:30:51.061Z	\N
193	1	6	e565dc09-4216-4eed-88a6-6ae04de128a7	6	47	2	9	System	2022-01-19T22:30:51.076Z	System	2022-01-19T22:30:51.076Z	\N
194	1	6	84b159a1-a1ee-4983-a8c7-c2425771f06a	6	47	2	9	System	2022-01-19T22:30:51.076Z	System	2022-01-19T22:30:51.076Z	\N
195	1	6	8f18c9a3-0bfb-4641-9a65-03b8bd97cbec	6	47	2	9	System	2022-01-19T22:30:51.092Z	System	2022-01-19T22:30:51.092Z	\N
196	1	6	9febed7a-b482-4d5e-b158-066869c698e8	6	47	2	9	System	2022-01-19T22:30:51.123Z	System	2022-01-19T22:30:51.123Z	\N
197	1	6	ddcabb7f-a13e-4f1f-acc0-f6147fb1934a	6	47	2	9	System	2022-01-19T22:30:51.139Z	System	2022-01-19T22:30:51.139Z	\N
198	1	6	28604fd1-4398-44f3-890a-30340f33a6a8	6	47	2	9	System	2022-01-19T22:30:51.139Z	System	2022-01-19T22:30:51.139Z	\N
199	1	6	18a8dd03-d3bb-438c-945f-e6ca96de9c09	6	47	2	9	System	2022-01-19T22:30:51.154Z	System	2022-01-19T22:30:51.154Z	\N
200	1	6	f140d903-d908-4a60-a2e4-0bdc8c143890	6	47	2	9	System	2022-01-19T22:30:51.154Z	System	2022-01-19T22:30:51.154Z	\N
201	1	6	9cfc41a2-81d9-40b3-9f9a-d260fd373b5a	6	47	2	9	System	2022-01-19T22:30:51.170Z	System	2022-01-19T22:30:51.170Z	\N
731	1	2	c8f135a8-5a47-489a-a8d6-362d84a2cc2c	12	3	2	4	\N	\N	\N	\N	\N
202	1	6	c3e81d24-0790-40de-9d00-80c641dff2d8	6	47	2	9	System	2022-01-19T22:30:51.186Z	System	2022-01-19T22:30:51.186Z	\N
203	1	6	90d93ac9-e586-4930-9edd-34d417928842	6	47	2	9	System	2022-01-19T22:30:51.186Z	System	2022-01-19T22:30:51.186Z	\N
204	1	6	abd555d9-41f4-4152-ac86-df945b77bb8d	6	47	2	9	System	2022-01-19T22:30:51.201Z	System	2022-01-19T22:30:51.201Z	\N
205	1	6	ddd43ac6-4597-4623-ae0c-cefbb5ee45dc	6	47	2	9	System	2022-01-19T22:30:51.217Z	System	2022-01-19T22:30:51.217Z	\N
206	1	6	9b51a245-671f-49d1-a351-8bb203369bde	6	47	2	9	System	2022-01-19T22:30:51.232Z	System	2022-01-19T22:30:51.232Z	\N
207	1	6	b5f55790-3ce3-4a06-bf37-88b8081179ed	6	47	2	9	System	2022-01-19T22:30:51.232Z	System	2022-01-19T22:30:51.232Z	\N
208	1	6	5617944b-5ecd-413c-8b4c-bd9b20c2ce69	6	47	2	9	System	2022-01-19T22:30:51.248Z	System	2022-01-19T22:30:51.248Z	\N
209	1	6	9a2d112e-589b-4c6d-8e75-4b943e0c1070	6	47	2	9	System	2022-01-19T22:30:51.248Z	System	2022-01-19T22:30:51.248Z	\N
210	1	6	16b9e8eb-0303-44e4-8948-8ce0958b3381	6	47	2	9	System	2022-01-19T22:30:51.264Z	System	2022-01-19T22:30:51.264Z	\N
211	1	6	58e14559-4386-42d8-9c1a-3e1c213d0bd3	6	47	2	9	System	2022-01-19T22:30:51.264Z	System	2022-01-19T22:30:51.264Z	\N
212	1	6	c26dda6d-983e-46aa-9038-0499e0c4acb0	6	47	2	9	System	2022-01-19T22:30:51.279Z	System	2022-01-19T22:30:51.279Z	\N
213	1	6	185412e1-891b-4952-8e1f-e29ca16eebc1	6	47	2	9	System	2022-01-19T22:30:51.279Z	System	2022-01-19T22:30:51.279Z	\N
214	1	6	c6f5b540-0ec5-43d2-a38c-2f6d20bff982	6	47	2	9	System	2022-01-19T22:30:51.295Z	System	2022-01-19T22:30:51.295Z	\N
215	1	6	093d13fb-8e8a-4531-8ed0-bda84eee2f31	6	47	2	9	System	2022-01-19T22:30:51.295Z	System	2022-01-19T22:30:51.295Z	\N
216	1	6	92a5eba6-8149-423f-90e3-b20b04644672	6	47	2	9	System	2022-01-19T22:30:51.311Z	System	2022-01-19T22:30:51.311Z	\N
217	1	6	8a9d0709-37e3-4dd8-8006-f4dcff1ae843	6	47	2	9	System	2022-01-19T22:30:51.311Z	System	2022-01-19T22:30:51.311Z	\N
218	1	6	719ee0e6-85d3-4151-959c-0d10547c6c2a	6	47	2	9	System	2022-01-19T22:30:51.326Z	System	2022-01-19T22:30:51.326Z	\N
219	1	6	51623907-2666-4c30-90fc-d1b2f7a0a2d9	6	47	2	9	System	2022-01-19T22:30:51.326Z	System	2022-01-19T22:30:51.326Z	\N
220	1	6	6457f285-53f4-4295-ad9c-b545a9c189b4	6	47	2	9	System	2022-01-19T22:30:51.326Z	System	2022-01-19T22:30:51.326Z	\N
221	1	6	deaa2819-c45b-43cf-b19e-01b9acf343a1	6	47	2	9	System	2022-01-19T22:30:51.342Z	System	2022-01-19T22:30:51.342Z	\N
222	1	6	28091edf-0703-4296-96ff-7b84357973c9	6	47	2	9	System	2022-01-19T22:30:51.342Z	System	2022-01-19T22:30:51.342Z	\N
223	1	6	65f38504-aa7c-43e8-a29c-3653e4212bf5	6	47	2	9	System	2022-01-19T22:30:51.357Z	System	2022-01-19T22:30:51.357Z	\N
224	1	6	3a4aa134-68ae-4561-9d01-7e8761e2b475	6	47	2	9	System	2022-01-19T22:30:51.357Z	System	2022-01-19T22:30:51.357Z	\N
225	1	6	64387b7c-11ae-4e86-9dd0-0ed5c5e1800d	6	47	2	9	System	2022-01-19T22:30:51.419Z	System	2022-01-19T22:30:51.419Z	\N
226	1	6	50dd30c2-9f80-4c3a-8972-134da5543626	6	47	2	9	System	2022-01-19T22:30:51.427Z	System	2022-01-19T22:30:51.427Z	\N
227	1	6	1dd6a424-e974-4303-bafe-c96f2c6a8694	6	47	2	9	System	2022-01-19T22:30:51.434Z	System	2022-01-19T22:30:51.434Z	\N
228	1	6	b4bc9a9c-cd2d-4232-9179-155224c14889	6	47	2	9	System	2022-01-19T22:30:51.444Z	System	2022-01-19T22:30:51.444Z	\N
229	1	6	62157f52-0e76-4366-ac14-5f3d60748ca8	6	47	2	9	System	2022-01-19T22:30:51.453Z	System	2022-01-19T22:30:51.453Z	\N
230	1	6	278a2e77-4409-4e5f-b6be-1c839adeecd2	6	47	2	9	System	2022-01-19T22:30:51.465Z	System	2022-01-19T22:30:51.465Z	\N
231	1	6	e03247c2-9c4f-4c1c-a216-5680ec03ad98	6	47	2	9	System	2022-01-19T22:30:51.475Z	System	2022-01-19T22:30:51.475Z	\N
232	1	6	1411c4ad-14f5-49ec-9e66-28c5c7d2efb5	6	47	2	9	System	2022-01-19T22:30:51.484Z	System	2022-01-19T22:30:51.484Z	\N
233	1	6	3daa4dd2-ab42-4e6e-ad36-07fbce8fec0e	6	47	2	9	System	2022-01-19T22:30:51.496Z	System	2022-01-19T22:30:51.496Z	\N
234	1	6	25a15eb5-e9b2-47c8-b2b0-0b6fa6076379	6	47	2	9	System	2022-01-19T22:30:51.511Z	System	2022-01-19T22:30:51.511Z	\N
235	1	6	2ef11f19-077c-48a4-a6b8-25ac16ac4cd4	6	47	2	9	System	2022-01-19T22:30:51.521Z	System	2022-01-19T22:30:51.521Z	\N
236	1	6	b924c541-de40-43cc-baf8-903e947f967b	6	47	2	9	System	2022-01-19T22:30:51.532Z	System	2022-01-19T22:30:51.532Z	\N
237	1	6	15c89e48-183f-401f-b27a-95b2f7dbf855	6	47	2	9	System	2022-01-19T22:30:51.541Z	System	2022-01-19T22:30:51.541Z	\N
238	1	6	d9ce18cb-9930-4b86-a57b-b0ea889efb55	6	47	2	9	System	2022-01-19T22:30:51.549Z	System	2022-01-19T22:30:51.549Z	\N
239	1	6	84cac3e2-c19b-48e5-b46b-2d6f8e9ebb4a	6	47	2	9	System	2022-01-19T22:30:51.562Z	System	2022-01-19T22:30:51.562Z	\N
240	1	6	a11ef826-68bb-4333-9961-96832a77d802	6	47	2	9	System	2022-01-19T22:30:51.574Z	System	2022-01-19T22:30:51.574Z	\N
241	1	6	9cabc4f6-2150-40b1-b8fe-797b50484856	6	47	2	9	System	2022-01-19T22:30:51.588Z	System	2022-01-19T22:30:51.588Z	\N
242	1	6	913e5e59-3360-4a61-9c22-4876b5932411	6	47	2	9	System	2022-01-19T22:30:51.596Z	System	2022-01-19T22:30:51.596Z	\N
732	1	2	bfdfa895-e10a-471a-83e6-d94c9c2b5550	12	3	2	4	\N	\N	\N	\N	\N
243	1	6	64a875f8-9a38-4ad2-8918-1ac8885f6a6c	6	47	2	9	System	2022-01-19T22:30:51.604Z	System	2022-01-19T22:30:51.604Z	\N
244	1	6	13ba4275-dfa7-4148-81cd-22390f07112d	6	47	2	9	System	2022-01-19T22:30:51.623Z	System	2022-01-19T22:30:51.623Z	\N
245	1	6	bd5191e8-0097-4b42-a275-06284ba5fbbf	6	47	2	9	System	2022-01-19T22:30:51.643Z	System	2022-01-19T22:30:51.643Z	\N
246	1	6	803a64ec-f687-41db-a05c-3e298451672e	6	47	2	9	System	2022-01-19T22:30:51.661Z	System	2022-01-19T22:30:51.661Z	\N
247	1	6	51140c55-0f5f-45ea-b0d4-2741a5e9691a	6	47	2	9	System	2022-01-19T22:30:51.671Z	System	2022-01-19T22:30:51.671Z	\N
248	1	6	4607a214-f564-4045-9508-40f889fc7dff	6	47	2	9	System	2022-01-19T22:30:51.684Z	System	2022-01-19T22:30:51.684Z	\N
249	1	6	d77a762f-56ab-443c-b2e9-2ddde5cfedd2	6	47	2	9	System	2022-01-19T22:30:51.692Z	System	2022-01-19T22:30:51.692Z	\N
250	1	6	9173c9ff-2ce5-48b9-8fa8-26d3d24f525e	6	47	2	9	System	2022-01-19T22:30:51.702Z	System	2022-01-19T22:30:51.702Z	\N
251	1	6	ec128338-b1e7-4307-8436-f408c3a24fdb	6	47	2	9	System	2022-01-19T22:30:51.709Z	System	2022-01-19T22:30:51.709Z	\N
252	1	6	f5803385-3aed-4086-b5dc-0845b53b3229	6	47	2	9	System	2022-01-19T22:30:51.719Z	System	2022-01-19T22:30:51.719Z	\N
253	1	6	879fc3e1-5201-4578-8fae-fff68335a9e6	6	47	2	9	System	2022-01-19T22:30:51.727Z	System	2022-01-19T22:30:51.727Z	\N
254	1	6	b5573db1-c331-470b-98ae-26c607f0e1ca	6	47	2	9	System	2022-01-19T22:30:51.738Z	System	2022-01-19T22:30:51.738Z	\N
255	1	6	a1f098d2-0e4f-44f2-883f-2742a387be4f	6	47	2	9	System	2022-01-19T22:30:51.749Z	System	2022-01-19T22:30:51.749Z	\N
256	1	6	38eb79fa-f79f-4ec7-a161-549352e6d01b	6	47	2	9	System	2022-01-19T22:30:51.764Z	System	2022-01-19T22:30:51.764Z	\N
257	1	6	c6eccc10-f074-4388-a9f2-117c76afb1e1	6	47	2	9	System	2022-01-19T22:30:51.784Z	System	2022-01-19T22:30:51.784Z	\N
258	1	6	d6ab64d0-c074-4e79-8dca-e78e6fbf1387	6	47	2	9	System	2022-01-19T22:30:51.798Z	System	2022-01-19T22:30:51.798Z	\N
259	1	6	0ad9876d-b76c-42a2-92cd-c9f5b10e25a6	6	47	2	9	System	2022-01-19T22:30:51.823Z	System	2022-01-19T22:30:51.823Z	\N
260	1	6	c0cf28e3-9049-4baf-b11b-f38afa26aea2	6	47	2	9	System	2022-01-19T22:30:51.842Z	System	2022-01-19T22:30:51.842Z	\N
261	1	6	de8f9971-12e8-4ca9-a682-71113c7b004d	6	47	2	9	System	2022-01-19T22:30:51.854Z	System	2022-01-19T22:30:51.854Z	\N
262	1	6	e9cdc887-0c20-4a77-b7f5-5b1769c797b2	6	47	2	9	System	2022-01-19T22:30:51.882Z	System	2022-01-19T22:30:51.882Z	\N
263	1	6	7c690030-74cd-4c16-a11e-0e09ee8c9e17	6	47	2	9	System	2022-01-19T22:30:51.891Z	System	2022-01-19T22:30:51.891Z	\N
264	1	6	78940f0e-c5eb-49f9-a74f-0964d463f80b	6	47	2	9	System	2022-01-19T22:30:51.899Z	System	2022-01-19T22:30:51.899Z	\N
265	1	6	e442373e-71fe-41bb-81d8-46c568bff34a	6	47	2	9	System	2022-01-19T22:30:51.907Z	System	2022-01-19T22:30:51.907Z	\N
266	1	6	6c402225-84b9-431f-b401-202aab1bfabc	6	47	2	9	System	2022-01-19T22:30:51.923Z	System	2022-01-19T22:30:51.923Z	\N
267	1	6	ab2a1e13-af99-4cf9-a736-687afb379b9a	6	47	2	9	System	2022-01-19T22:30:51.932Z	System	2022-01-19T22:30:51.932Z	\N
268	1	6	7d4c8a1b-e619-4e30-b184-4d3bf16b2421	6	47	2	9	System	2022-01-19T22:30:51.944Z	System	2022-01-19T22:30:51.944Z	\N
269	1	6	583ab3f2-c775-4553-b264-fb597d30f922	6	47	2	9	System	2022-01-19T22:30:51.953Z	System	2022-01-19T22:30:51.953Z	\N
270	1	6	f805bfcc-0dc3-4612-906b-24682c41e67b	6	47	2	9	System	2022-01-19T22:30:51.967Z	System	2022-01-19T22:30:51.967Z	\N
271	1	6	711d03be-1b11-49fa-9eb3-d6be71c30b9e	6	47	2	9	System	2022-01-19T22:30:51.977Z	System	2022-01-19T22:30:51.977Z	\N
272	1	6	6e9b96e4-09d3-480c-be5d-597ef88222b2	6	47	2	9	System	2022-01-19T22:30:51.985Z	System	2022-01-19T22:30:51.985Z	\N
273	1	6	334cfd36-8a85-4339-9928-72d557de395f	6	47	2	9	System	2022-01-19T22:30:52.000Z	System	2022-01-19T22:30:52.000Z	\N
274	1	6	eed2fc05-8df1-4f6a-838d-5922a52df303	6	47	2	9	System	2022-01-19T22:30:52.009Z	System	2022-01-19T22:30:52.009Z	\N
275	1	6	91e608db-da0a-4682-a370-5e4a0b5c951e	6	47	2	9	System	2022-01-19T22:30:52.018Z	System	2022-01-19T22:30:52.018Z	\N
276	1	6	46b7fb66-14d7-4638-a65f-9ff29f66bcb9	6	47	2	9	System	2022-01-19T22:30:52.037Z	System	2022-01-19T22:30:52.037Z	\N
277	1	6	593c91ba-2b40-4a5e-98f5-9ca94b557387	6	47	2	9	System	2022-01-19T22:30:52.047Z	System	2022-01-19T22:30:52.047Z	\N
278	1	6	5df8266f-6b03-4595-94be-b9c675a2b37a	6	47	2	9	System	2022-01-19T22:30:52.060Z	System	2022-01-19T22:30:52.060Z	\N
279	1	6	f756c1eb-e856-48e6-a316-b68918dde3bf	6	47	2	9	System	2022-01-19T22:30:52.085Z	System	2022-01-19T22:30:52.085Z	\N
280	1	6	23a7dd83-fc7b-439f-88f8-097829757a45	6	47	2	9	System	2022-01-19T22:30:52.095Z	System	2022-01-19T22:30:52.095Z	\N
281	1	6	135b8c04-e8d8-4d42-9756-788e33c486e0	6	47	2	9	System	2022-01-19T22:30:52.104Z	System	2022-01-19T22:30:52.104Z	\N
282	1	6	58908186-6e56-4311-83f5-ea6730ab3ecb	6	47	2	9	System	2022-01-19T22:30:52.115Z	System	2022-01-19T22:30:52.115Z	\N
283	1	6	24c665c0-dbb8-4215-9425-34757460bce2	6	47	2	9	System	2022-01-19T22:30:52.126Z	System	2022-01-19T22:30:52.126Z	\N
284	1	6	ae0b8975-68c6-4973-bfb3-a73c1ffcf217	6	47	2	9	System	2022-01-19T22:30:52.145Z	System	2022-01-19T22:30:52.145Z	\N
285	1	6	599cc3b0-b375-40aa-a182-0d7ffebd5bef	6	47	2	9	System	2022-01-19T22:30:52.155Z	System	2022-01-19T22:30:52.155Z	\N
286	1	6	de66d748-234f-4cbe-880e-21bd850b2a8e	6	47	2	9	System	2022-01-19T22:30:52.163Z	System	2022-01-19T22:30:52.163Z	\N
287	1	6	076579a6-6418-4806-b043-95acaa0b17a1	6	47	2	9	System	2022-01-19T22:30:52.174Z	System	2022-01-19T22:30:52.174Z	\N
288	1	6	70728a14-82f2-4e45-bf90-fe7b2b3fc961	6	47	2	9	System	2022-01-19T22:30:52.184Z	System	2022-01-19T22:30:52.184Z	\N
289	1	6	1631d1c1-1630-42b2-a6c5-93c98641e994	6	47	2	9	System	2022-01-19T22:30:52.192Z	System	2022-01-19T22:30:52.192Z	\N
290	1	6	fdcd321f-cc41-4f2e-ae0f-0a21bc8a4cd7	6	47	2	9	System	2022-01-19T22:30:52.206Z	System	2022-01-19T22:30:52.206Z	\N
291	1	6	23d71aa4-3706-47fe-b1c0-d00237bee00d	6	47	2	9	System	2022-01-19T22:30:52.215Z	System	2022-01-19T22:30:52.215Z	\N
292	1	6	3fa60a68-fa80-4510-9f0f-b7aaaf659fb0	6	47	2	9	System	2022-01-19T22:30:52.223Z	System	2022-01-19T22:30:52.223Z	\N
293	1	6	584fdc2d-d05d-4762-beac-ff3a6e72671d	6	47	2	9	System	2022-01-19T22:30:52.234Z	System	2022-01-19T22:30:52.234Z	\N
294	1	6	e5bb89e6-3e86-4638-9884-903691f2adf5	6	47	2	9	System	2022-01-19T22:30:52.243Z	System	2022-01-19T22:30:52.243Z	\N
295	1	6	175c806f-d79d-441e-844c-ebff326f8d65	6	47	2	9	System	2022-01-19T22:30:52.252Z	System	2022-01-19T22:30:52.252Z	\N
296	1	6	1866564f-6813-4e49-bba4-fdafcd03549b	6	47	2	9	System	2022-01-19T22:30:52.261Z	System	2022-01-19T22:30:52.261Z	\N
297	1	6	a11224c3-f7f3-42ce-bc77-f7403875e518	6	47	2	9	System	2022-01-19T22:30:52.270Z	System	2022-01-19T22:30:52.270Z	\N
298	1	6	e9f56a01-d471-4347-8b19-9c334f959523	6	47	2	9	System	2022-01-19T22:30:52.278Z	System	2022-01-19T22:30:52.278Z	\N
299	1	6	71e0d89a-55b1-4573-9ab8-db765d796fc5	6	47	2	9	System	2022-01-19T22:30:52.286Z	System	2022-01-19T22:30:52.286Z	\N
300	1	6	612d8d9d-b8ad-4bd2-83a9-bc0138fbb961	6	47	2	9	System	2022-01-19T22:30:52.295Z	System	2022-01-19T22:30:52.295Z	\N
301	1	6	042a61f2-e6d8-4f3f-b09c-f07ae4dd612c	6	47	2	9	System	2022-01-19T22:30:52.305Z	System	2022-01-19T22:30:52.305Z	\N
302	1	6	71073e32-bf2d-47c1-bbf0-731910398c97	6	47	2	9	System	2022-01-19T22:30:52.315Z	System	2022-01-19T22:30:52.315Z	\N
303	1	6	93946c1c-a13c-4bc7-8243-bd42bedcfc58	6	47	2	9	System	2022-01-19T22:30:52.323Z	System	2022-01-19T22:30:52.323Z	\N
304	1	6	130359dd-db50-4a8e-baec-13637bd549a3	6	47	2	9	System	2022-01-19T22:30:52.334Z	System	2022-01-19T22:30:52.334Z	\N
305	1	6	b683442a-404a-4ae0-b2d1-ab45ebdb9160	6	47	2	9	System	2022-01-19T22:30:52.342Z	System	2022-01-19T22:30:52.342Z	\N
306	1	6	8738e8d6-c3b0-4b45-9eb5-599da08166d1	6	47	2	9	System	2022-01-19T22:30:52.350Z	System	2022-01-19T22:30:52.350Z	\N
307	1	6	8a4b677e-59fa-4a91-be3c-36c7824d6ae2	6	47	2	9	System	2022-01-19T22:30:52.358Z	System	2022-01-19T22:30:52.358Z	\N
308	1	6	b6429769-2ca4-4f7a-86eb-b87bb539f30c	6	47	2	9	System	2022-01-19T22:30:52.369Z	System	2022-01-19T22:30:52.369Z	\N
309	1	6	9429a2f5-3d7f-4ebf-afda-ce2a21667470	6	47	2	9	System	2022-01-19T22:30:52.376Z	System	2022-01-19T22:30:52.376Z	\N
310	1	6	a62ce279-ed71-4655-895f-ad03e81be66e	6	47	2	9	System	2022-01-19T22:30:52.385Z	System	2022-01-19T22:30:52.385Z	\N
311	1	6	50693263-e62c-46a9-a35d-aad8d57db600	6	47	2	9	System	2022-01-19T22:30:52.394Z	System	2022-01-19T22:30:52.394Z	\N
312	1	6	da84794e-f87c-47d8-8359-3c6805622b72	6	47	2	9	System	2022-01-19T22:30:52.405Z	System	2022-01-19T22:30:52.405Z	\N
313	1	6	5b12d4c0-3e95-4744-a839-eb72385aa873	6	47	2	9	System	2022-01-19T22:30:52.413Z	System	2022-01-19T22:30:52.413Z	\N
314	1	6	49394aae-7e95-45ed-a7af-d5eb3ed16936	6	47	2	9	System	2022-01-19T22:30:52.420Z	System	2022-01-19T22:30:52.420Z	\N
315	1	6	f3b76b68-f220-42e1-84f8-1262990feca7	6	47	2	9	System	2022-01-19T22:30:52.420Z	System	2022-01-19T22:30:52.420Z	\N
316	1	6	b8b3dbc8-b4b9-4b87-97aa-5e8761d1eaf8	6	47	2	9	System	2022-01-19T22:30:52.436Z	System	2022-01-19T22:30:52.436Z	\N
317	1	6	6e4a9394-56d3-4dc1-8b27-4383468beb0b	6	47	2	9	System	2022-01-19T22:30:52.436Z	System	2022-01-19T22:30:52.436Z	\N
318	1	6	347bb242-7e29-4b72-8363-0d97b73c5d05	6	47	2	9	System	2022-01-19T22:30:52.451Z	System	2022-01-19T22:30:52.451Z	\N
319	1	6	818b790f-517a-4d38-9d02-d5db21b76e0e	6	47	2	9	System	2022-01-19T22:30:52.467Z	System	2022-01-19T22:30:52.467Z	\N
320	1	6	58afa735-a044-4440-a566-4a56473ec61c	6	47	2	9	System	2022-01-19T22:30:52.467Z	System	2022-01-19T22:30:52.467Z	\N
321	1	6	e39f010d-5753-49db-a37a-404b463e5b22	6	47	2	9	System	2022-01-19T22:30:52.498Z	System	2022-01-19T22:30:52.498Z	\N
322	1	6	59ffc610-08ac-4a52-8b14-a9dbcd222fff	6	47	2	9	System	2022-01-19T22:30:52.498Z	System	2022-01-19T22:30:52.498Z	\N
323	1	6	e423bce0-9e83-4254-853c-0f4a20c7f875	6	47	2	9	System	2022-01-19T22:30:52.514Z	System	2022-01-19T22:30:52.514Z	\N
324	1	6	567ee644-38e6-4c2d-81af-a1cdebf98589	6	47	2	9	System	2022-01-19T22:30:52.529Z	System	2022-01-19T22:30:52.529Z	\N
325	1	6	72549fdb-3b04-4121-9ccc-f0c07b9d2507	6	47	2	9	System	2022-01-19T22:30:52.545Z	System	2022-01-19T22:30:52.545Z	\N
326	1	6	6ff29579-cd32-46ba-8c5a-80b115877b94	6	47	2	9	System	2022-01-19T22:30:52.545Z	System	2022-01-19T22:30:52.545Z	\N
327	1	6	4da5bec1-de2f-429d-850a-1bfe4ccb49a1	6	47	2	9	System	2022-01-19T22:30:52.545Z	System	2022-01-19T22:30:52.545Z	\N
328	1	6	236885c3-cf9b-4ee8-bfd8-8e3165979831	6	47	2	9	System	2022-01-19T22:30:52.561Z	System	2022-01-19T22:30:52.561Z	\N
329	1	6	fa2b73ed-0c39-4912-b66d-f69e147082cc	6	47	2	9	System	2022-01-19T22:30:52.561Z	System	2022-01-19T22:30:52.561Z	\N
330	1	6	92d2c4e1-540b-4809-9460-f813a72b6c6b	6	47	2	9	System	2022-01-19T22:30:52.576Z	System	2022-01-19T22:30:52.576Z	\N
331	1	6	991a564e-f21c-4305-bd2e-12e755a32c33	6	47	2	9	System	2022-01-19T22:30:52.576Z	System	2022-01-19T22:30:52.576Z	\N
332	1	6	6073e24d-de92-48cd-b9e4-68e0f301cd42	6	47	2	9	System	2022-01-19T22:30:52.592Z	System	2022-01-19T22:30:52.592Z	\N
333	1	6	0c362f65-2692-47af-9d73-4b5b8fd1c8a9	6	47	2	9	System	2022-01-19T22:30:52.592Z	System	2022-01-19T22:30:52.592Z	\N
334	1	6	ecdb7249-4d78-4912-b5c1-09d4ba4ade7e	6	47	2	9	System	2022-01-19T22:30:52.608Z	System	2022-01-19T22:30:52.608Z	\N
335	1	6	94788bf9-e42f-4874-8afa-dd22c493e5fe	6	47	2	9	System	2022-01-19T22:30:52.608Z	System	2022-01-19T22:30:52.608Z	\N
336	1	6	a99d3f06-7672-4044-883d-45fe9802ed76	6	47	2	9	System	2022-01-19T22:30:52.608Z	System	2022-01-19T22:30:52.608Z	\N
337	1	6	cb5dedeb-0804-4d79-a185-cf7c78354703	6	47	2	9	System	2022-01-19T22:30:52.623Z	System	2022-01-19T22:30:52.623Z	\N
338	1	6	17fe8cd9-d8ab-491c-83e1-8989c156ddd5	6	47	2	9	System	2022-01-19T22:30:52.623Z	System	2022-01-19T22:30:52.623Z	\N
339	1	6	6418a349-5cad-41fd-b1ac-5c38a5e2ebb9	6	47	2	9	System	2022-01-19T22:30:52.639Z	System	2022-01-19T22:30:52.639Z	\N
340	1	6	8b03aaef-4efe-4823-9bd3-98e42ae92da3	6	47	2	9	System	2022-01-19T22:30:52.639Z	System	2022-01-19T22:30:52.639Z	\N
341	1	6	399cc9f7-84c7-4db3-9cba-a3250b3aca1b	6	47	2	9	System	2022-01-19T22:30:52.654Z	System	2022-01-19T22:30:52.654Z	\N
342	1	6	2c6c62d2-39fd-407d-865d-8e836c6f91e5	6	47	2	9	System	2022-01-19T22:30:52.654Z	System	2022-01-19T22:30:52.654Z	\N
343	1	6	00bced2c-a7f0-4ec0-b73f-72b39f910629	6	47	2	9	System	2022-01-19T22:30:52.654Z	System	2022-01-19T22:30:52.654Z	\N
344	1	6	de0e30cf-64a3-4ee5-9389-0438b7830f15	6	47	2	9	System	2022-01-19T22:30:52.654Z	System	2022-01-19T22:30:52.654Z	\N
345	1	6	857c4a8c-f6f7-487c-8150-9eac9780b91a	6	47	2	9	System	2022-01-19T22:30:52.670Z	System	2022-01-19T22:30:52.670Z	\N
346	1	6	8ff20a44-1229-428f-831c-dfca8ea71c70	6	47	2	9	System	2022-01-19T22:30:52.670Z	System	2022-01-19T22:30:52.670Z	\N
347	1	6	cc816a11-d590-4d8d-94cf-a883ece911c5	6	47	2	9	System	2022-01-19T22:30:52.670Z	System	2022-01-19T22:30:52.670Z	\N
348	1	6	92b6ea0a-61ab-4d6f-9e22-b1e1ce9eb523	6	47	2	9	System	2022-01-19T22:30:52.686Z	System	2022-01-19T22:30:52.686Z	\N
349	1	6	bf2c667e-760b-481e-8c3c-60fcc95b49a7	6	47	2	9	System	2022-01-19T22:30:52.686Z	System	2022-01-19T22:30:52.686Z	\N
350	1	6	48f84484-ffaa-41cb-8839-62fcf686be56	6	47	2	9	System	2022-01-19T22:30:52.686Z	System	2022-01-19T22:30:52.686Z	\N
351	1	6	a34bb176-672d-4845-86f7-f10440cf4af9	6	47	2	9	System	2022-01-19T22:30:52.701Z	System	2022-01-19T22:30:52.701Z	\N
352	1	6	cecf0fd7-d739-4e25-8141-16d1377f8a80	6	47	2	9	System	2022-01-19T22:30:52.701Z	System	2022-01-19T22:30:52.701Z	\N
353	1	6	d6b9d987-876f-4e97-8ec9-98db1ab0c1b2	6	47	2	9	System	2022-01-19T22:30:52.701Z	System	2022-01-19T22:30:52.701Z	\N
354	1	6	ff4604ce-5f84-4592-9f4e-5b7e902474e4	6	47	2	9	System	2022-01-19T22:30:52.717Z	System	2022-01-19T22:30:52.717Z	\N
355	1	6	73e039f2-700e-48f4-a47e-4e94842bb8ab	6	47	2	9	System	2022-01-19T22:30:52.717Z	System	2022-01-19T22:30:52.717Z	\N
356	1	6	097321c0-ca2a-4663-a3ef-ba7d51cc1367	6	47	2	9	System	2022-01-19T22:30:52.732Z	System	2022-01-19T22:30:52.732Z	\N
357	1	6	f31d00b6-d34a-409b-a27d-ba5a9552496d	6	47	2	9	System	2022-01-19T22:30:52.732Z	System	2022-01-19T22:30:52.732Z	\N
358	1	6	6e4e14ca-670f-418f-8940-f3ab31dc071b	6	47	2	9	System	2022-01-19T22:30:52.732Z	System	2022-01-19T22:30:52.732Z	\N
359	1	6	1de4762e-5931-46f6-b641-e89112033117	6	47	2	9	System	2022-01-19T22:30:52.748Z	System	2022-01-19T22:30:52.748Z	\N
360	1	6	e7d0a803-dffa-448a-8ca4-57a2c43a6d0c	6	47	2	9	System	2022-01-19T22:30:52.748Z	System	2022-01-19T22:30:52.748Z	\N
361	1	6	3659ef48-dc6d-46c4-be04-7be03716153e	6	47	2	9	System	2022-01-19T22:30:52.764Z	System	2022-01-19T22:30:52.764Z	\N
362	1	6	91740ca6-63d4-4ef9-bd93-1fd5fa8b1ed5	6	47	2	9	System	2022-01-19T22:30:52.764Z	System	2022-01-19T22:30:52.764Z	\N
363	1	6	440af681-a1c3-47bc-81d9-d3d151e78961	6	47	2	9	System	2022-01-19T22:30:52.764Z	System	2022-01-19T22:30:52.764Z	\N
364	1	6	4db1b4c4-fa18-4a5d-9d6d-0686c4539efe	6	47	2	9	System	2022-01-19T22:30:52.779Z	System	2022-01-19T22:30:52.779Z	\N
365	1	6	d22bbbe7-e243-4a31-bb64-428d83024031	6	47	2	9	System	2022-01-19T22:30:52.779Z	System	2022-01-19T22:30:52.779Z	\N
366	1	6	9433a9fe-6e99-4b13-8957-dc58b391c59c	6	47	2	9	System	2022-01-19T22:30:52.795Z	System	2022-01-19T22:30:52.795Z	\N
367	1	6	d061796f-e461-4137-b0f0-86f2c756d0b3	6	47	2	9	System	2022-01-19T22:30:52.795Z	System	2022-01-19T22:30:52.795Z	\N
368	1	6	35a17ef3-21b5-4d9a-a420-c8e451055ae3	6	47	2	9	System	2022-01-19T22:30:52.811Z	System	2022-01-19T22:30:52.811Z	\N
751	1	6	3a13ebc3-5887-432c-a7b7-4c06a0b119b6	13	75	2	13	System	2022-01-19T22:31:19.873Z	System	2022-01-19T22:31:19.873Z	\N
369	2	6	576092e4-898c-46db-9aca-3f8257863e37	6	47	2	32	System	2022-01-19T22:30:52.811Z	System	2022-01-19T22:30:52.811Z	\N
752	1	6	623a8867-98b7-4a4a-b8b8-f3ba17db6df5	13	75	2	13	System	2022-01-19T22:31:19.888Z	System	2022-01-19T22:31:19.888Z	\N
370	2	6	af711d79-4ed9-49ed-a070-d846c865b9c8	6	50	2	34	\N	\N	\N	\N	\N
371	1	6	e2be8a4b-3767-402c-ad69-fe0e6a71a61a	6	24	2	13	System	2022-01-19T22:30:52.889Z	System	2022-01-19T22:30:52.889Z	\N
372	1	6	1f8fa462-7f05-4617-b4c0-2737bec51ee2	6	24	2	13	System	2022-01-19T22:30:52.904Z	System	2022-01-19T22:30:52.904Z	\N
373	1	6	845567a0-b583-4e34-882c-4f7143d00a3d	6	24	2	13	System	2022-01-19T22:30:52.904Z	System	2022-01-19T22:30:52.904Z	\N
374	1	6	8ce9aa39-ce01-4e66-b0ad-e0f5c6c7a805	6	24	2	13	System	2022-01-19T22:30:52.920Z	System	2022-01-19T22:30:52.920Z	\N
375	1	6	60d8eb67-f6a7-46e0-9949-0361351b3847	6	24	2	13	System	2022-01-19T22:30:52.936Z	System	2022-01-19T22:30:52.936Z	\N
376	1	6	84d3410b-e694-4fb3-b33f-5fa9d02d413b	6	24	2	13	System	2022-01-19T22:30:52.936Z	System	2022-01-19T22:30:52.936Z	\N
753	1	6	7d75e751-85f7-44f3-b2ca-a449198c0e1b	13	75	2	13	System	2022-01-19T22:31:19.888Z	System	2022-01-19T22:31:19.888Z	\N
377	3	6	5f7a0494-05c3-49f4-8031-d07fbaed4b95	6	51	2	13	System	2022-01-19T22:30:52.951Z	System	2022-01-19T22:30:52.951Z	\N
378	1	6	d9c5e769-e5f7-4a8b-9a24-e4e27fb75b50	6	24	2	13	System	2022-01-19T22:30:53.014Z	System	2022-01-19T22:30:53.014Z	\N
379	1	6	0be1a37f-f5cf-4786-ab4f-0704796061fe	6	24	2	13	System	2022-01-19T22:30:53.029Z	System	2022-01-19T22:30:53.029Z	\N
380	1	6	018514a5-2ffc-4c27-8a34-9269297651ea	6	24	2	13	System	2022-01-19T22:30:53.029Z	System	2022-01-19T22:30:53.029Z	\N
381	1	6	6c690dd9-d097-4389-88cd-bc6a332d9179	6	24	2	13	System	2022-01-19T22:30:53.045Z	System	2022-01-19T22:30:53.045Z	\N
382	2	6	2404853e-f6e3-4720-8141-05be948fc9c9	6	51	2	13	System	2022-01-19T22:30:53.076Z	System	2022-01-19T22:30:53.076Z	\N
383	2	6	3bbb765b-044b-4ce0-aa16-99711561e43b	6	51	2	13	System	2022-01-19T22:30:53.112Z	System	2022-01-19T22:30:53.112Z	\N
384	2	6	7a6a306b-9be1-4cb7-bbf8-39f4dc47c292	6	51	2	13	System	2022-01-19T22:30:53.159Z	System	2022-01-19T22:30:53.159Z	\N
385	2	6	91db6431-0f33-4527-9f3d-89b6ed59a1e8	6	51	2	13	System	2022-01-19T22:30:53.192Z	System	2022-01-19T22:30:53.192Z	\N
386	2	6	1c3937aa-f319-4d65-8e7b-b4beaf39edb0	6	51	2	13	System	2022-01-19T22:30:53.241Z	System	2022-01-19T22:30:53.241Z	\N
387	2	6	ec534ca3-166b-4a83-a6f9-9fbcb85fd2cd	6	51	2	13	System	2022-01-19T22:30:53.271Z	System	2022-01-19T22:30:53.271Z	\N
388	2	6	885b3bea-d244-43ed-ab7b-15d91fb3de4d	6	51	2	13	System	2022-01-19T22:30:53.301Z	System	2022-01-19T22:30:53.301Z	\N
389	2	6	0c2cdace-ccba-4ddd-8cb2-f3f22cd5de66	6	51	2	13	System	2022-01-19T22:30:53.341Z	System	2022-01-19T22:30:53.341Z	\N
390	2	6	096fa0bb-a394-4ac0-afb0-04bc4ac28974	6	51	2	13	System	2022-01-19T22:30:53.376Z	System	2022-01-19T22:30:53.376Z	\N
391	2	6	3b79435b-5db3-431e-a46a-fb2b49480c5c	6	51	2	13	System	2022-01-19T22:30:53.408Z	System	2022-01-19T22:30:53.408Z	\N
392	2	6	966f72fe-be93-43b3-b1a6-724f2f366dec	6	51	2	13	System	2022-01-19T22:30:53.451Z	System	2022-01-19T22:30:53.451Z	\N
754	1	6	841304d4-497d-406b-85e1-6f302d893708	13	79	2	13	System	2022-01-19T22:31:19.888Z	System	2022-01-19T22:31:19.888Z	\N
755	1	6	11c1e4ee-904a-403e-9746-1327fe3e8b5d	13	75	2	13	System	2022-01-19T22:31:19.904Z	System	2022-01-19T22:31:19.904Z	\N
756	1	6	eddd4b4f-05e9-40eb-8a24-5dbc0322be6f	13	75	2	13	System	2022-01-19T22:31:19.920Z	System	2022-01-19T22:31:19.920Z	\N
757	1	6	fe44d5ea-b861-452e-abe5-809b7c71bb91	13	75	2	13	System	2022-01-19T22:31:19.920Z	System	2022-01-19T22:31:19.920Z	\N
758	1	6	c9b95d3e-ace1-4c3a-a0a4-efafe5608c4d	13	75	2	13	System	2022-01-19T22:31:19.920Z	System	2022-01-19T22:31:19.920Z	\N
759	1	6	1baef7d3-9a7d-4bc4-b12e-90076b9f7534	13	75	2	13	System	2022-01-19T22:31:19.935Z	System	2022-01-19T22:31:19.935Z	\N
760	1	6	fc7ab4a4-6b87-4a07-849a-e763875b9b66	13	75	2	13	System	2022-01-19T22:31:19.935Z	System	2022-01-19T22:31:19.935Z	\N
761	1	6	783b1843-2de4-416f-a6af-f314d4a19305	13	75	2	13	System	2022-01-19T22:31:19.935Z	System	2022-01-19T22:31:19.935Z	\N
762	1	6	f26841ca-bceb-4326-b73a-c036a445b444	13	75	2	13	System	2022-01-19T22:31:19.951Z	System	2022-01-19T22:31:19.951Z	\N
763	1	6	656e815c-b192-46a5-9393-82ab716133c3	13	75	2	13	System	2022-01-19T22:31:19.951Z	System	2022-01-19T22:31:19.951Z	\N
764	1	6	cdd3af78-6332-4c8b-be8f-d422f194d02a	13	75	2	13	System	2022-01-19T22:31:19.967Z	System	2022-01-19T22:31:19.967Z	\N
393	1	6	9e72936f-0794-49ad-b508-533e26c733c5	6	24	2	13	System	2022-01-19T22:30:53.590Z	System	2022-01-19T22:30:53.590Z	\N
394	2	6	878cbb17-850d-4238-a9bc-7b42db49b029	6	51	2	13	System	2022-01-19T22:30:53.625Z	System	2022-01-19T22:30:53.625Z	\N
765	1	6	9d4d3ced-5398-455a-a479-d1eecfa8fced	13	75	2	13	System	2022-01-19T22:31:19.967Z	System	2022-01-19T22:31:19.967Z	\N
396	2	6	258b0f41-d88d-4a5e-b0c3-6cecd1406c1c	6	51	2	13	System	2022-01-19T22:30:53.670Z	System	2022-01-19T22:30:53.670Z	\N
397	1	6	63736efb-fc1c-4310-bc76-070403102356	6	24	2	13	System	2022-01-19T22:30:53.707Z	System	2022-01-19T22:30:53.707Z	\N
398	2	6	a8f964d2-b6fc-4ce9-a7d5-eff6e6cc8d63	6	51	2	13	System	2022-01-19T22:30:53.717Z	System	2022-01-19T22:30:53.717Z	\N
399	2	6	ef5f9892-56d6-4e5a-a452-7643ac0e21d5	6	51	2	13	System	2022-01-19T22:30:53.778Z	System	2022-01-19T22:30:53.778Z	\N
400	2	6	7efe7848-a0e1-49a7-9e8f-9cb4db6009e2	6	51	2	13	System	2022-01-19T22:30:53.805Z	System	2022-01-19T22:30:53.805Z	\N
401	2	6	0c673219-8649-424e-9a20-d59cd5fa900d	6	51	2	13	System	2022-01-19T22:30:53.828Z	System	2022-01-19T22:30:53.828Z	\N
402	2	6	ae35a645-0063-4fed-aab9-64758e9e31ab	6	51	2	13	System	2022-01-19T22:30:53.858Z	System	2022-01-19T22:30:53.858Z	\N
403	2	6	3332acaf-208e-4c24-adf2-a2cdd2d2360e	6	51	2	13	System	2022-01-19T22:30:53.887Z	System	2022-01-19T22:30:53.887Z	\N
404	2	6	c4337b99-5fbe-4ed2-b3b6-98732b6aec37	6	51	2	13	System	2022-01-19T22:30:53.914Z	System	2022-01-19T22:30:53.914Z	\N
405	1	6	e408d36f-248a-435d-bba5-ddc67a9a2c7d	6	24	2	13	System	2022-01-19T22:30:53.950Z	System	2022-01-19T22:30:53.950Z	\N
766	1	6	ba008424-c7ae-49d5-8ba3-1c129dbf4ae4	13	75	2	13	System	2022-01-19T22:31:19.967Z	System	2022-01-19T22:31:19.967Z	\N
767	1	6	1b81fadd-bcc2-4654-8f97-0332c2fdcfae	13	75	2	13	System	2022-01-19T22:31:19.982Z	System	2022-01-19T22:31:19.982Z	\N
406	4	6	fe6e63c8-da61-42c4-937e-8e0ec493443d	6	51	2	13	System	2022-01-19T22:30:53.962Z	System	2022-01-19T22:30:53.962Z	\N
768	1	6	48591b8d-4518-42ab-bc89-7bbe88bcd2f8	13	75	2	13	System	2022-01-19T22:31:19.982Z	System	2022-01-19T22:31:19.982Z	\N
769	1	6	6c549ff0-ed5b-4d44-8076-6bf0c3718c1b	13	75	2	13	System	2022-01-19T22:31:19.982Z	System	2022-01-19T22:31:19.982Z	\N
407	4	6	83868910-cd4b-4ba0-b559-839a5285a5b0	6	51	2	13	System	2022-01-19T22:30:53.996Z	System	2022-01-19T22:30:53.996Z	\N
770	1	6	b399afa6-e17b-4924-bc4e-d3d401d7bdce	13	75	2	13	System	2022-01-19T22:31:19.998Z	System	2022-01-19T22:31:19.998Z	\N
771	1	6	38e93527-c8ac-460d-a5f7-64ef22ea9b77	13	75	2	13	System	2022-01-19T22:31:19.998Z	System	2022-01-19T22:31:19.998Z	\N
408	4	6	2631d803-56a0-4ff2-a84e-69e44acef76c	6	51	2	13	System	2022-01-19T22:30:54.025Z	System	2022-01-19T22:30:54.025Z	\N
772	1	6	e03225e0-c07c-4043-a972-35c0d94afac9	13	75	2	13	System	2022-01-19T22:31:19.998Z	System	2022-01-19T22:31:19.998Z	\N
773	1	6	33b6bc9f-f398-49e7-94bb-f71f633750a4	13	75	2	13	System	2022-01-19T22:31:20.014Z	System	2022-01-19T22:31:20.014Z	\N
409	4	6	2e7fa498-70e1-49d7-b69b-b1536371685f	6	51	2	13	System	2022-01-19T22:30:54.049Z	System	2022-01-19T22:30:54.049Z	\N
774	1	6	ae6184d6-2103-437c-8ecf-5d25c3c05cff	13	75	2	13	System	2022-01-19T22:31:20.014Z	System	2022-01-19T22:31:20.014Z	\N
775	1	6	a50c21fa-2cc2-4217-9c7d-570cd2d8dd25	13	79	2	13	System	2022-01-19T22:31:20.029Z	System	2022-01-19T22:31:20.029Z	\N
776	1	6	fc886458-5b8c-446d-8485-20b2da98ce93	13	75	2	13	System	2022-01-19T22:31:20.029Z	System	2022-01-19T22:31:20.029Z	\N
777	1	6	7975f2d3-f643-4a27-a6b7-136279c0ee9b	13	75	2	13	System	2022-01-19T22:31:20.045Z	System	2022-01-19T22:31:20.045Z	\N
778	1	6	e4214406-834b-42ee-8d3c-dd0569c23db1	13	75	2	13	System	2022-01-19T22:31:20.045Z	System	2022-01-19T22:31:20.045Z	\N
779	1	6	04a823d2-68dd-468d-affe-5f8ee7c952fb	13	75	2	13	System	2022-01-19T22:31:20.060Z	System	2022-01-19T22:31:20.060Z	\N
780	1	6	94d89d0f-1bb2-40d1-9fdd-c1522ceacd89	13	75	2	13	System	2022-01-19T22:31:20.060Z	System	2022-01-19T22:31:20.060Z	\N
781	1	6	0116957d-5900-46c0-b99a-e0e6cb443199	13	75	2	13	System	2022-01-19T22:31:20.060Z	System	2022-01-19T22:31:20.060Z	\N
782	1	6	f34b730b-bc51-45da-994f-3c0cbc49442c	13	75	2	13	System	2022-01-19T22:31:20.076Z	System	2022-01-19T22:31:20.076Z	\N
783	1	6	1fbda61c-6b1f-4a7f-a1ce-61f338fa7f96	13	75	2	13	System	2022-01-19T22:31:20.076Z	System	2022-01-19T22:31:20.076Z	\N
784	1	6	07b2ddcb-d935-442b-9993-868bc2da6575	13	75	2	13	System	2022-01-19T22:31:20.076Z	System	2022-01-19T22:31:20.076Z	\N
785	1	6	2c60cf3e-9bfd-425b-bc5a-e136d4a36f41	13	75	2	13	System	2022-01-19T22:31:20.092Z	System	2022-01-19T22:31:20.092Z	\N
786	1	6	7b683297-a1aa-41ed-834a-3aa2b6247edf	13	75	2	13	System	2022-01-19T22:31:20.092Z	System	2022-01-19T22:31:20.092Z	\N
787	1	6	04f2ee56-a0aa-4463-8b1e-f699ae946f68	13	79	2	13	System	2022-01-19T22:31:20.107Z	System	2022-01-19T22:31:20.107Z	\N
788	1	6	155a69a7-082e-48b0-a97c-b72cffa4dc99	13	75	2	13	System	2022-01-19T22:31:20.107Z	System	2022-01-19T22:31:20.107Z	\N
789	1	6	a24c32ab-06d7-4a97-925f-14b55c84e62a	13	75	2	13	System	2022-01-19T22:31:20.123Z	System	2022-01-19T22:31:20.123Z	\N
410	4	6	1ed11cba-f41c-43e6-82e2-4113a909870f	6	51	2	13	System	2022-01-19T22:30:54.074Z	System	2022-01-19T22:30:54.074Z	\N
790	1	6	e348e973-cf7e-4e30-8044-f404fb32ff60	13	75	2	13	System	2022-01-19T22:31:20.123Z	System	2022-01-19T22:31:20.123Z	\N
791	1	6	28642bbe-0e4e-4f21-92d9-bac59a6f4a2e	13	75	2	13	System	2022-01-19T22:31:20.123Z	System	2022-01-19T22:31:20.123Z	\N
411	4	6	d90e20dc-80c7-47fe-98a6-7c6164e92717	6	51	2	13	System	2022-01-19T22:30:54.096Z	System	2022-01-19T22:30:54.096Z	\N
792	1	6	b8802cb6-6faa-4c9f-861e-e4681e61379c	13	75	2	13	System	2022-01-19T22:31:20.139Z	System	2022-01-19T22:31:20.139Z	\N
793	1	6	3c9e02be-e2b8-4cd3-943f-9e6254e566ce	13	75	2	13	System	2022-01-19T22:31:20.139Z	System	2022-01-19T22:31:20.139Z	\N
412	4	6	197ad1d4-b79a-43ff-8478-d76281aded2f	6	51	2	13	System	2022-01-19T22:30:54.119Z	System	2022-01-19T22:30:54.119Z	\N
413	1	6	26417dbf-d53a-43b0-b1cb-c3b954cb34a8	6	24	2	13	System	2022-01-19T22:30:54.145Z	System	2022-01-19T22:30:54.145Z	\N
794	1	6	6b1ef20e-87ad-43cd-99a7-eacf498bcda6	13	75	2	13	System	2022-01-19T22:31:20.139Z	System	2022-01-19T22:31:20.139Z	\N
795	1	6	31b05de6-408a-4676-a317-b9e3cac972ae	13	75	2	13	System	2022-01-19T22:31:20.139Z	System	2022-01-19T22:31:20.139Z	\N
414	4	6	wf-email-html-ftl	6	51	2	13	System	2022-01-19T22:30:54.158Z	System	2022-01-19T22:30:54.158Z	\N
796	1	6	f8fc214b-d9a0-4e48-92e6-a78157e1b1db	13	75	2	13	System	2022-01-19T22:31:20.154Z	System	2022-01-19T22:31:20.154Z	\N
797	1	6	9a3b9e63-a09e-4f8a-a918-d1dea69933e1	13	75	2	13	System	2022-01-19T22:31:20.154Z	System	2022-01-19T22:31:20.154Z	\N
415	4	6	9eaf3e41-ece8-4915-8b37-fff7adb877ca	6	51	2	13	System	2022-01-19T22:30:54.181Z	System	2022-01-19T22:30:54.181Z	\N
798	1	6	21b65143-90e5-484c-9662-daae840179cd	13	75	2	13	System	2022-01-19T22:31:20.170Z	System	2022-01-19T22:31:20.170Z	\N
799	1	6	88599585-17f9-431e-895b-7a2a32941e42	13	75	2	13	System	2022-01-19T22:31:20.170Z	System	2022-01-19T22:31:20.170Z	\N
416	4	6	1d1fb30b-7eba-44ab-9e8e-e16f5b95d096	6	51	2	13	System	2022-01-19T22:30:54.203Z	System	2022-01-19T22:30:54.203Z	\N
800	1	6	d5558ee7-bbf9-4f9d-aaa5-c5eed412ea27	13	75	2	13	System	2022-01-19T22:31:20.170Z	System	2022-01-19T22:31:20.170Z	\N
801	1	6	129276fc-b810-4136-ab4d-a081239e2d8d	13	75	2	13	System	2022-01-19T22:31:20.185Z	System	2022-01-19T22:31:20.185Z	\N
417	4	6	e2cf9e1a-0f24-4aa6-ab4f-60c013778ddc	6	51	2	13	System	2022-01-19T22:30:54.226Z	System	2022-01-19T22:30:54.226Z	\N
802	1	6	1addd5a9-a182-4337-beed-13e7daab03d3	13	75	2	13	System	2022-01-19T22:31:20.185Z	System	2022-01-19T22:31:20.185Z	\N
803	1	6	6e4983d3-88ed-459c-9054-4c2ac07ca222	13	75	2	13	System	2022-01-19T22:31:20.185Z	System	2022-01-19T22:31:20.185Z	\N
418	4	6	425c6dbc-82a9-470b-98fc-1db51c3345ea	6	51	2	13	System	2022-01-19T22:30:54.246Z	System	2022-01-19T22:30:54.246Z	\N
804	1	6	4985a697-e200-4402-b2bb-019361b09ecd	13	75	2	13	System	2022-01-19T22:31:20.201Z	System	2022-01-19T22:31:20.201Z	\N
805	1	6	def3bc7b-5d11-4df2-b313-bd835178d71f	13	75	2	13	System	2022-01-19T22:31:20.201Z	System	2022-01-19T22:31:20.201Z	\N
419	4	6	2ad2663c-8fc1-47b7-92da-c24ac603879d	6	51	2	13	System	2022-01-19T22:30:54.270Z	System	2022-01-19T22:30:54.270Z	\N
806	1	6	a0329fe0-4e5f-432a-ada0-44fca501ce1a	13	75	2	13	System	2022-01-19T22:31:20.201Z	System	2022-01-19T22:31:20.201Z	\N
807	1	6	5020e208-6899-4fc8-8e15-0b2c21ba7930	13	75	2	13	System	2022-01-19T22:31:20.264Z	System	2022-01-19T22:31:20.264Z	\N
420	4	6	490cef47-9692-482d-a842-b4313bf9fd5f	6	51	2	13	System	2022-01-19T22:30:54.293Z	System	2022-01-19T22:30:54.293Z	\N
421	2	6	8959f65b-dbc8-43fe-bac0-442736fcb6bb	6	51	2	15	System	2022-01-19T22:30:54.335Z	System	2022-01-19T22:30:54.335Z	\N
422	2	6	9d059838-1e3e-4de9-8d77-ebc721792ea8	6	51	2	13	System	2022-01-19T22:30:54.397Z	System	2022-01-19T22:30:54.397Z	\N
808	1	6	67a8255f-b3ce-4f5b-8fe8-d56d81c21900	13	79	2	13	System	2022-01-19T22:31:20.264Z	System	2022-01-19T22:31:20.264Z	\N
809	1	6	1aac956a-8424-4cf1-90c3-1e2709f03e8f	13	75	2	13	System	2022-01-19T22:31:20.295Z	System	2022-01-19T22:31:20.295Z	\N
810	1	6	b4a0441b-ea89-4d07-a258-b39915255ff7	13	75	2	13	System	2022-01-19T22:31:20.310Z	System	2022-01-19T22:31:20.310Z	\N
811	1	6	c51fa369-7e15-4a1c-b40a-375d600d2b91	13	75	2	13	System	2022-01-19T22:31:20.310Z	System	2022-01-19T22:31:20.310Z	\N
812	1	6	93906cf6-7c6f-473d-9334-881b5fbb10c2	13	75	2	13	System	2022-01-19T22:31:20.310Z	System	2022-01-19T22:31:20.310Z	\N
813	1	6	0dc7712e-a53a-44d9-b9e4-ae5dba54774b	13	75	2	13	System	2022-01-19T22:31:20.326Z	System	2022-01-19T22:31:20.326Z	\N
814	1	6	0432a711-fdbe-476b-a7d0-6b773c432263	13	75	2	13	System	2022-01-19T22:31:20.326Z	System	2022-01-19T22:31:20.326Z	\N
815	1	6	25a39593-0eac-4c26-8498-a0491b5d5901	13	75	2	13	System	2022-01-19T22:31:20.342Z	System	2022-01-19T22:31:20.342Z	\N
816	1	6	72a2f426-73de-4ccf-b3c9-ee6d56595f87	13	75	2	13	System	2022-01-19T22:31:20.342Z	System	2022-01-19T22:31:20.342Z	\N
817	1	6	f45f6872-a991-4813-8141-ee72970df8b9	13	75	2	13	System	2022-01-19T22:31:20.342Z	System	2022-01-19T22:31:20.342Z	\N
423	2	6	fe95583b-5d5c-4e8d-9298-7dee27377ee8	6	51	2	13	System	2022-01-19T22:30:54.420Z	System	2022-01-19T22:30:54.420Z	\N
424	2	6	e3825697-324d-4833-82d5-407ef5a30eed	6	51	2	13	System	2022-01-19T22:30:54.439Z	System	2022-01-19T22:30:54.439Z	\N
425	2	6	00b5bed1-b738-4935-87c6-a5953fcc85df	6	51	2	13	System	2022-01-19T22:30:54.479Z	System	2022-01-19T22:30:54.479Z	\N
426	2	6	00c0b53f-6967-4f5f-a352-b2c5292636d0	6	51	2	13	System	2022-01-19T22:30:54.518Z	System	2022-01-19T22:30:54.518Z	\N
427	2	6	6bbec8b0-6047-40c9-aa31-970becdc853c	6	51	2	13	System	2022-01-19T22:30:54.569Z	System	2022-01-19T22:30:54.569Z	\N
818	1	6	21fc2416-f5bb-48a9-a334-64762e8021e7	13	75	2	13	System	2022-01-19T22:31:20.357Z	System	2022-01-19T22:31:20.357Z	\N
429	2	6	97e94058-46e7-469e-b05c-d4ba88f44082	6	51	2	13	System	2022-01-19T22:30:54.623Z	System	2022-01-19T22:30:54.623Z	\N
430	2	6	39c36bf4-43f9-4fb9-b63e-b57e922f7029	6	51	2	13	System	2022-01-19T22:30:54.658Z	System	2022-01-19T22:30:54.658Z	\N
431	2	6	201bf21b-c35d-41cd-bbdb-95a22f95fcf7	6	51	2	13	System	2022-01-19T22:30:54.682Z	System	2022-01-19T22:30:54.682Z	\N
432	2	6	d84b3000-0f0f-4230-9215-40ed2d8b55aa	6	51	2	13	System	2022-01-19T22:30:54.704Z	System	2022-01-19T22:30:54.704Z	\N
433	1	6	e70a0401-e516-463b-a235-2325a28083f1	6	24	2	13	System	2022-01-19T22:30:54.727Z	System	2022-01-19T22:30:54.727Z	\N
434	1	6	25293d9f-74f1-41c3-a3f9-75b830377683	6	24	2	13	System	2022-01-19T22:30:54.738Z	System	2022-01-19T22:30:54.738Z	\N
435	1	6	2bf5660f-5a44-4d1d-8bb5-77f718535a8a	6	24	2	13	System	2022-01-19T22:30:54.752Z	System	2022-01-19T22:30:54.752Z	\N
436	2	6	25cb34eb-a826-47eb-a0e1-4811acc4446c	6	51	2	13	System	2022-01-19T22:30:54.762Z	System	2022-01-19T22:30:54.762Z	\N
437	2	6	40ff3644-75a2-4afd-aa89-93678a216cc0	6	51	2	13	System	2022-01-19T22:30:54.795Z	System	2022-01-19T22:30:54.795Z	\N
438	2	6	35f99fe0-2c1f-435c-8d5a-4f7110706236	6	51	2	13	System	2022-01-19T22:30:54.820Z	System	2022-01-19T22:30:54.820Z	\N
439	2	6	8e07f5b4-3635-435b-9fe5-b820f287764e	6	51	2	13	System	2022-01-19T22:30:54.844Z	System	2022-01-19T22:30:54.844Z	\N
440	2	6	b84ec498-e85b-405e-9341-7a7a5a5d3061	6	51	2	13	System	2022-01-19T22:30:54.870Z	System	2022-01-19T22:30:54.870Z	\N
441	2	6	b2b0a082-44de-4d8b-a500-eb0b074ffdcb	6	51	2	13	System	2022-01-19T22:30:54.893Z	System	2022-01-19T22:30:54.893Z	\N
442	2	6	1503ecb6-d133-4b73-b778-6b17dd046941	6	51	2	13	System	2022-01-19T22:30:54.919Z	System	2022-01-19T22:30:54.919Z	\N
443	2	6	02029719-b5dc-4f29-8f4a-7459f5ba022e	6	51	2	13	System	2022-01-19T22:30:54.945Z	System	2022-01-19T22:30:54.945Z	\N
444	2	6	b66deae8-b30f-4f90-a959-f1c9348d7434	6	51	2	13	System	2022-01-19T22:30:54.973Z	System	2022-01-19T22:30:54.973Z	\N
819	1	6	9a0dc73d-f453-4345-94ed-6ba3d6718c45	13	75	2	13	System	2022-01-19T22:31:20.357Z	System	2022-01-19T22:31:20.357Z	\N
820	1	6	3bf14965-b6d4-4e03-906e-2c62778757a1	13	75	2	13	System	2022-01-19T22:31:20.373Z	System	2022-01-19T22:31:20.373Z	\N
821	1	6	11b52878-bdaf-4ad4-92b1-cce07de3da8f	13	75	2	13	System	2022-01-19T22:31:20.373Z	System	2022-01-19T22:31:20.373Z	\N
822	1	6	349cdf0d-02b9-4a85-b282-b58e153e7e49	13	75	2	13	System	2022-01-19T22:31:20.389Z	System	2022-01-19T22:31:20.389Z	\N
823	1	6	fb74ec62-da08-4b88-8dad-475a12427e4c	13	75	2	13	System	2022-01-19T22:31:20.389Z	System	2022-01-19T22:31:20.389Z	\N
824	1	6	83a8d667-94c9-4b18-aba4-a42d2e56e03b	13	75	2	13	System	2022-01-19T22:31:20.389Z	System	2022-01-19T22:31:20.389Z	\N
825	1	6	75b263cd-6d18-4b63-aa1d-96ec4bbb13b0	13	75	2	13	System	2022-01-19T22:31:20.404Z	System	2022-01-19T22:31:20.404Z	\N
826	1	6	43087e77-aa42-4262-a663-fddc93cc08c2	13	75	2	13	System	2022-01-19T22:31:20.404Z	System	2022-01-19T22:31:20.404Z	\N
827	1	6	3f04f6cd-550a-4592-aa56-9011dff81b4e	13	75	2	13	System	2022-01-19T22:31:20.404Z	System	2022-01-19T22:31:20.404Z	\N
828	1	6	95112efa-917a-49d7-a38d-f06dd829afe8	13	75	2	13	System	2022-01-19T22:31:20.420Z	System	2022-01-19T22:31:20.420Z	\N
829	1	6	9e2bc198-41c6-4cdd-a712-675bf86edd64	13	79	2	13	System	2022-01-19T22:31:20.420Z	System	2022-01-19T22:31:20.420Z	\N
830	1	6	6a276a1d-8616-4ebf-af6a-ce108ea9b852	13	75	2	13	System	2022-01-19T22:31:20.435Z	System	2022-01-19T22:31:20.435Z	\N
831	1	6	c66a201b-cf7c-41b0-84a1-7b8c88e798fb	13	75	2	13	System	2022-01-19T22:31:20.435Z	System	2022-01-19T22:31:20.435Z	\N
832	1	6	a30dc3b9-95e1-4123-b10f-48647dffac81	13	75	2	13	System	2022-01-19T22:31:20.451Z	System	2022-01-19T22:31:20.451Z	\N
833	1	6	a940a198-86d6-4e06-80d9-7160a418ac0b	13	75	2	13	System	2022-01-19T22:31:20.451Z	System	2022-01-19T22:31:20.451Z	\N
834	1	6	67021a0f-84e8-41c0-8fb2-aa3271e92a85	13	75	2	13	System	2022-01-19T22:31:20.451Z	System	2022-01-19T22:31:20.451Z	\N
835	1	6	9c8f0a22-8e1e-4211-a13e-9c2363119d4c	13	75	2	13	System	2022-01-19T22:31:20.467Z	System	2022-01-19T22:31:20.467Z	\N
836	1	6	ef43b63d-7e37-47a6-b5ec-c5aaf77b786f	13	75	2	13	System	2022-01-19T22:31:20.467Z	System	2022-01-19T22:31:20.467Z	\N
837	1	6	6fb0853f-0e33-4def-9c95-427b407e831b	13	75	2	13	System	2022-01-19T22:31:20.482Z	System	2022-01-19T22:31:20.482Z	\N
445	2	6	525a30e9-bf35-4554-93de-b55016a688e2	6	51	2	13	System	2022-01-19T22:30:55.003Z	System	2022-01-19T22:30:55.003Z	\N
446	2	6	d7d4f9a3-8be5-49cb-9f0a-905d57053635	6	51	2	13	System	2022-01-19T22:30:55.028Z	System	2022-01-19T22:30:55.028Z	\N
447	2	6	685a33f8-5820-4461-99d5-a0eb04b64a7f	6	51	2	13	System	2022-01-19T22:30:55.055Z	System	2022-01-19T22:30:55.055Z	\N
448	2	6	38625c60-e0b6-405d-96cd-d651e3e4f551	6	51	2	13	System	2022-01-19T22:30:55.102Z	System	2022-01-19T22:30:55.102Z	\N
449	2	6	3ea08478-b136-4f23-8cc4-7c7ffd09b971	6	51	2	13	System	2022-01-19T22:30:55.124Z	System	2022-01-19T22:30:55.124Z	\N
450	2	6	2c0ad6ea-8fe6-4279-80a1-8cad02592dc2	6	51	2	13	System	2022-01-19T22:30:55.157Z	System	2022-01-19T22:30:55.157Z	\N
451	2	6	6b601848-82a5-404b-b0e7-e5de9d0fd43a	6	51	2	13	System	2022-01-19T22:30:55.342Z	System	2022-01-19T22:30:55.342Z	\N
453	2	6	ce850abe-a653-4843-ac51-ec3c175bc6db	6	51	2	13	System	2022-01-19T22:30:55.394Z	System	2022-01-19T22:30:55.394Z	\N
428	2	6	27f89daa-4d62-4d6d-8592-a68ecc224b83	6	24	2	13	System	2022-01-19T22:30:54.611Z	System	2022-01-19T22:30:54.611Z	\N
452	2	6	130eefc8-2206-4501-8d36-443345f0bcbc	6	24	2	13	System	2022-01-19T22:30:55.383Z	System	2022-01-19T22:30:55.383Z	\N
838	1	6	02c01bcd-91af-4688-bd6f-4e8a2547a6d6	13	75	2	13	System	2022-01-19T22:31:20.482Z	System	2022-01-19T22:31:20.482Z	\N
839	1	6	a28873a1-802c-4639-8433-98d2577d3560	13	75	2	13	System	2022-01-19T22:31:20.482Z	System	2022-01-19T22:31:20.482Z	\N
454	4	6	a9a9f477-5c57-11dc-ad6c-5136d620963c	6	24	2	13	System	2022-01-19T22:30:55.506Z	System	2022-01-19T22:30:55.506Z	\N
455	1	6	c317f789-5c57-11dc-ad6c-5136d620963c	6	59	2	13	System	2022-01-19T22:30:55.524Z	System	2022-01-19T22:30:55.524Z	\N
840	1	6	c34286eb-71cf-467d-9d39-1232a3adc93a	13	75	2	13	System	2022-01-19T22:31:20.498Z	System	2022-01-19T22:31:20.498Z	\N
456	3	6	ceca5a11-5c57-11dc-ad6c-5136d620963c	6	61	2	13	System	2022-01-19T22:30:55.532Z	System	2022-01-19T22:30:55.532Z	\N
457	2	6	c074eb05-5c57-11dc-ad6c-5136d620963c	6	66	2	13	System	2022-01-19T22:30:55.555Z	System	2022-01-19T22:30:55.555Z	\N
458	2	6	c074eb06-5c57-11dc-ad6c-5136d620963c	6	72	2	13	System	2022-01-19T22:30:55.597Z	System	2022-01-19T22:30:55.597Z	\N
459	2	6	d11a167c-5c57-11dc-ad6c-5136d620963c	6	75	2	13	System	2022-01-19T22:30:55.608Z	System	2022-01-19T22:30:55.608Z	\N
460	2	6	c074eb07-5c57-11dc-ad6c-5136d620963c	6	79	2	13	System	2022-01-19T22:30:55.619Z	System	2022-01-19T22:30:55.619Z	\N
461	2	6	d34fbb36-5c57-11dc-ad6c-5136d620963c	6	75	2	13	System	2022-01-19T22:30:55.628Z	System	2022-01-19T22:30:55.628Z	\N
462	1	6	600fbd7a-d6dd-411d-b07d-5d208c0afd93	6	24	2	13	System	2022-01-19T22:30:55.642Z	System	2022-01-19T22:30:55.642Z	\N
463	1	6	2cc4dee8-d653-4075-a828-8e73c886f3d2	6	24	2	13	System	2022-01-19T22:30:55.659Z	System	2022-01-19T22:30:55.659Z	\N
841	1	6	623d926f-bc69-4574-849f-0232dacfb5d1	13	75	2	13	System	2022-01-19T22:31:20.498Z	System	2022-01-19T22:31:20.498Z	\N
842	1	6	7f051ef5-19e8-430d-ba47-17de68ed57f1	13	79	2	13	System	2022-01-19T22:31:20.498Z	System	2022-01-19T22:31:20.498Z	\N
843	1	6	2192d5ad-be12-45be-b661-6f41e5d68e2a	13	75	2	13	System	2022-01-19T22:31:20.514Z	System	2022-01-19T22:31:20.514Z	\N
844	1	6	93eee704-0371-45c0-9a85-907d062987a7	13	75	2	13	System	2022-01-19T22:31:20.529Z	System	2022-01-19T22:31:20.529Z	\N
845	1	6	15961a2d-23f7-4202-a6eb-044ec9df6acf	13	75	2	13	System	2022-01-19T22:31:20.529Z	System	2022-01-19T22:31:20.529Z	\N
846	1	6	05e75ab8-9020-4c4a-a784-8df21c24dd1e	13	75	2	13	System	2022-01-19T22:31:20.529Z	System	2022-01-19T22:31:20.529Z	\N
847	1	6	483ba327-7ffc-41f4-836b-692c054e9cb3	13	75	2	13	System	2022-01-19T22:31:20.545Z	System	2022-01-19T22:31:20.545Z	\N
848	1	6	2c7590f4-2883-49ce-ad93-e834a5011631	13	75	2	13	System	2022-01-19T22:31:20.545Z	System	2022-01-19T22:31:20.545Z	\N
849	1	6	9be1c64a-ecb5-4f32-ba5b-59c802e7fce5	13	75	2	13	System	2022-01-19T22:31:20.545Z	System	2022-01-19T22:31:20.545Z	\N
850	1	6	ae6c480f-6d96-44ed-8cbf-4d7f91001767	13	75	2	13	System	2022-01-19T22:31:20.560Z	System	2022-01-19T22:31:20.560Z	\N
851	1	6	5be7828e-6916-4f0a-83df-438ccc47ae70	13	75	2	13	System	2022-01-19T22:31:20.560Z	System	2022-01-19T22:31:20.560Z	\N
852	1	6	f02f973c-d2d5-414f-9904-9f48f40b3a96	13	75	2	13	System	2022-01-19T22:31:20.576Z	System	2022-01-19T22:31:20.576Z	\N
853	1	6	a7a9ecd5-81d8-4891-90b9-cb9c9a069498	13	75	2	13	System	2022-01-19T22:31:20.576Z	System	2022-01-19T22:31:20.576Z	\N
854	1	6	1278f206-3475-4ed3-8bc6-a38a8cf1b71c	13	75	2	13	System	2022-01-19T22:31:20.592Z	System	2022-01-19T22:31:20.592Z	\N
855	1	6	eb4e9ef4-83e1-437b-a631-558b41217163	13	75	2	13	System	2022-01-19T22:31:20.592Z	System	2022-01-19T22:31:20.592Z	\N
856	1	6	83f6f66c-f937-49ae-b87f-935a0b26db6e	13	75	2	13	System	2022-01-19T22:31:20.592Z	System	2022-01-19T22:31:20.592Z	\N
857	1	6	17b1b383-cdd4-41af-8393-3cfba85430e2	13	75	2	13	System	2022-01-19T22:31:20.607Z	System	2022-01-19T22:31:20.607Z	\N
858	1	6	9dd63060-ae1e-49b7-9fdc-cd3e9050f12a	13	75	2	13	System	2022-01-19T22:31:20.607Z	System	2022-01-19T22:31:20.607Z	\N
464	4	6	05590cd0-607e-11dc-af48-8b100325f217	6	24	2	13	System	2022-01-19T22:30:55.692Z	System	2022-01-19T22:30:55.692Z	\N
465	1	6	1e3a3916-607e-11dc-af48-8b100325f217	6	59	2	13	System	2022-01-19T22:30:55.708Z	System	2022-01-19T22:30:55.708Z	\N
473	2	6	4abcd75a-01f3-4a2d-a7e8-d968ffb71dbb	11	81	2	11	System	2022-01-19T22:30:55.828Z	System	2022-01-19T22:31:16.472Z	\N
466	3	6	1e40c8cc-607e-11dc-af48-8b100325f217	6	61	2	13	System	2022-01-19T22:30:55.713Z	System	2022-01-19T22:30:55.713Z	\N
467	2	6	1e18a751-607e-11dc-af48-8b100325f217	6	66	2	13	System	2022-01-19T22:30:55.725Z	System	2022-01-19T22:30:55.725Z	\N
468	2	6	1e2ddd02-607e-11dc-af48-8b100325f217	6	72	2	13	System	2022-01-19T22:30:55.754Z	System	2022-01-19T22:30:55.754Z	\N
469	2	6	1e74d127-607e-11dc-af48-8b100325f217	6	75	2	13	System	2022-01-19T22:30:55.762Z	System	2022-01-19T22:30:55.762Z	\N
470	2	6	1e2ddd03-607e-11dc-af48-8b100325f217	6	79	2	13	System	2022-01-19T22:30:55.770Z	System	2022-01-19T22:30:55.770Z	\N
471	2	6	1e88cd61-607e-11dc-af48-8b100325f217	6	75	2	13	System	2022-01-19T22:30:55.779Z	System	2022-01-19T22:30:55.779Z	\N
859	1	6	d8a2a853-05b9-4d4b-8d10-097e36a8d127	13	75	2	13	System	2022-01-19T22:31:20.623Z	System	2022-01-19T22:31:20.623Z	\N
472	2	6	tag:tag-root	6	47	2	36	System	2022-01-19T22:30:55.790Z	System	2022-01-19T22:30:55.790Z	\N
860	1	6	13ac3693-fca7-4439-9645-701a702a5c18	13	75	2	13	System	2022-01-19T22:31:20.623Z	System	2022-01-19T22:31:20.623Z	\N
861	1	6	60ebede6-7b69-474b-ac5b-255c26f0e074	13	75	2	13	System	2022-01-19T22:31:20.623Z	System	2022-01-19T22:31:20.623Z	\N
862	1	6	bd7646ec-90fe-4fc5-8841-ef5c505e114b	13	75	2	13	System	2022-01-19T22:31:20.639Z	System	2022-01-19T22:31:20.639Z	\N
863	1	6	solr_facets_root_space	15	230	2	13	System	2022-01-19T22:31:21.910Z	System	2022-01-19T22:31:21.910Z	\N
474	5	6	961893b2-4717-4f7d-a130-eabf8bd5d1f9	6	24	2	11	System	2022-01-19T22:30:55.836Z	System	2022-01-19T22:30:55.836Z	\N
475	4	6	02047e2f-1f6b-4e0e-8b1c-6c58bce1ac05	6	24	2	38	System	2022-01-19T22:30:55.866Z	System	2022-01-19T22:30:55.866Z	\N
476	4	6	48df5202-bdc5-42e1-9f4a-f51757443ad4	6	24	2	40	System	2022-01-19T22:30:55.908Z	System	2022-01-19T22:30:55.908Z	\N
477	2	6	073aaf57-2922-4081-9869-52ec81cd1ba8	6	3	2	42	\N	\N	\N	\N	\N
478	1	6	GROUP_ALFRESCO_ADMINISTRATORS	6	89	2	43	\N	\N	\N	\N	\N
479	1	6	GROUP_EMAIL_CONTRIBUTORS	6	89	2	43	\N	\N	\N	\N	\N
480	1	6	GROUP_SITE_ADMINISTRATORS	6	89	2	43	\N	\N	\N	\N	\N
481	1	6	GROUP_ALFRESCO_SEARCH_ADMINISTRATORS	6	89	2	43	\N	\N	\N	\N	\N
482	1	6	GROUP_ALFRESCO_MODEL_ADMINISTRATORS	6	89	2	43	\N	\N	\N	\N	\N
483	2	6	a61db217-85ee-442d-86d6-b5bd1a28ed4f	6	3	2	44	\N	\N	\N	\N	\N
484	1	6	AUTH.ALF	6	91	2	45	System	2022-01-19T22:30:56.012Z	System	2022-01-19T22:30:56.012Z	\N
485	1	6	APP.DEFAULT	6	91	2	45	System	2022-01-19T22:30:56.082Z	System	2022-01-19T22:30:56.082Z	\N
486	2	6	remote_credentials_container	6	3	2	46	\N	\N	\N	\N	\N
487	2	6	syncset_definitions_container	6	3	2	48	\N	\N	\N	\N	\N
488	1	6	418f899b-286e-4c57-a6fa-28fbf156b78e	6	24	2	13	System	2022-01-19T22:30:56.393Z	System	2022-01-19T22:30:56.393Z	\N
497	2	6	rendering_actions_space	14	24	2	13	System	2022-01-19T22:30:56.551Z	System	2022-01-19T22:31:20.706Z	\N
490	2	6	b8255778-16da-4f32-9b5c-944d74d3f68f	6	51	2	13	System	2022-01-19T22:30:56.419Z	System	2022-01-19T22:30:56.419Z	\N
491	2	6	e3aec249-7472-4c8b-a5bc-8c79ea82610b	6	51	2	13	System	2022-01-19T22:30:56.444Z	System	2022-01-19T22:30:56.444Z	\N
492	1	6	7594d992-d291-4cf8-907e-cf409586fe3d	6	24	2	13	System	2022-01-19T22:30:56.482Z	System	2022-01-19T22:30:56.482Z	\N
493	1	6	d01f692e-0e04-4312-973b-c68c57d8cd2e	6	24	2	13	System	2022-01-19T22:30:56.492Z	System	2022-01-19T22:30:56.492Z	\N
494	1	6	5d50bdcc-2758-48b5-a8f6-f6ff9bf8aa83	6	97	2	13	System	2022-01-19T22:30:56.509Z	System	2022-01-19T22:30:56.509Z	\N
495	1	6	696c279c-e2c5-433e-a535-d2793e7623f4	6	24	2	13	System	2022-01-19T22:30:56.521Z	System	2022-01-19T22:30:56.521Z	\N
496	1	6	93073c61-c74a-40f3-a429-1eec21902b8e	6	24	2	13	System	2022-01-19T22:30:56.534Z	System	2022-01-19T22:30:56.534Z	\N
498	1	6	replication_actions_space	6	24	2	13	System	2022-01-19T22:30:56.567Z	System	2022-01-19T22:30:56.567Z	\N
864	1	6	2f1d8142-2053-4f2f-898e-546d68c83a69	17	24	2	11	admin	2022-01-19T22:34:34.059Z	admin	2022-01-19T22:34:34.059Z	\N
500	1	6	6b737dc2-6787-4636-beab-e63ac7c18151	6	61	2	13	System	2022-01-19T22:30:56.627Z	System	2022-01-19T22:30:56.627Z	\N
501	2	6	f1758808-c770-49a6-a730-8b6f12b0d48c	6	66	2	13	System	2022-01-19T22:30:56.644Z	System	2022-01-19T22:30:56.644Z	\N
502	1	6	c5d2ecae-f277-4ca1-a65a-a6703d8cef2a	6	59	2	13	System	2022-01-19T22:30:56.674Z	System	2022-01-19T22:30:56.674Z	\N
503	1	6	4f5dabf2-6067-4f15-abb2-637a613ac66d	6	79	2	13	System	2022-01-19T22:30:56.680Z	System	2022-01-19T22:30:56.680Z	\N
504	1	6	fc8c2df5-32fe-4197-bf61-1cc673da70b3	6	75	2	13	System	2022-01-19T22:30:56.690Z	System	2022-01-19T22:30:56.690Z	\N
505	1	6	5516cc31-71ac-49bb-81db-26cf0c98f502	6	72	2	13	System	2022-01-19T22:30:56.697Z	System	2022-01-19T22:30:56.697Z	\N
506	1	6	352b20eb-fad1-4156-889c-7a5d811db1ee	6	75	2	13	System	2022-01-19T22:30:56.705Z	System	2022-01-19T22:30:56.705Z	\N
507	1	6	0ae61003-39ae-4819-afc6-dfbefd4030b8	6	24	2	13	System	2022-01-19T22:30:56.716Z	System	2022-01-19T22:30:56.716Z	\N
508	4	6	08443801-e1dd-4521-8dcf-f4ef644426a1	6	51	2	13	System	2022-01-19T22:30:56.732Z	System	2022-01-19T22:30:56.732Z	\N
509	4	6	0864b5bd-d27b-4f0b-a2b1-d11ee86acf50	6	51	2	13	System	2022-01-19T22:30:56.766Z	System	2022-01-19T22:30:56.766Z	\N
510	4	6	c01d1e16-c0c7-4acd-b9d0-7d483eee9546	6	51	2	13	System	2022-01-19T22:30:56.794Z	System	2022-01-19T22:30:56.794Z	\N
511	4	6	50d8dea7-26d0-47ba-8da0-c5a1bf923c64	6	51	2	13	System	2022-01-19T22:30:56.821Z	System	2022-01-19T22:30:56.821Z	\N
873	1	6	0ceedcc0-c654-4995-8be0-387f33f09027	17	24	2	11	admin	2022-01-19T22:34:34.436Z	admin	2022-01-19T22:34:34.436Z	\N
866	2	6	b0cfd5d0-ad81-418b-b1ec-e0c2090628a5	18	51	2	11	admin	2022-01-19T22:34:34.179Z	admin	2022-01-19T22:34:34.713Z	\N
871	3	6	467f2db2-c3a3-4e9f-823a-72b1eed49ccb	17	24	2	11	admin	2022-01-19T22:34:34.408Z	admin	2022-01-19T22:34:34.408Z	\N
867	2	6	6e2e8fda-7e5d-4fbf-a6ce-efe58a7c6d59	18	51	2	11	admin	2022-01-19T22:34:34.228Z	admin	2022-01-19T22:34:34.729Z	\N
872	3	6	464b6114-18c0-4172-9d03-ea88d044cead	17	24	2	11	admin	2022-01-19T22:34:34.422Z	admin	2022-01-19T22:34:34.422Z	\N
865	2	6	41fe2b1a-9cac-4fc6-8349-1807b058d2ae	18	51	2	11	admin	2022-01-19T22:34:34.116Z	admin	2022-01-19T22:34:34.684Z	\N
868	2	6	b0ad3034-970f-4e0d-9e51-f6479c91dd70	18	51	2	11	admin	2022-01-19T22:34:34.274Z	admin	2022-01-19T22:34:34.767Z	\N
869	2	6	7c40e20b-ce92-4d0a-8bfb-d9ce2d242656	18	51	2	11	admin	2022-01-19T22:34:34.323Z	admin	2022-01-19T22:34:34.782Z	\N
870	2	6	17a4af32-7271-4f79-b6c2-e3966759b384	18	51	2	11	admin	2022-01-19T22:34:34.366Z	admin	2022-01-19T22:34:34.798Z	\N
874	2	6	88ec41b6-6b4b-461d-8886-1ee8fbda92c8	18	51	2	11	admin	2022-01-19T22:34:34.468Z	admin	2022-01-19T22:34:34.822Z	\N
876	1	6	85cd326b-f953-428f-b5e5-6a32e44b28fa	19	89	2	43	\N	\N	\N	\N	\N
877	1	6	b2e86757-e91f-4781-b6b0-bbef1ceb70c9	19	89	2	43	\N	\N	\N	\N	\N
878	1	6	7a5cee60-a7af-447f-ba0b-89db88be0dfe	19	89	2	43	\N	\N	\N	\N	\N
879	1	6	0e5b37da-61d1-41f6-bee1-f89e2e34985f	19	89	2	43	\N	\N	\N	\N	\N
880	1	6	a109c4d4-36b3-4028-a0e9-93e06f09a20d	19	89	2	43	\N	\N	\N	\N	\N
881	2	6	ae1ad015-33e6-4050-b2a8-3b79c2b43a64	20	24	2	63	admin	2022-01-19T22:37:34.326Z	admin	2022-01-19T22:37:34.326Z	\N
882	1	6	c1db6266-aff7-4f78-a8f1-5fd01049d431	20	24	2	64	admin	2022-01-19T22:37:34.388Z	admin	2022-01-19T22:37:34.388Z	\N
875	3	6	758652cb-452e-4e53-9f25-fd5ddc015773	24	107	2	61	admin	2022-01-19T22:37:33.838Z	admin	2022-01-19T22:37:47.289Z	\N
32	8	6	2c4adf2e-1e68-4fe8-be3b-338ffdd0d688	26	35	2	28	\N	\N	\N	\N	\N
512	4	6	8fc42db1-fdd3-457e-a46e-3eb0e86f8435	6	51	2	13	System	2022-01-19T22:30:56.846Z	System	2022-01-19T22:30:56.846Z	\N
883	1	6	7da97d2c-feea-4d7b-968b-4ced04b875ea	20	51	2	64	admin	2022-01-19T22:37:34.407Z	admin	2022-01-19T22:37:34.407Z	\N
884	1	6	cb14068f-6672-483a-82a6-87f69526d820	20	51	2	64	admin	2022-01-19T22:37:34.458Z	admin	2022-01-19T22:37:34.458Z	\N
513	4	6	a040fce3-6711-4db7-b756-431cc3369d1c	6	51	2	13	System	2022-01-19T22:30:56.872Z	System	2022-01-19T22:30:56.872Z	\N
885	1	6	71165faf-d2c2-4631-9752-537147c3f2e4	20	51	2	64	admin	2022-01-19T22:37:34.501Z	admin	2022-01-19T22:37:34.501Z	\N
886	1	6	f2fdf062-eebb-4c8a-ba14-f4b939b961e1	20	51	2	64	admin	2022-01-19T22:37:34.541Z	admin	2022-01-19T22:37:34.541Z	\N
514	4	6	46748fa5-ac53-4ea3-b4d3-d4b86c7b7a02	6	51	2	13	System	2022-01-19T22:30:56.897Z	System	2022-01-19T22:30:56.897Z	\N
887	1	6	94b985ea-3364-47f6-8e9f-cfd48ca65de5	20	51	2	64	admin	2022-01-19T22:37:34.580Z	admin	2022-01-19T22:37:34.580Z	\N
515	4	6	4a698686-2dff-4cf7-92f8-4945895db8ec	6	51	2	13	System	2022-01-19T22:30:56.976Z	System	2022-01-19T22:30:56.976Z	\N
890	1	6	3bc0c60d-91ff-45a7-ae27-8bf7f4dead46	20	24	2	64	admin	2022-01-19T22:37:34.640Z	admin	2022-01-19T22:37:34.640Z	\N
516	4	6	b1afd118-4e85-47d6-a0ef-486a5f3eed82	6	51	2	13	System	2022-01-19T22:30:56.997Z	System	2022-01-19T22:30:56.997Z	\N
888	3	6	02bf043d-fa41-484e-8430-d498858a74cb	20	24	2	64	admin	2022-01-19T22:37:34.617Z	admin	2022-01-19T22:37:34.617Z	\N
517	4	6	f46363b0-e37d-4290-88d3-ebb6a1c69282	6	51	2	13	System	2022-01-19T22:30:57.023Z	System	2022-01-19T22:30:57.023Z	\N
889	3	6	23df38ac-e314-4275-854f-945466a4c800	20	24	2	64	admin	2022-01-19T22:37:34.629Z	admin	2022-01-19T22:37:34.629Z	\N
518	4	6	c2c2b2d1-7ac9-4d6c-9c4b-aa1c81351afe	6	51	2	13	System	2022-01-19T22:30:57.044Z	System	2022-01-19T22:30:57.044Z	\N
891	1	6	05fae6a0-4d85-44ba-983a-840958c0c941	20	51	2	64	admin	2022-01-19T22:37:34.664Z	admin	2022-01-19T22:37:34.664Z	\N
519	4	6	edab7295-15f9-401c-adb7-d98f49e46774	6	51	2	13	System	2022-01-19T22:30:57.066Z	System	2022-01-19T22:30:57.066Z	\N
520	4	6	92666943-75a1-4528-a1a5-4d8b36f15b89	6	51	2	13	System	2022-01-19T22:30:57.089Z	System	2022-01-19T22:30:57.089Z	\N
895	1	4	38c4711c-0aca-4b6f-a969-d18f6fffbc4c	29	165	2	60	admin	2022-01-19T22:47:40.422Z	admin	2022-01-19T22:47:40.422Z	\N
896	1	4	e5556f3f-3e8c-4d99-a1e0-06034a9bd785	29	51	2	60	admin	2022-01-19T22:47:40.440Z	admin	2022-01-19T22:47:40.440Z	\N
521	4	6	e738358f-2cd6-4188-b3cd-964de2ed9348	6	51	2	13	System	2022-01-19T22:30:57.109Z	System	2022-01-19T22:30:57.109Z	\N
894	8	6	e0a2499a-8217-439d-b0c1-9eb385bebefe	32	51	2	62	admin	2022-01-19T22:47:40.112Z	admin	2022-01-19T22:47:40.112Z	\N
522	4	6	47bc1c17-bdba-4e44-a873-41efb8f0251d	6	51	2	13	System	2022-01-19T22:30:57.163Z	System	2022-01-19T22:30:57.163Z	\N
892	2	6	add865bb-7d39-4da3-946c-0b000557a469	28	24	2	62	admin	2022-01-19T22:37:47.226Z	admin	2022-01-19T22:47:26.810Z	\N
523	4	6	217ef73e-6736-4e53-a1ac-cde27e46e3b1	6	51	2	13	System	2022-01-19T22:30:57.187Z	System	2022-01-19T22:30:57.187Z	\N
524	4	6	865e062d-f007-4ffe-b64b-53536a1553ce	6	51	2	13	System	2022-01-19T22:30:57.213Z	System	2022-01-19T22:30:57.213Z	\N
901	1	4	762c64cf-d3df-4c67-bb61-b8b63f1b3ff1	33	165	2	60	admin	2022-01-19T22:47:49.912Z	admin	2022-01-19T22:47:49.912Z	\N
525	4	6	9c8fe1fc-22a0-4389-b287-3f4a3eafc09f	6	51	2	13	System	2022-01-19T22:30:57.238Z	System	2022-01-19T22:30:57.238Z	\N
902	1	4	a5aa96c5-e554-4d87-a166-dd03d7d99e4a	33	51	2	60	admin	2022-01-19T22:47:49.950Z	admin	2022-01-19T22:47:49.950Z	\N
910	1	4	ffa1161d-2876-4b04-98ab-bdf4ab6ab32e	37	165	2	60	admin	2022-01-19T22:47:50.719Z	admin	2022-01-19T22:47:50.719Z	\N
526	4	6	ccf3c513-75fd-499f-9e99-49f78ce34526	6	51	2	13	System	2022-01-19T22:30:57.273Z	System	2022-01-19T22:30:57.273Z	\N
900	5	6	cecbc25a-5e1f-4beb-ac58-7e21bbe7e804	33	51	2	62	admin	2022-01-19T22:47:49.755Z	admin	2022-01-19T22:47:49.755Z	\N
527	4	6	cf8f3cdd-91fb-4ba1-946a-a2eeaff4913e	6	51	2	13	System	2022-01-19T22:30:57.297Z	System	2022-01-19T22:30:57.297Z	\N
911	1	4	364ed34d-e539-4698-aade-d9b7ddf47f47	37	51	2	60	admin	2022-01-19T22:47:50.738Z	admin	2022-01-19T22:47:50.738Z	\N
528	4	6	8dd4c988-cb43-4ed6-9e83-9eda9babac20	6	51	2	13	System	2022-01-19T22:30:57.331Z	System	2022-01-19T22:30:57.331Z	\N
904	1	4	d5b3c81d-2895-47ed-ae75-805f6148afda	35	165	2	60	admin	2022-01-19T22:47:50.282Z	admin	2022-01-19T22:47:50.282Z	\N
905	1	4	7a212efd-ea60-46f0-9260-67410b1688a5	35	51	2	60	admin	2022-01-19T22:47:50.306Z	admin	2022-01-19T22:47:50.306Z	\N
529	4	6	f6f3fd1a-3097-40cd-8880-8203242ebf16	6	51	2	13	System	2022-01-19T22:30:57.364Z	System	2022-01-19T22:30:57.364Z	\N
530	2	6	b7c8f3b6-d3d5-4b5c-8442-db6537a86432	6	51	2	13	System	2022-01-19T22:30:57.410Z	System	2022-01-19T22:30:57.410Z	\N
531	2	6	0d5d3c83-1728-4aa3-9a63-6bfb281123da	6	51	2	13	System	2022-01-19T22:30:57.432Z	System	2022-01-19T22:30:57.432Z	\N
532	2	6	18e6b8eb-a04e-402a-8784-3c2f06157c07	6	51	2	13	System	2022-01-19T22:30:57.476Z	System	2022-01-19T22:30:57.476Z	\N
533	2	6	4d24cbaf-3c8a-4367-950a-28b555a68d08	6	51	2	13	System	2022-01-19T22:30:57.501Z	System	2022-01-19T22:30:57.501Z	\N
534	2	6	bcb58827-b352-480e-b231-1cf0a23373ed	6	51	2	13	System	2022-01-19T22:30:57.536Z	System	2022-01-19T22:30:57.536Z	\N
535	2	6	277355d4-8f2d-436b-a475-c88965fa2edf	6	51	2	13	System	2022-01-19T22:30:57.562Z	System	2022-01-19T22:30:57.562Z	\N
909	5	6	89c2308b-2ecc-46f2-8995-f851fa91039f	37	51	2	62	admin	2022-01-19T22:47:50.642Z	admin	2022-01-19T22:47:50.642Z	\N
903	5	6	d2882da6-dbad-4e4a-80f5-ef8380f6f526	35	51	2	62	admin	2022-01-19T22:47:50.188Z	admin	2022-01-19T22:47:50.188Z	\N
907	1	4	e408f5cd-2bab-4702-b47b-54c016cef00a	36	165	2	60	admin	2022-01-19T22:47:50.469Z	admin	2022-01-19T22:47:50.469Z	\N
908	1	4	fc42acf3-f103-401e-80c2-f47f3340d409	36	51	2	60	admin	2022-01-19T22:47:50.482Z	admin	2022-01-19T22:47:50.482Z	\N
906	5	6	053777c9-5ebf-402f-aeff-7e405d3c76dd	36	51	2	62	admin	2022-01-19T22:47:50.410Z	admin	2022-01-19T22:47:50.410Z	\N
536	2	6	53a8b0e2-2f1e-479d-80f5-5f190d0a8468	6	51	2	13	System	2022-01-19T22:30:57.585Z	System	2022-01-19T22:30:57.585Z	\N
537	2	6	13087418-fb0b-4e26-a883-45f213c15707	6	51	2	13	System	2022-01-19T22:30:57.615Z	System	2022-01-19T22:30:57.615Z	\N
538	2	6	363dc8f8-da54-4569-8edc-7242cbf99f74	6	51	2	13	System	2022-01-19T22:30:57.673Z	System	2022-01-19T22:30:57.673Z	\N
539	2	6	922fc6ff-f404-4e56-99e4-19ceeb1035ce	6	51	2	13	System	2022-01-19T22:30:57.702Z	System	2022-01-19T22:30:57.702Z	\N
540	2	6	1a68f17d-5ac1-49ac-bf55-d3e131d5ec4e	6	51	2	13	System	2022-01-19T22:30:57.723Z	System	2022-01-19T22:30:57.723Z	\N
541	2	6	bf8bc1c2-a36c-463c-8462-762f06ce4ea7	6	51	2	13	System	2022-01-19T22:30:57.750Z	System	2022-01-19T22:30:57.750Z	\N
542	2	6	57783d91-a1c8-4c05-9b74-3c7077e4e694	6	51	2	13	System	2022-01-19T22:30:57.792Z	System	2022-01-19T22:30:57.792Z	\N
543	2	6	966680ad-18ee-472a-89ff-e3b05258099e	6	51	2	13	System	2022-01-19T22:30:57.816Z	System	2022-01-19T22:30:57.816Z	\N
544	2	6	282e8528-ac7d-4735-bd53-aae5ee22cce2	6	51	2	13	System	2022-01-19T22:30:57.838Z	System	2022-01-19T22:30:57.838Z	\N
545	2	6	8996da20-c036-44e1-a551-5719d59ed1f4	6	51	2	13	System	2022-01-19T22:30:57.862Z	System	2022-01-19T22:30:57.862Z	\N
546	2	6	49c5ffe2-df93-4408-9725-dc0e33f5d2c6	6	51	2	13	System	2022-01-19T22:30:57.895Z	System	2022-01-19T22:30:57.895Z	\N
547	2	6	0d855b53-411f-48a3-9334-fefb71c2bcee	6	51	2	13	System	2022-01-19T22:30:57.917Z	System	2022-01-19T22:30:57.917Z	\N
548	2	6	f9cde140-b665-4e5a-bccf-9bc4f94f4b1f	6	51	2	13	System	2022-01-19T22:30:57.936Z	System	2022-01-19T22:30:57.936Z	\N
549	2	6	91d71d6e-ce03-4388-8997-7a6c2a413883	6	51	2	13	System	2022-01-19T22:30:57.972Z	System	2022-01-19T22:30:57.972Z	\N
550	2	6	0d419dd7-74c1-4e07-8f28-b808860fc89d	6	51	2	13	System	2022-01-19T22:30:57.997Z	System	2022-01-19T22:30:57.997Z	\N
551	2	6	a0e100e7-8a21-47fe-9e1f-dd939ebaaa8f	6	51	2	13	System	2022-01-19T22:30:58.022Z	System	2022-01-19T22:30:58.022Z	\N
552	2	6	fc84db9b-c18a-4f1b-8836-59af96440e5e	6	51	2	13	System	2022-01-19T22:30:58.051Z	System	2022-01-19T22:30:58.051Z	\N
553	2	6	84218ff4-fc48-4334-bd14-3d16b2bd0702	6	51	2	13	System	2022-01-19T22:30:58.084Z	System	2022-01-19T22:30:58.084Z	\N
554	2	6	9ac64457-7c61-4baf-84d2-e6f2d46c1654	6	51	2	13	System	2022-01-19T22:30:58.110Z	System	2022-01-19T22:30:58.110Z	\N
555	2	6	395f7eac-bde6-4eec-962e-18ab26a4f5a3	6	51	2	13	System	2022-01-19T22:30:58.136Z	System	2022-01-19T22:30:58.136Z	\N
893	3	6	79a7aeeb-d845-4e93-9353-a87dfa5307c5	34	24	2	62	admin	2022-01-19T22:47:26.775Z	admin	2022-01-19T22:47:50.018Z	\N
556	2	6	ea57c8d3-0db4-4991-825f-5ee3f0d43165	6	51	2	13	System	2022-01-19T22:30:58.164Z	System	2022-01-19T22:30:58.164Z	\N
557	2	6	2cffb30a-cd33-4a40-b531-eaabc7850388	6	51	2	13	System	2022-01-19T22:30:58.203Z	System	2022-01-19T22:30:58.203Z	\N
558	2	6	df309dec-ff46-461b-a6d9-25e66261e52d	6	51	2	13	System	2022-01-19T22:30:58.228Z	System	2022-01-19T22:30:58.228Z	\N
559	2	6	47bbab3d-9eb4-4a23-949b-0240cc04fbf1	6	51	2	13	System	2022-01-19T22:30:58.254Z	System	2022-01-19T22:30:58.254Z	\N
560	2	6	2f0e1f27-b43d-44e3-bdf0-f12597b23e38	6	51	2	13	System	2022-01-19T22:30:58.278Z	System	2022-01-19T22:30:58.278Z	\N
561	2	6	cc775f0e-5fa8-4274-9b96-7b481ab3fff2	6	51	2	13	System	2022-01-19T22:30:58.331Z	System	2022-01-19T22:30:58.331Z	\N
562	2	6	54004b79-ebc9-47c5-897f-9f04bfe475ba	6	51	2	13	System	2022-01-19T22:30:58.356Z	System	2022-01-19T22:30:58.356Z	\N
563	2	6	651c6783-1589-448b-a48e-b482229619fc	6	51	2	13	System	2022-01-19T22:30:58.377Z	System	2022-01-19T22:30:58.377Z	\N
564	2	6	27091eab-f471-4b61-b602-4ed88d2c3d6d	6	51	2	13	System	2022-01-19T22:30:58.407Z	System	2022-01-19T22:30:58.407Z	\N
565	2	6	9e4fdfb7-06be-4cf7-acbd-dec37cc5eba1	6	51	2	13	System	2022-01-19T22:30:58.447Z	System	2022-01-19T22:30:58.447Z	\N
566	2	6	c8b95e2c-db93-4993-a600-ead89b87206e	6	51	2	13	System	2022-01-19T22:30:58.472Z	System	2022-01-19T22:30:58.472Z	\N
567	2	6	90d0ffd1-de3f-4bed-9fee-701bc332f4fb	6	51	2	13	System	2022-01-19T22:30:58.502Z	System	2022-01-19T22:30:58.502Z	\N
568	2	6	20a7952d-3ce9-47a3-b4ff-20eb65bcf674	6	51	2	13	System	2022-01-19T22:30:58.528Z	System	2022-01-19T22:30:58.528Z	\N
569	2	6	be4191e9-bbd5-4ec8-8531-5c3e2f398184	6	51	2	13	System	2022-01-19T22:30:58.562Z	System	2022-01-19T22:30:58.562Z	\N
570	2	6	87c81b40-0105-462b-926a-5a70b450868c	6	51	2	13	System	2022-01-19T22:30:58.584Z	System	2022-01-19T22:30:58.584Z	\N
571	2	6	b4bb7386-e05e-404c-97fb-f3edb4fbc65a	6	51	2	13	System	2022-01-19T22:30:58.619Z	System	2022-01-19T22:30:58.619Z	\N
572	2	6	cd093120-d3dd-478e-b2e1-3d77c32d661c	6	51	2	13	System	2022-01-19T22:30:58.641Z	System	2022-01-19T22:30:58.641Z	\N
573	2	6	4684edbd-6514-47d4-b8b2-6f37f610c1a7	6	51	2	13	System	2022-01-19T22:30:58.706Z	System	2022-01-19T22:30:58.706Z	\N
574	2	6	5230eee8-2050-4673-af35-010fbdcaedbb	6	51	2	13	System	2022-01-19T22:30:58.729Z	System	2022-01-19T22:30:58.729Z	\N
575	2	6	a7fe8fa7-5d9d-4c76-b06c-7d41e19d1a2b	6	51	2	13	System	2022-01-19T22:30:58.756Z	System	2022-01-19T22:30:58.756Z	\N
576	2	6	9b23f09f-8fdf-4244-bc0c-ab2fbc87a774	6	51	2	13	System	2022-01-19T22:30:58.783Z	System	2022-01-19T22:30:58.783Z	\N
899	1	6	db64e899-7845-4c8e-8491-664a8eaba0c0	31	149	1	\N	\N	\N	\N	\N	\N
898	2	6	279ffa33-90ee-4efc-b26f-ce03f111ae58	31	142	2	62	admin	2022-01-19T22:47:44.231Z	admin	2022-01-19T22:47:44.231Z	\N
577	2	6	4133fb0e-c84b-4242-879f-1cbb1c08800c	6	51	2	13	System	2022-01-19T22:30:58.818Z	System	2022-01-19T22:30:58.818Z	\N
578	2	6	90e05fe4-2b17-4b16-add0-bf693864d1da	6	51	2	13	System	2022-01-19T22:30:58.841Z	System	2022-01-19T22:30:58.841Z	\N
579	2	6	cf77ee4c-9d88-4ac8-b30c-8967f88453fc	6	51	2	13	System	2022-01-19T22:30:58.867Z	System	2022-01-19T22:30:58.867Z	\N
580	2	6	cb829d58-f841-4f66-b489-9b23fd3585ad	6	51	2	13	System	2022-01-19T22:30:58.888Z	System	2022-01-19T22:30:58.888Z	\N
581	1	6	publishing_root_space	6	103	2	13	System	2022-01-19T22:30:58.929Z	System	2022-01-19T22:30:58.929Z	\N
14	4	6	f59e4954-20a1-4edf-8e16-be7c3a1de885	16	24	2	12	System	2022-01-19T22:30:47.842Z	System	2022-01-19T22:31:21.936Z	\N
582	2	6	downloads_container	6	3	2	50	\N	\N	\N	\N	\N
583	3	6	b5cd3f51-9da6-4dbf-96fc-852f0c3f2f6d	6	104	2	19	System	2022-01-19T22:30:59.069Z	System	2022-01-19T22:30:59.069Z	\N
489	2	6	b7fbbd19-0bf4-4aea-a0f2-bd8a806c87be	6	24	2	13	System	2022-01-19T22:30:56.405Z	System	2022-01-19T22:30:59.100Z	\N
395	2	6	a91a332d-2582-4e3a-822e-c7af1054567c	6	24	2	13	System	2022-01-19T22:30:53.654Z	System	2022-01-19T22:30:59.100Z	\N
13	3	6	e321a34e-4e10-435e-9aa9-fc341ff9f5e7	6	24	2	10	System	2022-01-19T22:30:47.654Z	System	2022-01-19T22:30:59.100Z	\N
15	2	6	2ab7df56-f338-4ed7-9ca7-36cf65c6654f	6	24	2	13	System	2022-01-19T22:30:47.951Z	System	2022-01-19T22:30:59.100Z	\N
16	2	6	bd5d08e5-6a6c-45fd-888b-52840bd38897	6	24	2	13	System	2022-01-19T22:30:47.982Z	System	2022-01-19T22:30:59.100Z	\N
17	2	6	9fd12849-5ac9-4c0d-947e-7cfe9f4542f9	6	24	2	13	System	2022-01-19T22:30:48.036Z	System	2022-01-19T22:30:59.100Z	\N
19	3	6	6018029e-f394-47cc-949e-9c0317a82958	6	24	2	14	System	2022-01-19T22:30:48.107Z	System	2022-01-19T22:30:59.100Z	\N
499	2	6	ab04fb73-8e64-4e7b-89ea-305018f6a446	6	59	2	13	System	2022-01-19T22:30:56.603Z	System	2022-01-19T22:30:59.100Z	\N
23	3	6	fa42a583-353b-46bb-8357-ec887b87caba	6	24	2	18	System	2022-01-19T22:30:48.373Z	System	2022-01-19T22:30:59.100Z	\N
584	2	6	d332c221-b225-479b-a0e6-f05568d7f898	8	51	2	13	System	2022-01-19T22:31:09.748Z	System	2022-01-19T22:31:09.748Z	\N
21	3	6	ddb37454-8dbe-4ec7-84ad-eb283d564242	9	24	2	13	System	2022-01-19T22:30:48.295Z	System	2022-01-19T22:31:09.842Z	\N
586	1	6	6129abda-7021-4ffa-8486-8d2e866475fa	10	89	2	43	\N	\N	\N	\N	\N
587	1	6	22059213-0388-479c-98db-6795db2941f7	10	91	2	45	admin	2022-01-19T22:31:10.076Z	admin	2022-01-19T22:31:10.076Z	\N
588	1	6	55f7372d-3b2b-4795-bdeb-50bda3a61937	10	89	2	43	\N	\N	\N	\N	\N
589	1	6	733c2624-f4c2-4ce8-b185-89072ae0cf61	10	89	2	43	\N	\N	\N	\N	\N
590	1	6	0a1427df-8776-4ca8-9032-d2cfd8646679	10	89	2	43	\N	\N	\N	\N	\N
591	1	6	c06fc835-8065-416b-8d7f-85bd83be4ec4	10	89	2	43	\N	\N	\N	\N	\N
592	1	1	eedbc083-548e-4a25-a54d-45671ebd54d0	10	5	2	2	\N	\N	\N	\N	\N
593	1	1	7b6c2624-aec7-479c-a754-d6047fb1a225	10	5	2	2	\N	\N	\N	\N	\N
594	2	6	dc103838-645f-43c1-8a2a-bc187e13c343	10	35	2	54	\N	\N	\N	\N	\N
595	5	6	d65a4795-578e-4780-9f27-96ce43bde700	10	51	2	55	abeecher	2015-09-29T10:45:15.729Z	abeecher	2015-09-29T10:45:15.729Z	\N
596	5	6	198500fc-1e99-4f5f-8926-248cea433366	10	142	2	55	abeecher	2015-09-29T10:45:16.111Z	abeecher	2015-09-29T10:45:16.111Z	\N
597	2	6	b6d80d49-21cc-4f04-9c92-e7063037543f	10	35	2	56	\N	\N	\N	\N	\N
598	5	6	42881f63-38cf-479d-a303-52e7ff99cb75	10	51	2	57	mjackson	2015-09-29T10:44:47.877Z	mjackson	2015-09-29T10:44:47.877Z	\N
599	5	6	3fbde500-298b-4e80-ae50-e65a5cbc2c4d	10	142	2	57	mjackson	2015-09-29T10:44:48.322Z	mjackson	2015-09-29T10:44:48.322Z	\N
600	1	6	dec10f54-5a75-4755-82a3-75fe1d746f5d	10	149	1	\N	\N	\N	\N	\N	\N
601	5	6	b4cff62a-664d-4d45-9302-98723eac1319	10	107	4	58	mjackson	2011-02-15T20:16:27.080Z	mjackson	2011-02-15T20:16:27.080Z	\N
602	4	6	8f2105b4-daaf-4874-9e8a-2152569d109b	10	24	4	59	mjackson	2011-02-15T20:16:28.292Z	mjackson	2011-02-15T20:16:28.292Z	\N
604	3	6	e0856836-ed5e-4eee-b8e5-bd7e8fb9384c	10	24	4	59	mjackson	2011-02-15T21:01:29.482Z	mjackson	2011-02-15T21:01:29.482Z	\N
606	1	4	6b07e011-bc0e-4eea-a2f2-f075edb1c69b	10	165	2	60	System	2022-01-19T22:31:11.857Z	System	2022-01-19T22:31:11.857Z	\N
607	2	4	f48ed8f7-68f8-4cbb-9974-6ae26d7cf2af	10	51	4	60	System	2022-01-19T22:31:11.873Z	System	2022-01-19T22:31:11.873Z	\N
605	9	6	1a0b110f-1e09-4ca2-b367-fe25e4964a4e	10	51	4	59	abeecher	2011-02-15T21:26:54.600Z	admin	2011-06-14T10:28:54.714Z	\N
608	5	6	d27ef7b9-7f2f-41c3-8069-cdd48c8714a1	10	142	4	59	abeecher	2011-02-15T21:26:55.401Z	abeecher	2011-02-16T10:34:06.014Z	\N
609	5	6	3f66a51e-580c-4c67-b183-a5d73cdbdd78	10	142	4	59	mjackson	2011-02-16T10:13:43.173Z	abeecher	2011-02-16T10:34:06.012Z	\N
610	3	6	880a0f47-31b1-4101-b20b-4d325e54e8b1	10	24	4	59	mjackson	2011-02-15T21:04:41.894Z	mjackson	2011-02-15T21:04:41.894Z	\N
611	6	6	7bb9c846-fcc5-43b5-a893-39e46ebe94d4	10	51	4	59	abeecher	2011-03-03T10:34:52.092Z	abeecher	2011-03-03T10:34:52.092Z	\N
612	5	6	7e72bcb1-23e3-4d38-a61b-02f8cbe7b8c9	10	142	4	59	abeecher	2011-03-03T10:34:58.796Z	abeecher	2011-03-03T10:34:58.796Z	\N
613	6	6	74cd8a96-8a21-47e5-9b3b-a1b3e296787d	10	51	4	59	abeecher	2011-03-03T10:34:52.102Z	abeecher	2011-03-03T10:34:52.102Z	\N
614	5	6	ac5c46db-719c-40d3-aa0c-e51b23fe5c32	10	142	4	59	abeecher	2011-03-03T10:34:58.758Z	abeecher	2011-03-03T10:34:58.758Z	\N
615	6	6	80a94ac8-3ece-47ad-864e-5d939424c47c	10	51	4	59	abeecher	2011-03-03T10:34:52.139Z	abeecher	2011-03-03T10:34:52.139Z	\N
616	5	6	242ddf76-d864-4db3-8705-b012c4a48e51	10	142	4	59	abeecher	2011-03-03T10:34:59.473Z	abeecher	2011-03-03T10:34:59.473Z	\N
617	5	6	f2f3dc4b-7ced-49fc-8e85-ce53a459dd87	10	142	4	59	mjackson	2011-03-03T11:00:15.197Z	mjackson	2011-03-03T11:00:15.197Z	\N
618	6	6	267839b2-f466-42c5-9a35-cb3e41281bb9	10	51	4	59	abeecher	2011-03-03T10:34:52.620Z	abeecher	2011-03-03T10:34:52.620Z	\N
619	5	6	9a7a891a-0db3-49dd-bd8d-8340f9c1cee8	10	142	4	59	abeecher	2011-03-03T10:35:00.221Z	abeecher	2011-03-03T10:35:00.221Z	\N
620	6	6	1f4ce811-1c61-4553-ac23-63b68bf1d121	10	51	4	59	abeecher	2011-03-03T10:34:52.623Z	abeecher	2011-03-03T10:34:52.623Z	\N
621	5	6	d20da3de-d4cd-4e28-892c-261e4c3b2669	10	142	4	59	abeecher	2011-03-03T10:35:00.614Z	abeecher	2011-03-03T10:35:00.614Z	\N
622	6	6	0516a5cc-fc04-4512-a4ed-b595b7c3908b	10	51	4	59	abeecher	2011-03-03T10:34:52.784Z	abeecher	2011-03-03T10:34:52.784Z	\N
623	5	6	38db832f-8279-460f-99b8-fed560c8da8e	10	142	4	59	abeecher	2011-03-03T10:35:00.838Z	abeecher	2011-03-03T10:35:00.838Z	\N
624	6	6	0f672fb8-bbdb-41bb-84f3-7b9bb1c39b30	10	51	4	59	abeecher	2011-03-03T10:34:53.458Z	abeecher	2011-03-03T10:34:53.458Z	\N
625	5	6	900ebb9a-2596-40e5-ab51-add0bfdf751f	10	142	4	59	abeecher	2011-03-03T10:35:01.920Z	abeecher	2011-03-03T10:35:01.920Z	\N
626	6	6	14e2200e-9f1c-4274-8b6b-95dc9d59d204	10	51	4	59	abeecher	2011-03-03T10:34:53.482Z	abeecher	2011-03-03T10:34:53.482Z	\N
627	5	6	a6bd3f86-99d3-4cde-b945-887fc3255859	10	142	4	59	abeecher	2011-03-03T10:35:01.509Z	abeecher	2011-03-03T10:35:01.509Z	\N
628	6	6	052539b7-872d-46cc-a7f1-1e0757ed4a5b	10	51	4	59	abeecher	2011-03-03T10:34:53.551Z	abeecher	2011-03-03T10:34:53.551Z	\N
629	5	6	0cbca5ac-84f9-4d07-a2fe-c54c911eebb5	10	142	4	59	abeecher	2011-03-03T10:34:59.319Z	abeecher	2011-03-03T10:34:59.319Z	\N
630	6	6	edcbdf18-36ac-4602-ac3d-79dd7aab7ae4	10	51	4	59	abeecher	2011-03-03T10:34:53.892Z	abeecher	2011-03-03T10:34:53.892Z	\N
631	5	6	bf581ca9-e270-413d-9796-635544674781	10	142	4	59	abeecher	2011-03-03T10:35:01.313Z	abeecher	2011-03-03T10:35:01.313Z	\N
632	6	6	72948f84-4bf1-4ec5-8378-1bed0951600a	10	51	4	59	abeecher	2011-03-03T10:34:53.982Z	abeecher	2011-03-03T10:34:53.982Z	\N
633	5	6	82ee74ea-a596-4d62-b689-ddfe0f7e8c16	10	142	4	59	abeecher	2011-03-03T10:34:59.646Z	abeecher	2011-03-03T10:34:59.646Z	\N
634	3	6	b1a98357-4f7a-470d-bf4c-327501158689	10	24	4	59	mjackson	2011-02-15T21:05:49.308Z	mjackson	2011-02-15T21:05:49.308Z	\N
635	7	6	79a03a3e-a027-4b91-9f14-02b62723591e	10	51	4	59	abeecher	2011-03-03T10:36:45.396Z	abeecher	2011-03-03T10:36:45.396Z	\N
636	5	6	e6758089-d817-4bd8-b328-7c2c693c8cf1	10	142	4	59	abeecher	2011-03-03T10:36:48.359Z	abeecher	2011-03-03T10:36:48.359Z	\N
637	7	6	3deb5413-2c1d-4015-b9c9-2be9648446bc	10	51	4	59	abeecher	2011-03-03T10:36:45.431Z	abeecher	2011-03-03T10:36:45.431Z	\N
638	5	6	e751b9c9-de51-4eac-8b5c-905afbeb667a	10	142	4	59	abeecher	2011-03-03T10:36:48.376Z	abeecher	2011-03-03T10:36:48.376Z	\N
639	3	6	610771be-4d82-479a-a2d7-796adf498084	10	24	4	59	mjackson	2011-02-15T21:14:44.396Z	mjackson	2011-02-15T21:14:44.396Z	\N
640	6	6	43485b48-2ca7-4077-a00c-9bfe810f9fa1	10	51	4	59	abeecher	2011-03-03T10:37:17.994Z	abeecher	2011-03-03T10:37:17.994Z	\N
641	5	6	ad46dd6b-51b3-4bc5-bab8-4b9d4e64f07f	10	142	4	59	abeecher	2011-03-03T10:37:20.937Z	abeecher	2011-03-03T10:37:20.937Z	\N
642	6	6	4d4a272d-60d5-4810-8164-4a1e595d92f2	10	51	4	59	abeecher	2011-03-03T10:37:18.155Z	abeecher	2011-03-03T10:37:18.155Z	\N
643	5	6	8aa76706-4a23-468a-b7b6-4ae8907d629d	10	142	4	59	abeecher	2011-03-03T10:37:20.795Z	abeecher	2011-03-03T10:37:20.795Z	\N
644	5	6	582260e9-672c-4aff-a970-8129650adb72	10	142	4	59	mjackson	2011-03-03T11:00:01.795Z	mjackson	2011-03-03T11:00:01.795Z	\N
645	7	6	7d90c94c-fcf7-4f79-9273-bd1352bbb612	10	51	4	59	abeecher	2011-03-03T10:37:18.155Z	abeecher	2011-03-03T10:37:18.155Z	\N
646	5	6	285b85d9-bcfe-4315-b92a-4cb5b8988871	10	142	4	59	abeecher	2011-03-03T10:37:21.297Z	abeecher	2011-03-03T10:37:21.297Z	\N
647	5	6	9c52032a-576f-4ab3-8620-7598f67592bd	10	142	4	59	mjackson	2011-03-03T10:57:02.996Z	mjackson	2011-03-03T10:57:02.996Z	\N
648	3	6	1d26e465-dea3-42f3-b415-faa8364b9692	10	24	4	59	abeecher	2011-03-08T10:34:50.822Z	abeecher	2011-03-08T10:34:50.822Z	\N
651	3	6	d56afdc3-0174-4f8c-bce8-977cafd712ab	10	24	4	59	mjackson	2011-02-15T21:12:14.908Z	mjackson	2011-02-15T21:12:14.908Z	\N
652	6	6	723a0cff-3fce-495d-baa3-a3cd245ea5dc	10	51	4	59	mjackson	2011-03-03T10:33:35.274Z	mjackson	2011-03-03T10:33:35.274Z	\N
653	5	6	eb9d0356-9f9e-4503-a9f0-0ed4f0075ca7	10	142	4	59	mjackson	2011-03-03T10:33:39.687Z	mjackson	2011-03-03T10:33:39.687Z	\N
654	6	6	7bb7bfa8-997e-4c55-8bd9-2e5029653bc8	10	51	4	59	mjackson	2011-03-03T10:33:35.301Z	mjackson	2011-03-03T10:33:35.301Z	\N
655	5	6	234e1322-d8c5-4d06-8690-7a96dbb9e914	10	142	4	59	mjackson	2011-03-03T10:33:39.695Z	mjackson	2011-03-03T10:33:39.695Z	\N
656	6	6	5fa74ad3-9b5b-461b-9df5-de407f1f4fe7	10	51	4	59	mjackson	2011-02-15T21:35:26.467Z	mjackson	2011-02-15T21:35:26.467Z	\N
657	5	6	09d1a4bf-d8f2-4de6-913c-934205a3e910	10	142	4	59	mjackson	2011-02-16T10:17:05.469Z	mjackson	2011-02-16T10:17:05.469Z	\N
658	5	6	1d74ba8f-b858-4e72-83fd-c1433ef2b1b7	10	142	4	59	mjackson	2011-02-16T10:17:06.658Z	mjackson	2011-02-16T10:17:06.658Z	\N
659	3	6	18a9bfef-81ca-4cf1-9dae-07eef1c5b175	10	196	4	59	mjackson	2011-02-16T10:30:10.642Z	mjackson	2011-02-16T10:30:10.642Z	\N
660	3	6	b7ba359a-b3df-4c0a-a763-df0b8b19a737	10	198	4	59	mjackson	2011-02-16T10:30:10.656Z	mjackson	2011-02-16T10:30:10.656Z	\N
661	4	6	86796712-4dc6-4b8d-973f-a943ef7f23ed	10	199	4	59	mjackson	2011-02-16T10:30:10.663Z	mjackson	2011-02-16T10:30:10.663Z	\N
662	3	6	a211774d-ba6d-4a35-b97f-dacfaac7bde3	10	24	4	59	mjackson	2011-02-15T21:16:26.500Z	mjackson	2011-02-15T21:16:26.500Z	\N
663	5	6	f3bb5d08-9fd1-46da-a94a-97f20f1ef208	10	51	4	59	mjackson	2011-02-24T16:16:37.286Z	mjackson	2011-02-24T16:16:37.286Z	\N
664	5	6	cbff1e97-dc79-41a9-adf0-09a2f697759e	10	142	4	59	mjackson	2011-02-24T16:16:44.342Z	mjackson	2011-02-24T16:16:44.342Z	\N
665	5	6	a2361514-eec8-4a7f-a16a-bed654b097b2	10	142	4	59	mjackson	2011-02-24T16:16:47.280Z	mjackson	2011-02-24T16:16:47.280Z	\N
666	5	6	150398b3-7f82-4cf6-af63-c450ef6c5eb8	10	51	4	59	mjackson	2011-02-24T16:16:37.300Z	mjackson	2011-02-24T16:16:37.300Z	\N
667	5	6	e54bccbb-6b04-449b-a9e6-830882d9b978	10	142	4	59	mjackson	2011-02-24T16:16:43.674Z	mjackson	2011-02-24T16:16:43.674Z	\N
668	5	6	59b60ea3-5fa8-440c-a846-8222d62e07a3	10	142	4	59	mjackson	2011-02-24T17:16:04.464Z	mjackson	2011-02-24T17:16:04.464Z	\N
669	5	6	a8290263-4178-48f5-a0b0-be155a424828	10	51	4	59	mjackson	2011-02-24T16:16:37.332Z	mjackson	2011-02-24T16:16:37.332Z	\N
670	5	6	9b8ce6d7-67eb-4918-ae0b-f5f9f0533c0b	10	142	4	59	mjackson	2011-02-24T16:16:45.489Z	mjackson	2011-02-24T16:16:45.489Z	\N
671	5	6	928d2e14-8869-41f6-a2bc-489a37baa560	10	142	4	59	mjackson	2011-02-24T17:16:25.660Z	mjackson	2011-02-24T17:16:25.660Z	\N
672	3	6	38745585-816a-403f-8005-0a55c0aec813	10	24	4	59	mjackson	2011-02-15T21:18:38.144Z	mjackson	2011-02-15T21:18:38.144Z	\N
673	5	6	5515d3e1-bb2a-42ed-833c-52802a367033	10	51	4	59	mjackson	2011-03-03T10:31:30.596Z	mjackson	2011-03-03T10:31:31.651Z	\N
674	5	6	e725ee47-62c6-4ae9-a761-9b69ba2835c5	10	142	4	59	mjackson	2011-03-03T10:32:15.048Z	mjackson	2011-03-03T10:32:15.048Z	\N
675	5	6	41c25437-ce2e-47e1-8e3d-a2f3008e7456	10	142	4	59	mjackson	2011-03-03T10:32:32.773Z	mjackson	2011-03-03T10:32:32.773Z	\N
676	5	6	99cb2789-f67e-41ff-bea9-505c138a6b23	10	51	4	59	mjackson	2011-03-03T10:31:30.596Z	mjackson	2011-03-03T10:31:31.651Z	\N
677	5	6	8024c190-0aa9-4d69-b5a3-cd1cfe9c7ecc	10	142	4	59	mjackson	2011-03-03T10:32:23.462Z	mjackson	2011-03-03T10:32:23.462Z	\N
678	5	6	1cffebce-c758-4071-a6ae-1e5730015e81	10	142	4	59	mjackson	2011-03-03T10:33:17.246Z	mjackson	2011-03-03T10:33:17.246Z	\N
679	4	6	0e24b99c-41f0-43e1-a55e-fb9f50d73820	10	24	4	59	mjackson	2011-02-15T20:18:59.808Z	mjackson	2011-02-15T20:18:59.808Z	\N
682	4	6	64f69e69-f61e-42a3-8697-95eea1f2bda2	10	24	4	59	mjackson	2011-02-15T20:19:00.007Z	mjackson	2011-02-15T20:19:00.007Z	\N
683	3	6	a534356f-8dd6-4d9a-8ffb-dc1adb140c01	10	204	4	59	abeecher	2011-02-15T22:14:39.548Z	abeecher	2011-02-15T22:14:39.548Z	\N
684	3	6	4b9ebe73-7b19-4aaf-b596-5e545544e2a6	10	206	4	59	abeecher	2011-02-15T22:15:49.142Z	abeecher	2011-02-15T22:15:49.142Z	\N
686	3	6	a53c7a85-12d0-4eb1-8e03-f030e0778da3	10	206	4	59	abeecher	2011-02-15T22:19:20.437Z	abeecher	2011-02-15T22:19:20.437Z	\N
687	3	6	e57195d3-aeda-432d-bfc4-0a556b2d8ab9	10	206	4	59	abeecher	2011-02-15T22:23:00.750Z	abeecher	2011-02-15T22:23:00.750Z	\N
688	3	6	fc50d8a0-1bac-430e-b13d-3ac271c6578e	10	204	4	59	abeecher	2011-02-15T22:27:06.046Z	abeecher	2011-02-24T17:41:49.912Z	\N
691	3	6	8d4429e7-804f-43cf-bd81-288e561db9a8	10	213	4	59	abeecher	2011-02-15T22:30:39.843Z	abeecher	2011-02-15T22:30:39.843Z	\N
694	4	6	cdefb3a9-8f55-4771-a9e3-06fa370250f6	10	24	4	59	mjackson	2011-02-15T21:46:01.603Z	mjackson	2011-02-15T21:46:01.603Z	\N
696	1	4	0fe34644-4bb1-4d2a-bcfa-23654fe1dfa4	10	165	2	60	System	2022-01-19T22:31:15.201Z	System	2022-01-19T22:31:15.201Z	\N
697	2	4	975d00b6-e893-402d-8239-6030e9d00cff	10	51	4	60	System	2022-01-19T22:31:15.217Z	System	2022-01-19T22:31:15.217Z	\N
699	1	4	5897579c-43cb-4fae-a819-dee5e7aa3913	10	165	2	60	System	2022-01-19T22:31:15.310Z	System	2022-01-19T22:31:15.310Z	\N
700	2	4	f59cedc4-d75a-4f3e-a964-7505d80466ae	10	51	4	60	System	2022-01-19T22:31:15.310Z	System	2022-01-19T22:31:15.310Z	\N
702	1	4	9b0254b9-cc6a-4f86-86fb-2a1520c1abc8	10	165	2	60	System	2022-01-19T22:31:15.389Z	System	2022-01-19T22:31:15.389Z	\N
703	2	4	d9a0b397-9f70-4f1e-a608-14169ca081e1	10	51	4	60	System	2022-01-19T22:31:15.404Z	System	2022-01-19T22:31:15.404Z	\N
704	4	6	059c5bc7-2d38-4dc5-96b8-d09cd3c69b4c	10	24	4	59	mjackson	2011-02-15T22:04:54.290Z	mjackson	2011-02-15T22:04:54.290Z	\N
706	4	6	42226a03-34a8-43b0-bb37-d86cd09353f7	10	199	4	59	mjackson	2011-02-15T22:05:46.902Z	mjackson	2011-02-15T22:05:46.902Z	\N
711	4	6	308ad851-b4ab-4f41-bbd0-c83398d2afe4	10	199	4	59	mjackson	2011-02-15T22:06:21.034Z	mjackson	2011-02-15T22:06:21.034Z	\N
713	3	6	0db6f5ce-35b6-40df-9216-c9cf0aaf0961	10	24	4	59	admin	2011-06-14T14:11:32.858Z	admin	2011-06-14T14:11:32.858Z	\N
714	3	6	fa555056-bd0c-4c59-ac9f-1ab5b0e18e27	10	24	4	59	admin	2011-06-14T14:15:58.746Z	admin	2011-06-14T14:15:58.746Z	\N
715	3	6	2edddd3a-2df8-4887-93ad-b33aa073c539	10	24	4	59	admin	2011-06-14T14:16:06.229Z	admin	2011-06-14T14:16:06.229Z	\N
716	3	6	0f746f38-4163-492e-92b2-73ecf7b31fa2	10	24	4	59	admin	2011-06-14T14:16:36.303Z	admin	2011-06-14T14:16:36.303Z	\N
717	4	6	8915ce60-7845-40a2-b74e-4837afdb45a0	10	51	4	59	admin	2011-06-14T14:16:40.866Z	admin	2011-06-14T14:16:40.933Z	\N
718	3	6	ea915509-f71c-4b81-a600-cd96ddb9fce6	10	24	4	59	admin	2011-06-14T14:16:51.808Z	admin	2011-06-14T14:16:51.808Z	\N
719	4	6	0fb80b90-4b71-4c00-b9d2-279ce1beca5d	10	51	4	59	admin	2011-06-14T14:16:56.437Z	admin	2011-06-14T14:16:56.497Z	\N
720	4	6	6c38c7da-ac2c-40d0-a38d-f8517dba80b5	10	51	4	59	admin	2011-06-14T14:16:56.455Z	admin	2011-06-14T14:16:56.517Z	\N
721	4	6	37be157c-741c-4e51-b781-20d36e4e335a	10	51	4	59	admin	2011-06-14T14:16:56.597Z	admin	2011-06-14T14:16:56.658Z	\N
722	4	6	81171dd1-865b-49d1-8c8a-27c6eb260774	10	51	4	59	admin	2011-06-14T14:16:56.600Z	admin	2011-06-14T14:16:56.658Z	\N
723	4	6	8b44ac01-d864-4de8-a86c-8f7ec1cfe07d	10	51	4	59	admin	2011-06-14T14:16:56.735Z	admin	2011-06-14T14:16:56.786Z	\N
724	4	6	a1f014db-b5a4-4ccd-8305-edc12e4a6f7b	10	51	4	59	admin	2011-06-14T14:16:56.919Z	admin	2011-06-14T14:16:56.971Z	\N
725	4	6	1d981316-baaf-4ef7-801b-c6aa5b1e102d	10	51	4	59	admin	2011-06-14T14:16:57.168Z	admin	2011-06-14T14:16:57.244Z	\N
726	4	6	fe0de3c8-5cc8-4852-bc36-bdcaef8c9989	10	51	4	59	admin	2011-06-14T14:16:57.453Z	admin	2011-06-14T14:16:57.530Z	\N
727	4	6	aa62394d-b2db-4489-8a1c-5120ab61a6a5	10	51	4	59	admin	2011-06-14T14:16:58.489Z	admin	2011-06-14T14:16:58.546Z	\N
709	6	6	45210491-2d7c-4a85-ab7c-e6997d32ff02	10	199	4	59	abeecher	2011-02-15T22:09:27.794Z	admin	2011-06-14T10:28:57.790Z	\N
708	6	6	9f37fbee-5a28-4732-8fce-95577e003ad5	10	199	4	59	mjackson	2011-02-15T22:08:49.798Z	admin	2011-06-14T10:28:57.681Z	\N
707	6	6	5eda88dd-74dc-4166-a3df-bb4500ed8877	10	199	4	59	abeecher	2011-02-15T22:06:59.801Z	admin	2011-06-14T10:28:57.647Z	\N
690	4	6	a10b3171-ea96-4d34-b090-f8db09f4efb1	10	213	4	59	abeecher	2011-02-15T22:29:40.511Z	admin	2011-06-14T10:28:57.702Z	\N
692	4	6	7778cf88-836f-4833-a0df-3056d2b20e7a	10	213	4	59	abeecher	2011-02-15T22:31:26.282Z	admin	2011-06-14T10:28:57.751Z	\N
685	4	6	db31dce5-2469-4c68-8641-9becad64a756	10	206	4	59	abeecher	2011-02-15T22:18:03.303Z	admin	2011-06-14T10:28:57.624Z	\N
689	4	6	05571c6d-bf6c-4509-8242-5d159726ec80	10	213	4	59	abeecher	2011-02-15T22:28:52.496Z	admin	2011-06-14T10:28:57.574Z	\N
693	4	6	06b07aa0-c8f5-494b-a2ff-ff134d7bcd9b	10	213	4	59	abeecher	2011-03-08T10:39:44.210Z	admin	2011-06-14T10:28:57.727Z	\N
712	6	6	f85d87f1-79d9-450f-b01c-5fed4b44f86b	10	199	4	59	abeecher	2011-02-15T22:07:30.638Z	admin	2011-06-14T10:28:57.600Z	\N
603	5	6	8bb36efb-c26d-4d2b-9199-ab6922f53c28	10	24	4	59	mjackson	2011-02-15T20:47:03.951Z	mjackson	2011-02-15T21:00:43.616Z	\N
649	6	6	05dedd34-9d9d-48d9-9af6-c81b555541c9	10	51	4	59	abeecher	2011-03-08T10:35:10.064Z	abeecher	2011-03-08T10:37:43.961Z	\N
650	5	6	8ab12916-4897-47fb-94eb-1ab699822ecb	10	24	4	59	mjackson	2011-02-15T20:50:25.839Z	mjackson	2011-02-15T21:08:20.590Z	\N
680	6	6	a38308f8-6f30-4d8a-8576-eaf6703fb9d3	10	200	4	59	mjackson	2011-02-15T21:43:14.377Z	mjackson	2011-02-15T21:43:14.377Z	\N
681	6	6	602b72e5-e365-4eee-b68d-b3dd26270ee3	10	200	4	59	mjackson	2011-02-15T21:44:04.010Z	mjackson	2011-02-15T21:44:04.010Z	\N
695	9	6	d6f3a279-ce86-4a12-8985-93b71afbb71d	10	51	4	59	mjackson	2011-02-15T21:46:47.847Z	admin	2011-06-14T10:28:57.221Z	\N
698	9	6	1373739a-2849-4647-9e97-7a4e05cc5841	10	51	4	59	mjackson	2011-02-15T21:50:49.999Z	admin	2011-06-14T10:28:57.304Z	\N
701	9	6	3c73aace-9f54-420d-a1c0-c54b6a116dcf	10	51	4	59	mjackson	2011-02-15T21:59:31.855Z	admin	2011-06-14T10:28:57.370Z	\N
705	5	6	53e8664e-e1fb-40d0-9104-019d57f06bee	10	198	4	59	mjackson	2011-02-15T22:05:46.889Z	mjackson	2011-02-15T22:05:46.889Z	\N
710	5	6	700ef542-9e3c-44dd-b7ea-027934010656	10	198	4	59	mjackson	2011-02-15T22:06:21.030Z	mjackson	2011-02-15T22:06:21.030Z	\N
\.


--
-- Data for Name: alf_node_aspects; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY alf_node_aspects (node_id, qname_id) FROM stdin;
1	2
5	2
9	2
9	22
10	2
10	23
11	2
12	2
13	25
13	30
13	31
14	25
14	30
14	31
15	25
15	30
15	31
16	25
16	30
16	31
17	25
17	30
17	31
18	25
18	30
18	31
19	25
19	30
19	31
20	25
20	30
20	31
21	25
21	30
21	31
22	25
22	30
22	31
23	25
23	30
23	31
24	25
24	30
24	31
25	25
25	30
25	31
26	25
26	30
26	31
27	25
27	30
27	31
28	25
28	30
28	31
29	25
29	30
29	31
32	44
35	25
35	2
36	25
37	25
38	25
39	25
40	25
41	25
42	25
43	25
44	25
45	25
46	25
47	25
48	25
49	25
50	25
51	25
52	25
53	25
54	25
55	25
56	25
57	25
58	25
59	25
60	25
61	25
62	25
63	25
64	25
65	25
66	25
67	25
68	25
69	25
70	25
71	25
72	25
73	25
74	25
75	25
76	25
77	25
78	25
79	25
80	25
81	25
82	25
83	25
84	25
85	25
86	25
87	25
88	25
89	25
90	25
91	25
92	25
93	25
94	25
95	25
96	25
97	25
98	25
99	25
100	25
101	25
102	25
103	25
104	25
105	25
106	25
107	25
108	25
109	25
110	25
111	25
112	25
113	25
114	25
115	25
116	25
117	25
118	25
119	25
120	25
121	25
122	25
123	25
124	25
125	25
126	25
127	25
128	25
129	25
130	25
131	25
132	25
133	25
134	25
135	25
136	25
137	25
138	25
139	25
140	25
141	25
142	25
143	25
144	25
145	25
146	25
147	25
148	25
149	25
150	25
151	25
152	25
153	25
154	25
155	25
156	25
157	25
158	25
159	25
160	25
161	25
162	25
163	25
164	25
165	25
166	25
167	25
168	25
169	25
170	25
171	25
172	25
173	25
174	25
175	25
176	25
177	25
178	25
179	25
180	25
181	25
182	25
183	25
184	25
185	25
186	25
187	25
188	25
189	25
190	25
191	25
192	25
193	25
194	25
195	25
196	25
197	25
198	25
199	25
200	25
201	25
202	25
203	25
204	25
205	25
206	25
207	25
208	25
209	25
210	25
211	25
212	25
213	25
214	25
215	25
216	25
217	25
218	25
219	25
220	25
221	25
222	25
223	25
224	25
225	25
226	25
227	25
228	25
229	25
230	25
231	25
232	25
233	25
234	25
235	25
236	25
237	25
238	25
239	25
240	25
241	25
242	25
243	25
244	25
245	25
246	25
247	25
248	25
249	25
250	25
251	25
252	25
253	25
254	25
255	25
256	25
257	25
258	25
259	25
260	25
261	25
262	25
263	25
264	25
265	25
266	25
267	25
268	25
269	25
270	25
271	25
272	25
273	25
274	25
275	25
276	25
277	25
278	25
279	25
280	25
281	25
282	25
283	25
284	25
285	25
286	25
287	25
288	25
289	25
290	25
291	25
292	25
293	25
294	25
295	25
296	25
297	25
298	25
299	25
300	25
301	25
302	25
303	25
304	25
305	25
306	25
307	25
308	25
309	25
310	25
311	25
312	25
313	25
314	25
315	25
316	25
317	25
318	25
319	25
320	25
321	25
322	25
323	25
324	25
325	25
326	25
327	25
328	25
329	25
330	25
331	25
332	25
333	25
334	25
335	25
336	25
337	25
338	25
339	25
340	25
341	25
342	25
343	25
344	25
345	25
346	25
347	25
348	25
349	25
350	25
351	25
352	25
353	25
354	25
355	25
356	25
357	25
358	25
359	25
360	25
361	25
362	25
363	25
364	25
365	25
366	25
367	25
368	25
369	25
371	25
371	31
372	25
372	31
373	25
373	31
374	25
374	31
375	25
375	31
376	25
376	31
377	25
377	30
377	31
378	25
378	31
379	25
379	31
380	25
380	31
381	25
381	31
382	25
382	30
382	53
383	25
383	30
383	53
384	25
384	30
384	53
385	25
385	30
385	53
386	25
386	30
386	53
387	25
387	30
387	53
388	25
388	30
388	53
389	25
389	30
389	53
390	25
390	30
390	53
391	25
391	30
391	53
392	25
392	53
392	30
392	54
393	25
393	30
393	31
394	25
394	30
394	53
395	25
395	30
395	31
396	25
396	30
396	53
397	25
397	30
397	31
398	25
398	53
398	30
398	54
399	25
399	53
399	30
399	54
400	25
400	53
400	30
400	54
401	25
401	53
401	30
401	54
402	25
402	53
402	30
402	54
403	25
403	53
403	30
403	54
404	25
404	53
404	30
404	54
405	25
405	30
406	25
406	30
406	53
407	25
407	30
407	53
408	25
408	30
408	53
409	25
409	30
409	53
410	25
410	30
410	53
411	25
411	30
411	53
412	25
412	30
412	53
413	25
413	30
413	31
414	25
414	30
414	53
415	25
415	30
415	53
416	25
416	30
416	53
417	25
417	30
417	53
418	25
418	30
418	53
419	25
419	30
419	53
420	25
420	30
420	53
421	25
421	30
421	53
422	25
422	53
422	30
422	54
423	25
423	53
423	30
423	54
424	25
424	53
424	30
424	54
425	25
425	53
425	30
425	54
426	25
426	53
426	30
426	54
427	25
427	30
427	53
428	25
428	30
428	31
429	25
429	53
429	30
429	54
430	25
430	53
430	30
430	54
431	25
431	53
431	30
431	54
432	25
432	53
432	30
432	54
433	25
433	30
433	31
434	25
434	30
434	31
435	25
435	30
435	31
436	25
436	53
436	30
436	54
437	25
437	53
437	30
437	54
438	25
438	53
438	30
438	54
439	25
439	53
439	30
439	54
440	25
440	53
440	30
440	54
441	25
441	53
441	30
441	54
442	25
442	53
442	30
442	54
443	25
443	53
443	30
443	54
444	25
444	53
444	30
444	54
445	25
445	53
445	30
445	54
446	25
446	53
446	30
446	54
447	25
447	53
447	30
447	54
448	25
448	53
448	30
448	54
449	25
449	53
449	30
449	54
450	25
450	53
450	30
450	54
451	25
451	53
451	30
451	54
452	25
452	30
452	31
453	25
453	53
453	30
453	54
428	56
452	56
454	25
454	30
454	31
454	58
455	25
456	25
456	30
457	25
458	25
459	25
460	25
461	25
462	25
462	30
462	31
463	25
463	30
463	31
464	25
464	30
464	31
464	58
465	25
466	25
466	30
467	25
468	25
469	25
470	25
471	25
472	25
473	25
473	30
473	31
474	25
474	30
474	85
474	88
475	25
475	30
475	85
476	25
476	30
476	85
484	25
485	25
32	95
486	30
487	30
488	25
488	30
488	31
489	25
489	30
489	31
490	25
490	53
490	30
490	54
491	25
491	53
491	30
491	54
492	25
492	30
492	31
493	25
493	30
493	31
494	25
494	30
494	31
495	25
495	30
495	31
496	25
496	30
496	31
497	25
497	30
498	25
498	30
494	58
499	25
500	25
500	30
501	25
501	80
502	25
503	25
504	25
505	25
506	25
507	25
507	30
508	25
508	30
508	53
509	25
509	30
509	53
510	25
510	30
510	53
511	25
511	30
511	53
512	25
512	30
512	53
513	25
513	30
513	53
514	25
514	30
514	53
515	25
515	30
515	53
516	25
516	30
516	53
517	25
517	30
517	53
518	25
518	30
518	53
519	25
519	30
519	53
520	25
520	30
520	53
521	25
521	30
521	53
522	25
522	30
522	53
523	25
523	30
523	53
524	25
524	30
524	53
525	25
525	30
525	53
526	25
526	30
526	53
527	25
527	30
527	53
528	25
528	30
528	53
529	25
529	30
529	53
530	25
530	30
530	53
531	25
531	30
531	53
532	25
532	30
532	53
533	25
533	30
533	53
534	25
534	30
534	53
535	25
535	30
535	53
536	25
536	30
536	53
537	25
537	53
537	30
537	54
538	25
538	53
538	30
538	54
539	25
539	53
539	30
539	54
540	25
540	53
540	30
540	54
541	25
541	53
541	30
541	54
542	25
542	53
542	30
542	54
543	25
543	53
543	30
543	54
544	25
544	53
544	30
544	54
545	25
545	53
545	30
545	54
546	25
546	53
546	30
546	54
547	25
547	53
547	30
547	54
548	25
548	53
548	30
548	54
549	25
549	53
549	30
549	54
550	25
550	53
550	30
550	54
551	25
551	53
551	30
551	54
552	25
552	53
552	30
552	54
553	25
553	53
553	30
553	54
554	25
554	53
554	30
554	54
555	25
555	53
555	30
555	54
556	25
556	53
556	30
556	54
557	25
557	53
557	30
557	54
558	25
558	53
558	30
558	54
559	25
559	53
559	30
559	54
560	25
560	53
560	30
560	54
561	25
561	53
561	30
561	54
562	25
562	53
562	30
562	54
563	25
563	53
563	30
563	54
564	25
564	53
564	30
564	54
565	25
565	53
565	30
565	54
566	25
566	53
566	30
566	54
567	25
567	53
567	30
567	54
568	25
568	53
568	30
568	54
569	25
569	53
569	30
569	54
570	25
570	53
570	30
570	54
571	25
571	53
571	30
571	54
572	25
572	53
572	30
572	54
573	25
573	53
573	30
573	54
574	25
574	53
574	30
574	54
575	25
575	53
575	30
575	54
576	25
576	53
576	30
576	54
577	25
577	53
577	30
577	54
578	25
578	53
578	30
578	54
579	25
579	53
579	30
579	54
580	25
580	53
580	30
580	54
581	25
581	30
582	30
583	25
583	30
583	53
583	54
7	88
584	25
584	53
584	30
584	54
587	25
588	95
589	95
590	95
591	95
594	44
594	134
594	135
595	25
595	140
595	141
596	25
596	88
596	146
597	44
597	134
597	135
598	25
598	140
598	141
599	25
599	88
599	146
594	95
597	95
601	25
601	112
601	44
601	30
601	110
601	111
602	25
602	112
602	44
602	154
602	30
603	25
603	30
603	44
603	155
604	25
604	30
604	44
605	25
605	162
605	163
605	44
605	30
605	54
605	141
605	164
606	25
607	25
607	167
607	162
607	30
607	44
607	163
607	54
608	25
608	44
608	146
609	25
609	44
609	146
610	25
610	30
610	44
611	25
611	44
611	30
611	194
611	141
611	54
612	25
612	44
612	146
613	25
613	44
613	30
613	194
613	141
613	54
614	25
614	44
614	146
615	25
615	44
615	30
615	194
615	141
615	54
616	25
616	44
616	146
617	25
617	44
617	146
618	25
618	44
618	30
618	194
618	141
618	54
619	25
619	44
619	146
620	25
620	44
620	30
620	194
620	141
620	54
621	25
621	44
621	146
622	25
622	44
622	30
622	194
622	141
622	54
623	25
623	44
623	146
624	25
624	44
624	30
624	194
624	141
624	54
625	25
625	44
625	146
626	25
626	44
626	30
626	194
626	141
626	54
627	25
627	44
627	146
628	25
628	44
628	30
628	194
628	141
628	54
629	25
629	44
629	146
630	25
630	44
630	30
630	194
630	141
630	54
631	25
631	44
631	146
632	25
632	44
632	30
632	194
632	141
632	54
633	25
633	44
633	146
634	25
634	30
634	44
635	25
635	44
635	30
635	194
635	163
635	141
635	164
635	54
636	25
636	44
636	146
637	25
637	44
637	30
637	194
637	163
637	141
637	164
637	54
638	25
638	44
638	146
639	25
639	30
639	44
640	25
640	44
640	30
640	194
640	141
640	54
641	25
641	44
641	146
642	25
642	44
642	30
642	194
642	141
642	54
643	25
643	44
643	146
644	25
644	44
644	146
645	25
645	44
645	30
645	194
645	163
645	141
645	164
645	54
646	25
646	44
646	146
647	25
647	44
647	146
648	25
648	30
648	44
649	25
649	44
649	30
649	54
649	155
650	25
650	30
650	44
650	155
651	25
651	30
651	44
652	25
652	44
652	30
652	194
652	141
652	54
653	25
653	44
653	146
654	25
654	44
654	30
654	194
654	141
654	54
655	25
655	44
655	146
656	25
656	44
656	30
656	54
656	141
656	195
657	25
657	44
657	146
658	25
658	44
658	146
659	25
659	44
659	31
660	25
660	44
661	25
661	44
661	30
662	25
662	30
662	44
663	25
663	44
663	30
663	141
664	25
664	44
664	146
665	25
665	44
665	146
666	25
666	44
666	30
666	141
667	25
667	44
667	146
668	25
668	44
668	146
669	25
669	44
669	30
669	141
670	25
670	44
670	146
671	25
671	44
671	146
672	25
672	30
672	44
673	25
673	44
673	30
673	141
674	25
674	44
674	146
675	25
675	44
675	146
676	25
676	44
676	30
676	141
677	25
677	44
677	146
678	25
678	44
678	146
679	25
679	154
679	44
679	112
680	25
680	44
680	155
681	25
681	44
681	155
682	25
682	44
682	154
682	30
682	112
683	25
683	30
683	44
684	25
684	212
684	44
684	30
685	25
685	212
685	44
685	30
686	25
686	212
686	44
686	30
687	25
687	212
687	44
687	30
688	25
688	30
688	44
689	25
689	44
690	25
690	44
691	25
691	44
692	25
692	44
693	25
693	44
694	25
694	154
694	44
694	112
695	25
695	44
695	162
695	30
695	155
696	25
697	25
697	167
697	162
697	44
697	30
697	155
698	25
698	44
698	162
698	30
698	155
699	25
700	25
700	167
700	162
700	44
700	30
700	155
701	25
701	44
701	162
701	30
701	155
702	25
703	25
703	167
703	162
703	44
703	30
703	155
704	25
704	154
704	44
704	112
705	25
705	44
705	155
706	25
706	44
706	220
706	30
707	25
707	44
707	220
707	30
707	221
708	25
708	44
708	220
708	30
708	221
709	25
709	44
709	220
709	30
709	221
710	25
710	44
710	155
711	25
711	44
711	220
711	30
712	25
712	44
712	220
712	30
712	221
713	25
713	88
713	85
714	25
714	88
715	25
715	88
716	25
716	88
717	25
717	88
718	25
718	88
719	25
719	88
720	25
720	88
721	25
721	88
722	25
722	88
723	25
723	88
724	25
724	88
725	25
725	88
726	25
726	88
727	25
727	88
597	227
594	227
733	25
734	25
735	25
736	25
737	25
738	25
739	25
740	25
741	25
742	25
743	25
744	25
745	25
746	25
747	25
748	25
749	25
750	25
751	25
752	25
753	25
754	25
755	25
756	25
757	25
758	25
759	25
760	25
761	25
762	25
763	25
764	25
765	25
766	25
767	25
768	25
769	25
770	25
771	25
772	25
773	25
774	25
775	25
776	25
777	25
778	25
779	25
780	25
781	25
782	25
783	25
784	25
785	25
786	25
787	25
788	25
789	25
790	25
791	25
792	25
793	25
794	25
795	25
796	25
797	25
798	25
799	25
800	25
801	25
802	25
803	25
804	25
805	25
806	25
807	25
808	25
809	25
810	25
811	25
812	25
813	25
814	25
815	25
816	25
817	25
818	25
819	25
820	25
821	25
822	25
823	25
824	25
825	25
826	25
827	25
828	25
829	25
830	25
831	25
832	25
833	25
834	25
835	25
836	25
837	25
838	25
839	25
840	25
841	25
842	25
843	25
844	25
845	25
846	25
847	25
848	25
849	25
850	25
851	25
852	25
853	25
854	25
855	25
856	25
857	25
858	25
859	25
860	25
861	25
862	25
863	25
863	88
863	30
864	25
864	88
864	44
865	25
865	44
865	88
866	25
866	44
866	88
867	25
867	44
867	88
868	25
868	44
868	88
869	25
869	44
869	88
870	25
870	44
870	88
871	25
871	88
872	25
872	88
873	25
873	88
871	44
872	44
873	44
874	25
874	44
874	88
875	25
875	30
875	110
875	111
875	112
877	95
878	95
879	95
880	95
881	25
881	85
881	88
881	44
882	25
882	88
882	44
883	25
883	44
883	88
884	25
884	44
884	88
885	25
885	44
885	88
886	25
886	44
886	88
887	25
887	44
887	88
888	25
888	88
889	25
889	88
890	25
890	88
888	44
889	44
890	44
891	25
891	44
891	88
32	135
892	25
892	154
892	112
892	44
892	30
893	25
893	30
894	25
894	30
894	162
895	25
896	25
896	167
896	162
896	30
894	141
898	25
898	88
898	146
894	140
900	25
900	194
900	54
900	30
900	162
901	25
902	25
902	167
902	162
902	30
902	54
902	194
903	25
903	194
903	54
903	30
903	162
904	25
905	25
905	167
905	162
905	30
905	54
905	194
906	25
906	194
906	54
906	30
906	162
907	25
908	25
908	167
908	162
908	30
908	54
908	194
909	25
909	194
909	54
909	30
909	162
910	25
911	25
911	167
911	162
911	30
911	54
911	194
\.


--
-- Data for Name: alf_node_assoc; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY alf_node_assoc (id, version, source_node_id, target_node_id, type_qname_id, assoc_index) FROM stdin;
1	1	594	595	147	1
2	1	597	598	147	1
3	1	606	607	178	1
4	1	696	697	178	1
5	1	699	700	178	1
6	1	702	703	178	1
7	1	709	708	224	1
8	1	708	707	224	1
9	1	707	706	224	1
10	1	690	656	225	1
11	1	692	605	225	1
12	1	685	656	226	1
13	1	689	673	225	1
14	1	693	649	225	1
15	1	712	711	224	1
16	1	895	896	178	1
17	1	901	902	178	1
18	1	904	905	178	1
19	1	907	908	178	1
20	1	910	911	178	1
\.


--
-- Name: alf_node_assoc_seq; Type: SEQUENCE SET; Schema: public; Owner: alfresco
--

SELECT pg_catalog.setval('alf_node_assoc_seq', 20, true);


--
-- Data for Name: alf_node_properties; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY alf_node_properties (node_id, actual_type_n, persisted_type_n, boolean_value, long_value, float_value, double_value, string_value, serializable_value, qname_id, list_index, locale_id) FROM stdin;
4	1	1	t	0	0	0	\N	\N	6	-1	1
4	1	1	f	0	0	0	\N	\N	7	-1	1
4	1	1	f	0	0	0	\N	\N	8	-1	1
4	6	6	f	0	0	0	admin	\N	9	-1	1
4	6	6	f	0	0	0	cbe0515c16b742ee2a1002e901f6ef76	\N	10	-1	1
4	1	1	f	0	0	0	\N	\N	11	-1	1
6	6	6	f	0	0	0		\N	17	-1	1
6	2	3	f	10057	0	0	\N	\N	18	-1	1
6	6	6	f	0	0	0	2	\N	19	-1	1
6	6	6	f	0	0	0	5	\N	13	-1	1
6	6	6	f	0	0	0	re21f2be5-b22	\N	14	-1	1
6	6	6	f	0	0	0	0	\N	15	-1	1
6	6	6	f	0	0	0		\N	16	-1	1
7	6	6	f	0	0	0		\N	17	-1	1
7	2	3	f	10057	0	0	\N	\N	18	-1	1
7	6	6	f	0	0	0	2	\N	19	-1	1
7	6	6	f	0	0	0	5	\N	13	-1	1
7	6	6	f	0	0	0	re21f2be5-b22	\N	14	-1	1
7	6	6	f	0	0	0	0	\N	15	-1	1
7	21	3	f	4	0	0	\N	\N	20	-1	1
13	6	6	f	0	0	0	Company Home	\N	26	-1	1
13	6	6	f	0	0	0	The company root space	\N	27	-1	2
13	6	6	f	0	0	0	Company Home	\N	28	-1	2
13	6	6	f	0	0	0	space-icon-default	\N	29	-1	1
14	6	6	f	0	0	0	Data Dictionary	\N	26	-1	1
14	6	6	f	0	0	0	User managed definitions	\N	27	-1	2
14	6	6	f	0	0	0	Data Dictionary	\N	28	-1	2
14	6	6	f	0	0	0	space-icon-default	\N	29	-1	1
15	6	6	f	0	0	0	Space Templates	\N	26	-1	1
15	6	6	f	0	0	0	Space folder templates	\N	27	-1	2
15	6	6	f	0	0	0	Space Templates	\N	28	-1	2
15	6	6	f	0	0	0	space-icon-default	\N	29	-1	1
16	6	6	f	0	0	0	Presentation Templates	\N	26	-1	1
16	6	6	f	0	0	0	Presentation templates	\N	27	-1	2
16	6	6	f	0	0	0	Presentation Templates	\N	28	-1	2
16	6	6	f	0	0	0	space-icon-default	\N	29	-1	1
17	6	6	f	0	0	0	Email Templates	\N	26	-1	1
17	6	6	f	0	0	0	Email templates	\N	27	-1	2
17	6	6	f	0	0	0	Email Templates	\N	28	-1	2
17	6	6	f	0	0	0	space-icon-default	\N	29	-1	1
18	6	6	f	0	0	0	invite	\N	26	-1	1
18	6	6	f	0	0	0	Invite email templates	\N	27	-1	2
18	6	6	f	0	0	0	invite	\N	28	-1	2
18	6	6	f	0	0	0	space-icon-default	\N	29	-1	1
19	6	6	f	0	0	0	RSS Templates	\N	26	-1	1
19	6	6	f	0	0	0	RSS templates	\N	27	-1	2
19	6	6	f	0	0	0	RSS Templates	\N	28	-1	2
19	6	6	f	0	0	0	space-icon-default	\N	29	-1	1
20	6	6	f	0	0	0	Saved Searches	\N	26	-1	1
20	6	6	f	0	0	0	Saved Searches	\N	27	-1	2
20	6	6	f	0	0	0	Saved Searches	\N	28	-1	2
20	6	6	f	0	0	0	space-icon-default	\N	29	-1	1
21	6	6	f	0	0	0	Scripts	\N	26	-1	1
21	6	6	f	0	0	0	JavaScript files	\N	27	-1	2
21	6	6	f	0	0	0	Scripts	\N	28	-1	2
21	6	6	f	0	0	0	space-icon-default	\N	29	-1	1
22	6	6	f	0	0	0	Node Templates	\N	26	-1	1
22	6	6	f	0	0	0	Template Nodes for Share - Create New document	\N	27	-1	2
22	6	6	f	0	0	0	Node Templates	\N	28	-1	2
22	6	6	f	0	0	0	space-icon-default	\N	29	-1	1
23	6	6	f	0	0	0	Smart Folder Templates	\N	26	-1	1
23	6	6	f	0	0	0	Smart Folder Templates	\N	27	-1	2
23	6	6	f	0	0	0	Smart Folder Templates	\N	28	-1	2
23	6	6	f	0	0	0	space-icon-default	\N	29	-1	1
24	6	6	f	0	0	0	Smart Folder Downloads	\N	26	-1	1
24	6	6	f	0	0	0	Smart Folder downloads temporary association data	\N	27	-1	2
24	6	6	f	0	0	0	Smart Folder Downloads	\N	28	-1	2
24	6	6	f	0	0	0	space-icon-default	\N	29	-1	1
25	6	6	f	0	0	0	Guest Home	\N	26	-1	1
25	6	6	f	0	0	0	The guest root space	\N	27	-1	2
25	6	6	f	0	0	0	Guest Home	\N	28	-1	2
25	6	6	f	0	0	0	space-icon-default	\N	29	-1	1
26	6	6	f	0	0	0	User Homes	\N	26	-1	1
26	6	6	f	0	0	0	User Homes	\N	27	-1	2
26	6	6	f	0	0	0	User Homes	\N	28	-1	2
26	6	6	f	0	0	0	space-icon-default	\N	29	-1	1
27	6	6	f	0	0	0	Shared	\N	26	-1	1
27	6	6	f	0	0	0	Folder to store shared stuff	\N	27	-1	2
27	6	6	f	0	0	0	Shared Folder	\N	28	-1	2
27	6	6	f	0	0	0	space-icon-default	\N	29	-1	1
28	6	6	f	0	0	0	Imap Attachments	\N	26	-1	1
28	6	6	f	0	0	0	Imap Attachments	\N	27	-1	2
28	6	6	f	0	0	0	Imap Attachments	\N	28	-1	2
28	6	6	f	0	0	0	space-icon-default	\N	29	-1	1
29	6	6	f	0	0	0	IMAP Home	\N	26	-1	1
29	6	6	f	0	0	0	IMAP Home	\N	27	-1	2
29	6	6	f	0	0	0	IMAP Home	\N	28	-1	2
29	6	6	f	0	0	0	space-icon-default	\N	29	-1	1
32	3	3	f	0	0	0	\N	\N	36	-1	1
32	6	6	f	0	0	0	admin	\N	37	-1	1
32	6	6	f	0	0	0	admin@alfresco.com	\N	38	-1	1
32	6	6	f	0	0	0	bootstrapHomeFolderProvider	\N	39	-1	1
32	6	6	f	0	0	0	admin	\N	40	-1	1
32	6	6	f	0	0	0		\N	41	-1	1
32	6	6	f	0	0	0		\N	42	-1	1
32	6	6	f	0	0	0	Administrator	\N	43	-1	1
33	3	3	f	0	0	0	\N	\N	36	-1	1
33	6	6	f	0	0	0	guest	\N	37	-1	1
33	6	6	f	0	0	0		\N	38	-1	1
33	6	6	f	0	0	0	bootstrapHomeFolderProvider	\N	39	-1	1
33	6	6	f	0	0	0		\N	41	-1	1
33	6	6	f	0	0	0		\N	42	-1	1
33	6	6	f	0	0	0	Guest	\N	43	-1	1
32	12	6	f	0	0	0	workspace://SpacesStore/e321a34e-4e10-435e-9aa9-fc341ff9f5e7	\N	45	-1	1
33	12	6	f	0	0	0	workspace://SpacesStore/50baa488-9b06-46d2-a461-827af15b25af	\N	45	-1	1
35	6	6	f	0	0	0	categories	\N	26	-1	1
36	6	6	f	0	0	0	General	\N	26	-1	1
37	6	6	f	0	0	0	Software Document Classification	\N	26	-1	1
38	6	6	f	0	0	0	Software Descriptions	\N	26	-1	1
39	6	6	f	0	0	0	Main Software Descriptions	\N	26	-1	1
40	6	6	f	0	0	0	Short System Description	\N	26	-1	1
41	6	6	f	0	0	0	Requirement Description	\N	26	-1	1
42	6	6	f	0	0	0	Architecture Description	\N	26	-1	1
43	6	6	f	0	0	0	Implementation Description	\N	26	-1	1
44	6	6	f	0	0	0	Configuration Description	\N	26	-1	1
45	6	6	f	0	0	0	Software Description Appendices	\N	26	-1	1
46	6	6	f	0	0	0	Terminology Description	\N	26	-1	1
47	6	6	f	0	0	0	Internal Message Description	\N	26	-1	1
48	6	6	f	0	0	0	External Message Description	\N	26	-1	1
49	6	6	f	0	0	0	Record Description	\N	26	-1	1
50	6	6	f	0	0	0	User Interface Description	\N	26	-1	1
51	6	6	f	0	0	0	Process Description	\N	26	-1	1
52	6	6	f	0	0	0	Initialization Description	\N	26	-1	1
53	6	6	f	0	0	0	Utilization Documents	\N	26	-1	1
54	6	6	f	0	0	0	User's Manual	\N	26	-1	1
55	6	6	f	0	0	0	Operator's Manual	\N	26	-1	1
56	6	6	f	0	0	0	Installation Manual	\N	26	-1	1
57	6	6	f	0	0	0	Service Manual	\N	26	-1	1
58	6	6	f	0	0	0	User's Help	\N	26	-1	1
59	6	6	f	0	0	0	Operator's Help	\N	26	-1	1
60	6	6	f	0	0	0	Installations Help	\N	26	-1	1
61	6	6	f	0	0	0	Service Help	\N	26	-1	1
62	6	6	f	0	0	0	Development Plans	\N	26	-1	1
63	6	6	f	0	0	0	Responsibility Plan	\N	26	-1	1
64	6	6	f	0	0	0	Work Breakdown Plan	\N	26	-1	1
65	6	6	f	0	0	0	Schedule Plan	\N	26	-1	1
66	6	6	f	0	0	0	Expense Plan	\N	26	-1	1
67	6	6	f	0	0	0	Phase Plan	\N	26	-1	1
68	6	6	f	0	0	0	Risk Plan	\N	26	-1	1
69	6	6	f	0	0	0	Test Plan	\N	26	-1	1
70	6	6	f	0	0	0	Acceptance Plan	\N	26	-1	1
71	6	6	f	0	0	0	Manual Plan	\N	26	-1	1
72	6	6	f	0	0	0	Method Plan	\N	26	-1	1
73	6	6	f	0	0	0	Quality Plan	\N	26	-1	1
74	6	6	f	0	0	0	Documentation Plan	\N	26	-1	1
75	6	6	f	0	0	0	Version Control Plan	\N	26	-1	1
76	6	6	f	0	0	0	Quality Documents	\N	26	-1	1
77	6	6	f	0	0	0	Change Request	\N	26	-1	1
78	6	6	f	0	0	0	Analysis Request	\N	26	-1	1
79	6	6	f	0	0	0	Information Request	\N	26	-1	1
80	6	6	f	0	0	0	Reader's Report	\N	26	-1	1
81	6	6	f	0	0	0	Review Report	\N	26	-1	1
82	6	6	f	0	0	0	Inspection Report	\N	26	-1	1
83	6	6	f	0	0	0	Test Report	\N	26	-1	1
84	6	6	f	0	0	0	Review Call	\N	26	-1	1
85	6	6	f	0	0	0	Inspection Call	\N	26	-1	1
86	6	6	f	0	0	0	Test Call	\N	26	-1	1
87	6	6	f	0	0	0	Administrative Documents	\N	26	-1	1
88	6	6	f	0	0	0	Preliminary Contract	\N	26	-1	1
89	6	6	f	0	0	0	Development Contract	\N	26	-1	1
90	6	6	f	0	0	0	Extended Contract	\N	26	-1	1
91	6	6	f	0	0	0	Maintenance Contract	\N	26	-1	1
92	6	6	f	0	0	0	Contract Review Minutes	\N	26	-1	1
93	6	6	f	0	0	0	Project Meeting Minutes	\N	26	-1	1
94	6	6	f	0	0	0	Languages	\N	26	-1	1
95	6	6	f	0	0	0	English	\N	26	-1	1
96	6	6	f	0	0	0	British English	\N	26	-1	1
97	6	6	f	0	0	0	American English	\N	26	-1	1
98	6	6	f	0	0	0	Australian English	\N	26	-1	1
99	6	6	f	0	0	0	Canadian English	\N	26	-1	1
100	6	6	f	0	0	0	Indian English	\N	26	-1	1
101	6	6	f	0	0	0	French	\N	26	-1	1
102	6	6	f	0	0	0	French French	\N	26	-1	1
103	6	6	f	0	0	0	Canadian French	\N	26	-1	1
104	6	6	f	0	0	0	German	\N	26	-1	1
105	6	6	f	0	0	0	German German	\N	26	-1	1
106	6	6	f	0	0	0	Austrian German	\N	26	-1	1
107	6	6	f	0	0	0	Swiss German	\N	26	-1	1
108	6	6	f	0	0	0	Spanish	\N	26	-1	1
109	6	6	f	0	0	0	Spanish	\N	26	-1	1
110	6	6	f	0	0	0	Mexican Spanish	\N	26	-1	1
111	6	6	f	0	0	0	American Spanish	\N	26	-1	1
112	6	6	f	0	0	0	Regions	\N	26	-1	1
113	6	6	f	0	0	0	AFRICA	\N	26	-1	1
114	6	6	f	0	0	0	Eastern Africa	\N	26	-1	1
115	6	6	f	0	0	0	Burundi	\N	26	-1	1
116	6	6	f	0	0	0	Comoros	\N	26	-1	1
117	6	6	f	0	0	0	Djibouti	\N	26	-1	1
118	6	6	f	0	0	0	Eritrea	\N	26	-1	1
119	6	6	f	0	0	0	Ethiopia	\N	26	-1	1
120	6	6	f	0	0	0	Kenya	\N	26	-1	1
121	6	6	f	0	0	0	Madagascar	\N	26	-1	1
122	6	6	f	0	0	0	Malawi	\N	26	-1	1
123	6	6	f	0	0	0	Mauritius	\N	26	-1	1
124	6	6	f	0	0	0	Mozambique	\N	26	-1	1
125	6	6	f	0	0	0	Reunion	\N	26	-1	1
126	6	6	f	0	0	0	Rwanda	\N	26	-1	1
127	6	6	f	0	0	0	Seychelles	\N	26	-1	1
128	6	6	f	0	0	0	Somalia	\N	26	-1	1
129	6	6	f	0	0	0	Uganda	\N	26	-1	1
130	6	6	f	0	0	0	United Republic of Tanzania	\N	26	-1	1
131	6	6	f	0	0	0	Zambia	\N	26	-1	1
132	6	6	f	0	0	0	Zimbabwe	\N	26	-1	1
133	6	6	f	0	0	0	Middle Africa	\N	26	-1	1
134	6	6	f	0	0	0	Angola	\N	26	-1	1
135	6	6	f	0	0	0	Cameroon	\N	26	-1	1
136	6	6	f	0	0	0	Central African Republic	\N	26	-1	1
137	6	6	f	0	0	0	Chad	\N	26	-1	1
138	6	6	f	0	0	0	Congo	\N	26	-1	1
139	6	6	f	0	0	0	Democratic Republic of the Congo	\N	26	-1	1
140	6	6	f	0	0	0	Equatorial Guinea	\N	26	-1	1
141	6	6	f	0	0	0	Gabon	\N	26	-1	1
142	6	6	f	0	0	0	Sao Tome and Principe	\N	26	-1	1
143	6	6	f	0	0	0	Northern Africa	\N	26	-1	1
144	6	6	f	0	0	0	Algeria	\N	26	-1	1
145	6	6	f	0	0	0	Egypt	\N	26	-1	1
146	6	6	f	0	0	0	Libyan Arab Jamahiriya	\N	26	-1	1
147	6	6	f	0	0	0	Morocco	\N	26	-1	1
148	6	6	f	0	0	0	Sudan	\N	26	-1	1
149	6	6	f	0	0	0	Tunisia	\N	26	-1	1
150	6	6	f	0	0	0	Western Sahara	\N	26	-1	1
151	6	6	f	0	0	0	Southern Africa	\N	26	-1	1
152	6	6	f	0	0	0	Botswana	\N	26	-1	1
153	6	6	f	0	0	0	Lesotho	\N	26	-1	1
154	6	6	f	0	0	0	Namibia	\N	26	-1	1
155	6	6	f	0	0	0	South Africa	\N	26	-1	1
156	6	6	f	0	0	0	Swaziland	\N	26	-1	1
157	6	6	f	0	0	0	Western Africa	\N	26	-1	1
158	6	6	f	0	0	0	Benin	\N	26	-1	1
159	6	6	f	0	0	0	Burkina Faso	\N	26	-1	1
160	6	6	f	0	0	0	Cape Verde	\N	26	-1	1
161	6	6	f	0	0	0	Cote d'Ivoire	\N	26	-1	1
162	6	6	f	0	0	0	Gambia	\N	26	-1	1
163	6	6	f	0	0	0	Ghana	\N	26	-1	1
164	6	6	f	0	0	0	Guinea	\N	26	-1	1
165	6	6	f	0	0	0	Guinea-Bissau	\N	26	-1	1
166	6	6	f	0	0	0	Liberia	\N	26	-1	1
167	6	6	f	0	0	0	Mali	\N	26	-1	1
168	6	6	f	0	0	0	Mauritania	\N	26	-1	1
169	6	6	f	0	0	0	Niger	\N	26	-1	1
170	6	6	f	0	0	0	Nigeria	\N	26	-1	1
171	6	6	f	0	0	0	Saint Helena	\N	26	-1	1
172	6	6	f	0	0	0	Senegal	\N	26	-1	1
173	6	6	f	0	0	0	Sierra Leone	\N	26	-1	1
174	6	6	f	0	0	0	Togo	\N	26	-1	1
175	6	6	f	0	0	0	ASIA	\N	26	-1	1
176	6	6	f	0	0	0	Eastern Asia	\N	26	-1	1
177	6	6	f	0	0	0	China	\N	26	-1	1
178	6	6	f	0	0	0	Democratic People's Republic of Korea	\N	26	-1	1
179	6	6	f	0	0	0	Hong Kong SAR	\N	26	-1	1
180	6	6	f	0	0	0	Japan	\N	26	-1	1
181	6	6	f	0	0	0	Macao, China	\N	26	-1	1
182	6	6	f	0	0	0	Mongolia	\N	26	-1	1
183	6	6	f	0	0	0	Republic of Korea	\N	26	-1	1
184	6	6	f	0	0	0	South-central Asia	\N	26	-1	1
185	6	6	f	0	0	0	Afghanistan	\N	26	-1	1
186	6	6	f	0	0	0	Bangladesh	\N	26	-1	1
187	6	6	f	0	0	0	Bhutan	\N	26	-1	1
188	6	6	f	0	0	0	India	\N	26	-1	1
189	6	6	f	0	0	0	Iran (Islamic Republic of)	\N	26	-1	1
190	6	6	f	0	0	0	Kazakhstan	\N	26	-1	1
191	6	6	f	0	0	0	Kyrgyzstan	\N	26	-1	1
192	6	6	f	0	0	0	Maldives	\N	26	-1	1
193	6	6	f	0	0	0	Nepal	\N	26	-1	1
194	6	6	f	0	0	0	Pakistan	\N	26	-1	1
195	6	6	f	0	0	0	Sri Lanka	\N	26	-1	1
196	6	6	f	0	0	0	Tajikistan	\N	26	-1	1
197	6	6	f	0	0	0	Turkmenistan	\N	26	-1	1
198	6	6	f	0	0	0	Uzbekistan	\N	26	-1	1
199	6	6	f	0	0	0	South-eastern Asia	\N	26	-1	1
200	6	6	f	0	0	0	Brunei Darussalam	\N	26	-1	1
201	6	6	f	0	0	0	Cambodia	\N	26	-1	1
202	6	6	f	0	0	0	Indonesia	\N	26	-1	1
203	6	6	f	0	0	0	Lao People's Democratic Republic	\N	26	-1	1
204	6	6	f	0	0	0	Malaysia	\N	26	-1	1
205	6	6	f	0	0	0	Myanmar	\N	26	-1	1
206	6	6	f	0	0	0	Philippines	\N	26	-1	1
207	6	6	f	0	0	0	Singapore	\N	26	-1	1
208	6	6	f	0	0	0	Thailand	\N	26	-1	1
209	6	6	f	0	0	0	Timor-Leste	\N	26	-1	1
210	6	6	f	0	0	0	Viet Nam	\N	26	-1	1
211	6	6	f	0	0	0	Western Asia	\N	26	-1	1
212	6	6	f	0	0	0	Armenia	\N	26	-1	1
213	6	6	f	0	0	0	Azerbaijan	\N	26	-1	1
214	6	6	f	0	0	0	Bahrain	\N	26	-1	1
215	6	6	f	0	0	0	Cyprus	\N	26	-1	1
216	6	6	f	0	0	0	Georgia	\N	26	-1	1
217	6	6	f	0	0	0	Iraq	\N	26	-1	1
218	6	6	f	0	0	0	Israel	\N	26	-1	1
219	6	6	f	0	0	0	Jordan	\N	26	-1	1
220	6	6	f	0	0	0	Kuwait	\N	26	-1	1
221	6	6	f	0	0	0	Lebanon	\N	26	-1	1
222	6	6	f	0	0	0	Occupied Palestinian Territory	\N	26	-1	1
223	6	6	f	0	0	0	Oman	\N	26	-1	1
224	6	6	f	0	0	0	Qatar	\N	26	-1	1
225	6	6	f	0	0	0	Saudi Arabia	\N	26	-1	1
226	6	6	f	0	0	0	Syrian Arab Republic	\N	26	-1	1
227	6	6	f	0	0	0	Turkey	\N	26	-1	1
228	6	6	f	0	0	0	United Arab Emirates	\N	26	-1	1
229	6	6	f	0	0	0	Yemen	\N	26	-1	1
230	6	6	f	0	0	0	EUROPE	\N	26	-1	1
231	6	6	f	0	0	0	Eastern Europe	\N	26	-1	1
232	6	6	f	0	0	0	Belarus	\N	26	-1	1
233	6	6	f	0	0	0	Bulgaria	\N	26	-1	1
234	6	6	f	0	0	0	Czech Republic	\N	26	-1	1
235	6	6	f	0	0	0	Hungary	\N	26	-1	1
236	6	6	f	0	0	0	Poland	\N	26	-1	1
237	6	6	f	0	0	0	Republic of Moldova	\N	26	-1	1
238	6	6	f	0	0	0	Romania	\N	26	-1	1
239	6	6	f	0	0	0	Russian Federation	\N	26	-1	1
240	6	6	f	0	0	0	Slovakia	\N	26	-1	1
241	6	6	f	0	0	0	Ukraine	\N	26	-1	1
242	6	6	f	0	0	0	Northern Europe	\N	26	-1	1
243	6	6	f	0	0	0	Channel Islands	\N	26	-1	1
244	6	6	f	0	0	0	Denmark	\N	26	-1	1
245	6	6	f	0	0	0	Estonia	\N	26	-1	1
246	6	6	f	0	0	0	Faeroe Islands	\N	26	-1	1
247	6	6	f	0	0	0	Finland	\N	26	-1	1
248	6	6	f	0	0	0	Iceland	\N	26	-1	1
249	6	6	f	0	0	0	Ireland	\N	26	-1	1
250	6	6	f	0	0	0	Isle of Man	\N	26	-1	1
251	6	6	f	0	0	0	Latvia	\N	26	-1	1
252	6	6	f	0	0	0	Lithuania	\N	26	-1	1
253	6	6	f	0	0	0	Norway	\N	26	-1	1
254	6	6	f	0	0	0	Sweden	\N	26	-1	1
255	6	6	f	0	0	0	United Kingdom	\N	26	-1	1
256	6	6	f	0	0	0	Southern Europe	\N	26	-1	1
257	6	6	f	0	0	0	Albania	\N	26	-1	1
258	6	6	f	0	0	0	Andorra	\N	26	-1	1
259	6	6	f	0	0	0	Bosnia and Herzegovina	\N	26	-1	1
260	6	6	f	0	0	0	Croatia	\N	26	-1	1
261	6	6	f	0	0	0	Gibraltar	\N	26	-1	1
262	6	6	f	0	0	0	Greece	\N	26	-1	1
263	6	6	f	0	0	0	Holy See	\N	26	-1	1
264	6	6	f	0	0	0	Italy	\N	26	-1	1
265	6	6	f	0	0	0	Malta	\N	26	-1	1
266	6	6	f	0	0	0	Portugal	\N	26	-1	1
267	6	6	f	0	0	0	San Marino	\N	26	-1	1
268	6	6	f	0	0	0	Slovenia	\N	26	-1	1
269	6	6	f	0	0	0	Spain	\N	26	-1	1
270	6	6	f	0	0	0	The Former Yugoslav Republic of Macedonia	\N	26	-1	1
271	6	6	f	0	0	0	Yugoslavia	\N	26	-1	1
272	6	6	f	0	0	0	Western Europe	\N	26	-1	1
273	6	6	f	0	0	0	Austria	\N	26	-1	1
274	6	6	f	0	0	0	Belgium	\N	26	-1	1
275	6	6	f	0	0	0	France	\N	26	-1	1
276	6	6	f	0	0	0	Germany	\N	26	-1	1
277	6	6	f	0	0	0	Liechtenstein	\N	26	-1	1
278	6	6	f	0	0	0	Luxembourg	\N	26	-1	1
279	6	6	f	0	0	0	Monaco	\N	26	-1	1
280	6	6	f	0	0	0	Netherlands	\N	26	-1	1
281	6	6	f	0	0	0	Switzerland	\N	26	-1	1
282	6	6	f	0	0	0	LATIN AMERICA	\N	26	-1	1
283	6	6	f	0	0	0	Caribbean	\N	26	-1	1
284	6	6	f	0	0	0	Anguilla	\N	26	-1	1
285	6	6	f	0	0	0	Antigua and Barbuda	\N	26	-1	1
286	6	6	f	0	0	0	Aruba	\N	26	-1	1
287	6	6	f	0	0	0	Bahamas	\N	26	-1	1
288	6	6	f	0	0	0	Barbados	\N	26	-1	1
289	6	6	f	0	0	0	British Virgin Islands	\N	26	-1	1
290	6	6	f	0	0	0	Cayman Islands	\N	26	-1	1
291	6	6	f	0	0	0	Cuba	\N	26	-1	1
292	6	6	f	0	0	0	Dominica	\N	26	-1	1
293	6	6	f	0	0	0	Dominican Republic	\N	26	-1	1
294	6	6	f	0	0	0	Grenada	\N	26	-1	1
295	6	6	f	0	0	0	Guadeloupe	\N	26	-1	1
296	6	6	f	0	0	0	Haiti	\N	26	-1	1
297	6	6	f	0	0	0	Jamaica	\N	26	-1	1
298	6	6	f	0	0	0	Martinique	\N	26	-1	1
299	6	6	f	0	0	0	Montserrat	\N	26	-1	1
300	6	6	f	0	0	0	Netherlands Antilles	\N	26	-1	1
301	6	6	f	0	0	0	Puerto Rico	\N	26	-1	1
302	6	6	f	0	0	0	Saint Kitts and Nevis	\N	26	-1	1
303	6	6	f	0	0	0	Saint Lucia	\N	26	-1	1
304	6	6	f	0	0	0	Saint Vincent and Grenadines	\N	26	-1	1
305	6	6	f	0	0	0	Trinidad and Tobago	\N	26	-1	1
306	6	6	f	0	0	0	Turks and Caicos Islands	\N	26	-1	1
307	6	6	f	0	0	0	United States Virgin Islands	\N	26	-1	1
308	6	6	f	0	0	0	Central America	\N	26	-1	1
309	6	6	f	0	0	0	Belize	\N	26	-1	1
310	6	6	f	0	0	0	Costa Rica	\N	26	-1	1
311	6	6	f	0	0	0	El Salvador	\N	26	-1	1
312	6	6	f	0	0	0	Guatemala	\N	26	-1	1
313	6	6	f	0	0	0	Honduras	\N	26	-1	1
314	6	6	f	0	0	0	Mexico	\N	26	-1	1
315	6	6	f	0	0	0	Nicaragua	\N	26	-1	1
316	6	6	f	0	0	0	Panama	\N	26	-1	1
317	6	6	f	0	0	0	South America	\N	26	-1	1
318	6	6	f	0	0	0	Argentina	\N	26	-1	1
319	6	6	f	0	0	0	Bolivia	\N	26	-1	1
320	6	6	f	0	0	0	Brazil	\N	26	-1	1
321	6	6	f	0	0	0	Chile	\N	26	-1	1
322	6	6	f	0	0	0	Colombia	\N	26	-1	1
323	6	6	f	0	0	0	Ecuador	\N	26	-1	1
324	6	6	f	0	0	0	Falkland Islands (Malvinas)	\N	26	-1	1
325	6	6	f	0	0	0	French Guiana	\N	26	-1	1
326	6	6	f	0	0	0	Guyana	\N	26	-1	1
327	6	6	f	0	0	0	Paraguay	\N	26	-1	1
328	6	6	f	0	0	0	Peru	\N	26	-1	1
329	6	6	f	0	0	0	Suriname	\N	26	-1	1
330	6	6	f	0	0	0	Uruguay	\N	26	-1	1
331	6	6	f	0	0	0	Venezuela	\N	26	-1	1
332	6	6	f	0	0	0	NORTHERN AMERICA	\N	26	-1	1
333	6	6	f	0	0	0	Bermuda	\N	26	-1	1
334	6	6	f	0	0	0	Canada	\N	26	-1	1
335	6	6	f	0	0	0	Greenland	\N	26	-1	1
336	6	6	f	0	0	0	Saint Pierre and Miquelon	\N	26	-1	1
337	6	6	f	0	0	0	United States of America	\N	26	-1	1
338	6	6	f	0	0	0	OCEANIA	\N	26	-1	1
339	6	6	f	0	0	0	Australia and New Zealand	\N	26	-1	1
340	6	6	f	0	0	0	Australia	\N	26	-1	1
341	6	6	f	0	0	0	New Zealand	\N	26	-1	1
342	6	6	f	0	0	0	Norfolk Island	\N	26	-1	1
343	6	6	f	0	0	0	Melanesia	\N	26	-1	1
344	6	6	f	0	0	0	Fiji	\N	26	-1	1
345	6	6	f	0	0	0	New Caledonia	\N	26	-1	1
346	6	6	f	0	0	0	Papua New Guinea	\N	26	-1	1
347	6	6	f	0	0	0	Solomon Islands	\N	26	-1	1
348	6	6	f	0	0	0	Vanuatu	\N	26	-1	1
349	6	6	f	0	0	0	Micronesia	\N	26	-1	1
350	6	6	f	0	0	0	Federated States of Micronesia	\N	26	-1	1
351	6	6	f	0	0	0	Guam	\N	26	-1	1
352	6	6	f	0	0	0	Johnston Island	\N	26	-1	1
353	6	6	f	0	0	0	Kiribati	\N	26	-1	1
354	6	6	f	0	0	0	Marshall Islands	\N	26	-1	1
355	6	6	f	0	0	0	Nauru	\N	26	-1	1
356	6	6	f	0	0	0	Northern Mariana Islands	\N	26	-1	1
357	6	6	f	0	0	0	Palau	\N	26	-1	1
358	6	6	f	0	0	0	Polynesia	\N	26	-1	1
359	6	6	f	0	0	0	American Samoa	\N	26	-1	1
360	6	6	f	0	0	0	Cook Islands	\N	26	-1	1
361	6	6	f	0	0	0	French Polynesia	\N	26	-1	1
362	6	6	f	0	0	0	Niue	\N	26	-1	1
363	6	6	f	0	0	0	Pitcairn	\N	26	-1	1
364	6	6	f	0	0	0	Samoa	\N	26	-1	1
365	6	6	f	0	0	0	Tokelau	\N	26	-1	1
366	6	6	f	0	0	0	Tonga	\N	26	-1	1
367	6	6	f	0	0	0	Tuvalu	\N	26	-1	1
368	6	6	f	0	0	0	Wallis and Futuna Islands	\N	26	-1	1
369	6	6	f	0	0	0	Tags	\N	26	-1	1
371	6	6	f	0	0	0	Software Engineering Project	\N	26	-1	1
371	6	6	f	0	0	0	space-icon-default	\N	29	-1	1
372	6	6	f	0	0	0	Documentation	\N	26	-1	1
372	6	6	f	0	0	0	space-icon-default	\N	29	-1	1
373	6	6	f	0	0	0	Drafts	\N	26	-1	1
373	6	6	f	0	0	0	space-icon-default	\N	29	-1	1
374	6	6	f	0	0	0	Pending Approval	\N	26	-1	1
374	6	6	f	0	0	0	space-icon-default	\N	29	-1	1
375	6	6	f	0	0	0	Published	\N	26	-1	1
375	6	6	f	0	0	0	space-icon-default	\N	29	-1	1
376	6	6	f	0	0	0	Samples	\N	26	-1	1
376	6	6	f	0	0	0	space-icon-doc	\N	29	-1	1
377	6	6	f	0	0	0	system-overview.html	\N	26	-1	1
377	6	6	f	0	0	0	system-overview.html	\N	27	-1	2
377	6	6	f	0	0	0	System Overview	\N	28	-1	2
377	21	3	f	5	0	0	\N	\N	51	-1	1
378	6	6	f	0	0	0	Discussions	\N	26	-1	1
378	6	6	f	0	0	0	space-icon-default	\N	29	-1	1
379	6	6	f	0	0	0	UI Design	\N	26	-1	1
379	6	6	f	0	0	0	space-icon-default	\N	29	-1	1
380	6	6	f	0	0	0	Presentations	\N	26	-1	1
380	6	6	f	0	0	0	space-icon-default	\N	29	-1	1
381	6	6	f	0	0	0	Quality Assurance	\N	26	-1	1
381	6	6	f	0	0	0	space-icon-default	\N	29	-1	1
382	1	1	t	0	0	0	\N	\N	52	-1	1
382	6	6	f	0	0	0	doc_info.ftl	\N	26	-1	1
382	6	6	f	0	0	0	Displays useful information about the current document	\N	27	-1	2
382	6	6	f	0	0	0	doc_info.ftl	\N	28	-1	2
382	21	3	f	6	0	0	\N	\N	51	-1	1
383	1	1	t	0	0	0	\N	\N	52	-1	1
383	6	6	f	0	0	0	localizable.ftl	\N	26	-1	1
383	6	6	f	0	0	0	Calculates if the document has the localizable aspect applied	\N	27	-1	2
383	6	6	f	0	0	0	localizable.ftl	\N	28	-1	2
383	21	3	f	7	0	0	\N	\N	51	-1	1
384	1	1	t	0	0	0	\N	\N	52	-1	1
384	6	6	f	0	0	0	my_docs.ftl	\N	26	-1	1
384	6	6	f	0	0	0	Displays a list of the documents in the current user Home Space	\N	27	-1	2
384	6	6	f	0	0	0	my_docs.ftl	\N	28	-1	2
384	21	3	f	8	0	0	\N	\N	51	-1	1
385	1	1	t	0	0	0	\N	\N	52	-1	1
385	6	6	f	0	0	0	my_spaces.ftl	\N	26	-1	1
385	6	6	f	0	0	0	Displays a list of spaces in the current user Home Space	\N	27	-1	2
385	6	6	f	0	0	0	my_spaces.ftl	\N	28	-1	2
385	21	3	f	9	0	0	\N	\N	51	-1	1
386	1	1	t	0	0	0	\N	\N	52	-1	1
386	6	6	f	0	0	0	my_summary.ftl	\N	26	-1	1
386	6	6	f	0	0	0	Shows a simple summary page about the current user and their Home Space	\N	27	-1	2
386	6	6	f	0	0	0	my_summary.ftl	\N	28	-1	2
386	21	3	f	10	0	0	\N	\N	51	-1	1
387	1	1	t	0	0	0	\N	\N	52	-1	1
387	6	6	f	0	0	0	translatable.ftl	\N	26	-1	1
387	6	6	f	0	0	0	Calculates if the document has the translatable aspect applied	\N	27	-1	2
387	6	6	f	0	0	0	translatable.ftl	\N	28	-1	2
387	21	3	f	11	0	0	\N	\N	51	-1	1
388	1	1	t	0	0	0	\N	\N	52	-1	1
388	6	6	f	0	0	0	recent_docs.ftl	\N	26	-1	1
388	6	6	f	0	0	0	Displays a list of the documents in the current space created or modified in the last 7 days	\N	27	-1	2
388	6	6	f	0	0	0	recent_docs.ftl	\N	28	-1	2
388	21	3	f	12	0	0	\N	\N	51	-1	1
389	1	1	t	0	0	0	\N	\N	52	-1	1
389	6	6	f	0	0	0	general_example.ftl	\N	26	-1	1
389	6	6	f	0	0	0	Example of various lists of documents, spaces and summary information about the current user	\N	27	-1	2
389	6	6	f	0	0	0	general_example.ftl	\N	28	-1	2
389	21	3	f	13	0	0	\N	\N	51	-1	1
390	1	1	t	0	0	0	\N	\N	52	-1	1
390	6	6	f	0	0	0	my_docs_inline.ftl	\N	26	-1	1
390	6	6	f	0	0	0	Displays a list of the documents in the current user Home Space. Text document content is shown inline, as is JPG content as small thumbnail images.	\N	27	-1	2
390	6	6	f	0	0	0	my_docs_inline.ftl	\N	28	-1	2
390	21	3	f	14	0	0	\N	\N	51	-1	1
391	1	1	t	0	0	0	\N	\N	52	-1	1
391	6	6	f	0	0	0	show_audit.ftl	\N	26	-1	1
391	6	6	f	0	0	0	Displays the audit trail for an object.	\N	27	-1	2
391	6	6	f	0	0	0	show_audit.ftl	\N	28	-1	2
391	21	3	f	15	0	0	\N	\N	51	-1	1
392	1	1	t	0	0	0	\N	\N	52	-1	1
392	6	6	f	0	0	0	Mike Farman	\N	54	-1	1
392	6	6	f	0	0	0	readme.ftl	\N	26	-1	1
392	6	6	f	0	0	0	Display the contents of a readme file (named readme.html or readme.ftl)	\N	27	-1	2
392	6	6	f	0	0	0	readme.ftl	\N	28	-1	2
392	21	3	f	16	0	0	\N	\N	51	-1	1
393	6	6	f	0	0	0	Invite Email Templates	\N	26	-1	1
393	6	6	f	0	0	0	Invite Email Templates	\N	27	-1	2
393	6	6	f	0	0	0	Invite Email Templates	\N	28	-1	2
393	6	6	f	0	0	0	space-icon-default	\N	29	-1	1
394	1	1	t	0	0	0	\N	\N	52	-1	1
394	6	6	f	0	0	0	invite_user_email.ftl	\N	26	-1	1
394	6	6	f	0	0	0	Email template for notifying users of an Invite to a space or document	\N	27	-1	2
394	6	6	f	0	0	0	invite_user_email.ftl	\N	28	-1	2
394	21	3	f	17	0	0	\N	\N	51	-1	1
395	6	6	f	0	0	0	Notify Email Templates	\N	26	-1	1
395	6	6	f	0	0	0	Notify Email Templates	\N	27	-1	2
395	6	6	f	0	0	0	Notify Email Templates	\N	28	-1	2
395	6	6	f	0	0	0	space-icon-default	\N	29	-1	1
396	1	1	t	0	0	0	\N	\N	52	-1	1
396	6	6	f	0	0	0	notify_user_email.ftl.sample	\N	26	-1	1
396	6	6	f	0	0	0	Sample Email template for notifying users from a rule or action	\N	27	-1	2
396	6	6	f	0	0	0	notify_user_email.ftl.sample	\N	28	-1	2
396	21	3	f	18	0	0	\N	\N	51	-1	1
397	6	6	f	0	0	0	activities	\N	26	-1	1
397	6	6	f	0	0	0	Activities email templates	\N	27	-1	2
397	6	6	f	0	0	0	activities	\N	28	-1	2
397	6	6	f	0	0	0	space-icon-default	\N	29	-1	1
398	1	1	t	0	0	0	\N	\N	52	-1	1
398	6	6	f	0	0	0		\N	54	-1	1
398	6	6	f	0	0	0	activities-email.ftl	\N	26	-1	1
398	6	6	f	0	0	0	Email template used to generate the activities email for Alfresco Share - Default version	\N	27	-1	2
398	6	6	f	0	0	0	activities-email.ftl	\N	28	-1	2
398	21	3	f	19	0	0	\N	\N	51	-1	1
399	1	1	t	0	0	0	\N	\N	52	-1	1
399	6	6	f	0	0	0		\N	54	-1	1
399	6	6	f	0	0	0	activities-email_fr.ftl	\N	26	-1	1
399	6	6	f	0	0	0	Email template used to generate the activities email for Alfresco Share - French version	\N	27	-1	2
399	6	6	f	0	0	0	activities-email_fr.ftl	\N	28	-1	2
399	21	3	f	20	0	0	\N	\N	51	-1	1
400	1	1	t	0	0	0	\N	\N	52	-1	1
400	6	6	f	0	0	0		\N	54	-1	1
400	6	6	f	0	0	0	activities-email_es.ftl	\N	26	-1	1
400	6	6	f	0	0	0	Email template used to generate the activities email for Alfresco Share - Spanish version	\N	27	-1	2
400	6	6	f	0	0	0	activities-email_es.ftl	\N	28	-1	2
400	21	3	f	21	0	0	\N	\N	51	-1	1
401	1	1	t	0	0	0	\N	\N	52	-1	1
401	6	6	f	0	0	0		\N	54	-1	1
401	6	6	f	0	0	0	activities-email_de.ftl	\N	26	-1	1
401	6	6	f	0	0	0	Email template used to generate the activities email for Alfresco Share - German version	\N	27	-1	2
401	6	6	f	0	0	0	activities-email_de.ftl	\N	28	-1	2
401	21	3	f	22	0	0	\N	\N	51	-1	1
402	1	1	t	0	0	0	\N	\N	52	-1	1
402	6	6	f	0	0	0		\N	54	-1	1
402	6	6	f	0	0	0	activities-email_it.ftl	\N	26	-1	1
402	6	6	f	0	0	0	Email template used to generate the activities email for Alfresco Share - Italian version	\N	27	-1	2
402	6	6	f	0	0	0	activities-email_it.ftl	\N	28	-1	2
402	21	3	f	23	0	0	\N	\N	51	-1	1
403	1	1	t	0	0	0	\N	\N	52	-1	1
403	6	6	f	0	0	0		\N	54	-1	1
403	6	6	f	0	0	0	activities-email_ja.ftl	\N	26	-1	1
403	6	6	f	0	0	0	Email template used to generate the activities email for Alfresco Share - Japanese version	\N	27	-1	2
403	6	6	f	0	0	0	activities-email_ja.ftl	\N	28	-1	2
403	21	3	f	24	0	0	\N	\N	51	-1	1
404	1	1	t	0	0	0	\N	\N	52	-1	1
404	6	6	f	0	0	0		\N	54	-1	1
404	6	6	f	0	0	0	activities-email_nl.ftl	\N	26	-1	1
404	6	6	f	0	0	0	Email template used to generate the activities email for Alfresco Share - Dutch version	\N	27	-1	2
404	6	6	f	0	0	0	activities-email_nl.ftl	\N	28	-1	2
404	21	3	f	25	0	0	\N	\N	51	-1	1
405	6	6	f	0	0	0	Following Email Templates	\N	26	-1	1
405	6	6	f	0	0	0	Following Email Templates	\N	27	-1	2
405	6	6	f	0	0	0	Following Email Templates	\N	28	-1	2
406	1	1	t	0	0	0	\N	\N	52	-1	1
406	6	6	f	0	0	0	following-email.html.ftl	\N	26	-1	1
406	6	6	f	0	0	0	Email template used to generate following notification emails - Default version	\N	27	-1	2
406	6	6	f	0	0	0	following-email.html.ftl	\N	28	-1	2
406	21	3	f	26	0	0	\N	\N	51	-1	1
407	1	1	t	0	0	0	\N	\N	52	-1	1
407	6	6	f	0	0	0	following-email_de.html.ftl	\N	26	-1	1
407	6	6	f	0	0	0	Email template used to generate following notification emails - Default version	\N	27	-1	2
407	6	6	f	0	0	0	following-email_de.html.ftl	\N	28	-1	2
407	21	3	f	27	0	0	\N	\N	51	-1	1
408	1	1	t	0	0	0	\N	\N	52	-1	1
408	6	6	f	0	0	0	following-email_es.html.ftl	\N	26	-1	1
408	6	6	f	0	0	0	Email template used to generate following notification emails - Default version	\N	27	-1	2
408	6	6	f	0	0	0	following-email_es.html.ftl	\N	28	-1	2
408	21	3	f	28	0	0	\N	\N	51	-1	1
409	1	1	t	0	0	0	\N	\N	52	-1	1
409	6	6	f	0	0	0	following-email_fr.html.ftl	\N	26	-1	1
409	6	6	f	0	0	0	Email template used to generate following notification emails - Default version	\N	27	-1	2
409	6	6	f	0	0	0	following-email_fr.html.ftl	\N	28	-1	2
409	21	3	f	29	0	0	\N	\N	51	-1	1
410	1	1	t	0	0	0	\N	\N	52	-1	1
410	6	6	f	0	0	0	following-email_it.html.ftl	\N	26	-1	1
410	6	6	f	0	0	0	Email template used to generate following notification emails - Default version	\N	27	-1	2
410	6	6	f	0	0	0	following-email_it.html.ftl	\N	28	-1	2
410	21	3	f	30	0	0	\N	\N	51	-1	1
411	1	1	t	0	0	0	\N	\N	52	-1	1
411	6	6	f	0	0	0	following-email_ja.html.ftl	\N	26	-1	1
411	6	6	f	0	0	0	Email template used to generate following notification emails - Default version	\N	27	-1	2
411	6	6	f	0	0	0	following-email_ja.html.ftl	\N	28	-1	2
411	21	3	f	31	0	0	\N	\N	51	-1	1
412	1	1	t	0	0	0	\N	\N	52	-1	1
412	6	6	f	0	0	0	following-email_nl.html.ftl	\N	26	-1	1
412	6	6	f	0	0	0	Email template used to generate following notification emails - Default version	\N	27	-1	2
412	6	6	f	0	0	0	following-email_nl.html.ftl	\N	28	-1	2
412	21	3	f	32	0	0	\N	\N	51	-1	1
413	6	6	f	0	0	0	Workflow Notification	\N	26	-1	1
413	6	6	f	0	0	0	Workflow notification email templates	\N	27	-1	2
413	6	6	f	0	0	0	Workflow Notification	\N	28	-1	2
413	6	6	f	0	0	0	space-icon-default	\N	29	-1	1
414	1	1	t	0	0	0	\N	\N	52	-1	1
414	6	6	f	0	0	0	wf-email.html.ftl	\N	26	-1	1
414	6	6	f	0	0	0	Email template for notifying users of new a workflow task - Default version	\N	27	-1	2
414	6	6	f	0	0	0	wf-email.html.ftl	\N	28	-1	2
414	21	3	f	33	0	0	\N	\N	51	-1	1
415	1	1	t	0	0	0	\N	\N	52	-1	1
415	6	6	f	0	0	0	wf-email_de.html.ftl	\N	26	-1	1
415	6	6	f	0	0	0	Email template for notifying users of new a workflow task - Default version	\N	27	-1	2
415	6	6	f	0	0	0	wf-email_de.html.ftl	\N	28	-1	2
415	21	3	f	34	0	0	\N	\N	51	-1	1
416	1	1	t	0	0	0	\N	\N	52	-1	1
416	6	6	f	0	0	0	wf-email_es.html.ftl	\N	26	-1	1
416	6	6	f	0	0	0	Email template for notifying users of new a workflow task - Default version	\N	27	-1	2
416	6	6	f	0	0	0	wf-email_es.html.ftl	\N	28	-1	2
416	21	3	f	35	0	0	\N	\N	51	-1	1
417	1	1	t	0	0	0	\N	\N	52	-1	1
417	6	6	f	0	0	0	wf-email_fr.html.ftl	\N	26	-1	1
417	6	6	f	0	0	0	Email template for notifying users of new a workflow task - Default version	\N	27	-1	2
417	6	6	f	0	0	0	wf-email_fr.html.ftl	\N	28	-1	2
417	21	3	f	36	0	0	\N	\N	51	-1	1
418	1	1	t	0	0	0	\N	\N	52	-1	1
418	6	6	f	0	0	0	wf-email_it.html.ftl	\N	26	-1	1
418	6	6	f	0	0	0	Email template for notifying users of new a workflow task - Default version	\N	27	-1	2
418	6	6	f	0	0	0	wf-email_it.html.ftl	\N	28	-1	2
418	21	3	f	37	0	0	\N	\N	51	-1	1
419	1	1	t	0	0	0	\N	\N	52	-1	1
419	6	6	f	0	0	0	wf-email_ja.html.ftl	\N	26	-1	1
419	6	6	f	0	0	0	Email template for notifying users of new a workflow task - Default version	\N	27	-1	2
419	6	6	f	0	0	0	wf-email_ja.html.ftl	\N	28	-1	2
419	21	3	f	38	0	0	\N	\N	51	-1	1
420	1	1	t	0	0	0	\N	\N	52	-1	1
420	6	6	f	0	0	0	wf-email_nl.html.ftl	\N	26	-1	1
420	6	6	f	0	0	0	Email template for notifying users of new a workflow task - Default version	\N	27	-1	2
420	6	6	f	0	0	0	wf-email_nl.html.ftl	\N	28	-1	2
420	21	3	f	39	0	0	\N	\N	51	-1	1
421	1	1	t	0	0	0	\N	\N	52	-1	1
421	0	0	f	0	0	0	\N	\N	55	-1	1
421	6	6	f	0	0	0	RSS_2.0_recent_docs.ftl	\N	26	-1	1
421	6	6	f	0	0	0	Renders a valid RSS2.0 XML document showing the documents in the current space created or modified in the last 7 days. The template should be configured to use the appropriate server and port before use.	\N	27	-1	2
421	6	6	f	0	0	0	RSS recent docs	\N	28	-1	2
421	21	3	f	40	0	0	\N	\N	51	-1	1
422	1	1	t	0	0	0	\N	\N	52	-1	1
422	6	6	f	0	0	0	Kevin Roast	\N	54	-1	1
422	6	6	f	0	0	0	backup.js.sample	\N	26	-1	1
422	6	6	f	0	0	0	Simple document backup script	\N	27	-1	2
422	6	6	f	0	0	0	Backup Script	\N	28	-1	2
422	21	3	f	41	0	0	\N	\N	51	-1	1
423	1	1	t	0	0	0	\N	\N	52	-1	1
423	6	6	f	0	0	0	Kevin Roast	\N	54	-1	1
423	6	6	f	0	0	0	example test script.js.sample	\N	26	-1	1
423	6	6	f	0	0	0	Example of various API calls	\N	27	-1	2
423	6	6	f	0	0	0	Example Test Script	\N	28	-1	2
423	21	3	f	42	0	0	\N	\N	51	-1	1
424	1	1	t	0	0	0	\N	\N	52	-1	1
424	6	6	f	0	0	0	Kevin Roast	\N	54	-1	1
424	6	6	f	0	0	0	backup and log.js.sample	\N	26	-1	1
424	6	6	f	0	0	0	Backup files and log the date and time	\N	27	-1	2
424	6	6	f	0	0	0	Backup and logging Script	\N	28	-1	2
424	21	3	f	43	0	0	\N	\N	51	-1	1
425	1	1	t	0	0	0	\N	\N	52	-1	1
425	6	6	f	0	0	0	Kevin Roast	\N	54	-1	1
425	6	6	f	0	0	0	append copyright.js.sample	\N	26	-1	1
425	6	6	f	0	0	0	Append Copyright line to text or HTML files	\N	27	-1	2
425	6	6	f	0	0	0	Append Copyright to file	\N	28	-1	2
425	21	3	f	44	0	0	\N	\N	51	-1	1
426	1	1	t	0	0	0	\N	\N	52	-1	1
426	6	6	f	0	0	0	Kevin Roast	\N	54	-1	1
426	6	6	f	0	0	0	alfresco docs.js.sample	\N	26	-1	1
426	6	6	f	0	0	0	Search and log all docs containing text	\N	27	-1	2
426	6	6	f	0	0	0	Lucene Search	\N	28	-1	2
426	21	3	f	45	0	0	\N	\N	51	-1	1
427	1	1	t	0	0	0	\N	\N	52	-1	1
427	6	6	f	0	0	0	test return value.js.sample	\N	26	-1	1
439	21	3	f	54	0	0	\N	\N	51	-1	1
427	6	6	f	0	0	0	Return a value from a script - for the command servlet	\N	27	-1	2
427	6	6	f	0	0	0	Return Value Example	\N	28	-1	2
427	21	3	f	46	0	0	\N	\N	51	-1	1
428	6	6	f	0	0	0	Web Scripts	\N	26	-1	1
428	6	6	f	0	0	0	URL addressable Web Services	\N	27	-1	2
428	6	6	f	0	0	0	URL addressable Web Services	\N	28	-1	2
428	6	6	f	0	0	0	space-icon-default	\N	29	-1	1
429	1	1	t	0	0	0	\N	\N	52	-1	1
429	6	6	f	0	0	0		\N	54	-1	1
429	6	6	f	0	0	0	readme.html	\N	26	-1	1
429	6	6	f	0	0	0	What are Web Scripts and how do you develop them?	\N	27	-1	2
429	6	6	f	0	0	0		\N	28	-1	2
429	21	3	f	47	0	0	\N	\N	51	-1	1
430	1	1	t	0	0	0	\N	\N	52	-1	1
430	6	6	f	0	0	0		\N	54	-1	1
430	6	6	f	0	0	0	readme_ja.html	\N	26	-1	1
430	6	6	f	0	0	0	What are Web Scripts and how do you develop them?	\N	27	-1	2
430	6	6	f	0	0	0		\N	28	-1	2
430	21	3	f	48	0	0	\N	\N	51	-1	1
431	1	1	t	0	0	0	\N	\N	52	-1	1
431	6	6	f	0	0	0		\N	54	-1	1
431	6	6	f	0	0	0	readme_de.html	\N	26	-1	1
431	6	6	f	0	0	0	What are Web Scripts and how do you develop them?	\N	27	-1	2
431	6	6	f	0	0	0		\N	28	-1	2
431	21	3	f	49	0	0	\N	\N	51	-1	1
432	1	1	t	0	0	0	\N	\N	52	-1	1
432	6	6	f	0	0	0		\N	54	-1	1
432	6	6	f	0	0	0	readme_fr.html	\N	26	-1	1
432	6	6	f	0	0	0	What are Web Scripts and how do you develop them?	\N	27	-1	2
432	6	6	f	0	0	0		\N	28	-1	2
432	21	3	f	50	0	0	\N	\N	51	-1	1
433	6	6	f	0	0	0	org	\N	26	-1	1
433	6	6	f	0	0	0		\N	27	-1	2
433	6	6	f	0	0	0		\N	28	-1	2
433	6	6	f	0	0	0	space-icon-default	\N	29	-1	1
434	6	6	f	0	0	0	alfresco	\N	26	-1	1
434	6	6	f	0	0	0		\N	27	-1	2
434	6	6	f	0	0	0		\N	28	-1	2
434	6	6	f	0	0	0	space-icon-default	\N	29	-1	1
435	6	6	f	0	0	0	sample	\N	26	-1	1
435	6	6	f	0	0	0		\N	27	-1	2
435	6	6	f	0	0	0		\N	28	-1	2
435	6	6	f	0	0	0	space-icon-default	\N	29	-1	1
436	1	1	t	0	0	0	\N	\N	52	-1	1
436	6	6	f	0	0	0		\N	54	-1	1
436	6	6	f	0	0	0	blogsearch.get.js	\N	26	-1	1
436	6	6	f	0	0	0		\N	27	-1	2
436	6	6	f	0	0	0	blogsearch.get.js	\N	28	-1	2
436	21	3	f	51	0	0	\N	\N	51	-1	1
437	1	1	t	0	0	0	\N	\N	52	-1	1
437	6	6	f	0	0	0		\N	54	-1	1
437	6	6	f	0	0	0	blogsearch.get.atom.ftl	\N	26	-1	1
437	6	6	f	0	0	0		\N	27	-1	2
437	6	6	f	0	0	0	blogsearch.get.atom.ftl	\N	28	-1	2
437	21	3	f	52	0	0	\N	\N	51	-1	1
438	1	1	t	0	0	0	\N	\N	52	-1	1
438	6	6	f	0	0	0		\N	54	-1	1
438	6	6	f	0	0	0	blogsearch.get.desc.xml	\N	26	-1	1
438	6	6	f	0	0	0		\N	27	-1	2
438	6	6	f	0	0	0	blogsearch.get.desc.xml	\N	28	-1	2
438	21	3	f	53	0	0	\N	\N	51	-1	1
439	1	1	t	0	0	0	\N	\N	52	-1	1
439	6	6	f	0	0	0		\N	54	-1	1
439	6	6	f	0	0	0	blogsearch.get.html.ftl	\N	26	-1	1
439	6	6	f	0	0	0		\N	27	-1	2
439	6	6	f	0	0	0	blogsearch.get.html.ftl	\N	28	-1	2
440	1	1	t	0	0	0	\N	\N	52	-1	1
440	6	6	f	0	0	0		\N	54	-1	1
440	6	6	f	0	0	0	blogsearch.get.html.400.ftl	\N	26	-1	1
440	6	6	f	0	0	0		\N	27	-1	2
440	6	6	f	0	0	0	blogsearch.get.html.400.ftl	\N	28	-1	2
440	21	3	f	55	0	0	\N	\N	51	-1	1
441	1	1	t	0	0	0	\N	\N	52	-1	1
441	6	6	f	0	0	0		\N	54	-1	1
441	6	6	f	0	0	0	blogsearch.get.atom.400.ftl	\N	26	-1	1
441	6	6	f	0	0	0		\N	27	-1	2
441	6	6	f	0	0	0	blogsearch.get.atom.400.ftl	\N	28	-1	2
441	21	3	f	56	0	0	\N	\N	51	-1	1
442	1	1	t	0	0	0	\N	\N	52	-1	1
442	6	6	f	0	0	0		\N	54	-1	1
442	6	6	f	0	0	0	categorysearch.get.js	\N	26	-1	1
442	6	6	f	0	0	0		\N	27	-1	2
442	6	6	f	0	0	0	categorysearch.get.js	\N	28	-1	2
442	21	3	f	57	0	0	\N	\N	51	-1	1
443	1	1	t	0	0	0	\N	\N	52	-1	1
443	6	6	f	0	0	0		\N	54	-1	1
443	6	6	f	0	0	0	categorysearch.get.atom.ftl	\N	26	-1	1
443	6	6	f	0	0	0		\N	27	-1	2
443	6	6	f	0	0	0	categorysearch.get.atom.ftl	\N	28	-1	2
443	21	3	f	58	0	0	\N	\N	51	-1	1
444	1	1	t	0	0	0	\N	\N	52	-1	1
444	6	6	f	0	0	0		\N	54	-1	1
444	6	6	f	0	0	0	categorysearch.get.desc.xml	\N	26	-1	1
444	6	6	f	0	0	0		\N	27	-1	2
444	6	6	f	0	0	0	categorysearch.get.desc.xml	\N	28	-1	2
444	21	3	f	59	0	0	\N	\N	51	-1	1
445	1	1	t	0	0	0	\N	\N	52	-1	1
445	6	6	f	0	0	0		\N	54	-1	1
445	6	6	f	0	0	0	categorysearch.get.html.ftl	\N	26	-1	1
445	6	6	f	0	0	0		\N	27	-1	2
445	6	6	f	0	0	0	categorysearch.get.html.ftl	\N	28	-1	2
445	21	3	f	60	0	0	\N	\N	51	-1	1
446	1	1	t	0	0	0	\N	\N	52	-1	1
446	6	6	f	0	0	0		\N	54	-1	1
446	6	6	f	0	0	0	categorysearch.get.html.404.ftl	\N	26	-1	1
446	6	6	f	0	0	0		\N	27	-1	2
446	6	6	f	0	0	0	categorysearch.get.html.404.ftl	\N	28	-1	2
446	21	3	f	61	0	0	\N	\N	51	-1	1
447	1	1	t	0	0	0	\N	\N	52	-1	1
447	6	6	f	0	0	0		\N	54	-1	1
447	6	6	f	0	0	0	categorysearch.get.atom.404.ftl	\N	26	-1	1
447	6	6	f	0	0	0		\N	27	-1	2
447	6	6	f	0	0	0	categorysearch.get.atom.404.ftl	\N	28	-1	2
447	21	3	f	62	0	0	\N	\N	51	-1	1
448	1	1	t	0	0	0	\N	\N	52	-1	1
448	6	6	f	0	0	0		\N	54	-1	1
448	6	6	f	0	0	0	folder.get.js	\N	26	-1	1
448	6	6	f	0	0	0		\N	27	-1	2
448	6	6	f	0	0	0	folder.get.js	\N	28	-1	2
448	21	3	f	63	0	0	\N	\N	51	-1	1
449	1	1	t	0	0	0	\N	\N	52	-1	1
449	6	6	f	0	0	0		\N	54	-1	1
449	6	6	f	0	0	0	folder.get.atom.ftl	\N	26	-1	1
449	6	6	f	0	0	0		\N	27	-1	2
449	6	6	f	0	0	0	folder.get.atom.ftl	\N	28	-1	2
449	21	3	f	64	0	0	\N	\N	51	-1	1
450	1	1	t	0	0	0	\N	\N	52	-1	1
450	6	6	f	0	0	0		\N	54	-1	1
450	6	6	f	0	0	0	folder.get.desc.xml	\N	26	-1	1
450	6	6	f	0	0	0		\N	27	-1	2
450	6	6	f	0	0	0	folder.get.desc.xml	\N	28	-1	2
450	21	3	f	65	0	0	\N	\N	51	-1	1
451	1	1	t	0	0	0	\N	\N	52	-1	1
451	6	6	f	0	0	0		\N	54	-1	1
451	6	6	f	0	0	0	folder.get.html.ftl	\N	26	-1	1
451	6	6	f	0	0	0		\N	27	-1	2
451	6	6	f	0	0	0	folder.get.html.ftl	\N	28	-1	2
451	21	3	f	66	0	0	\N	\N	51	-1	1
452	6	6	f	0	0	0	Web Scripts Extensions	\N	26	-1	1
452	6	6	f	0	0	0	Customized Web Scripts	\N	27	-1	2
452	6	6	f	0	0	0	URL addressable Web Service Extensions	\N	28	-1	2
452	6	6	f	0	0	0	space-icon-default	\N	29	-1	1
453	1	1	t	0	0	0	\N	\N	52	-1	1
453	6	6	f	0	0	0		\N	54	-1	1
453	6	6	f	0	0	0	readme.html	\N	26	-1	1
453	6	6	f	0	0	0	How to customize an existing Web Script	\N	27	-1	2
453	6	6	f	0	0	0		\N	28	-1	2
453	21	3	f	67	0	0	\N	\N	51	-1	1
428	12	6	f	0	0	0	workspace://SpacesStore/966f72fe-be93-43b3-b1a6-724f2f366dec	\N	57	-1	1
452	12	6	f	0	0	0	workspace://SpacesStore/966f72fe-be93-43b3-b1a6-724f2f366dec	\N	57	-1	1
454	6	6	f	0	0	0	Models	\N	26	-1	1
454	6	6	f	0	0	0	Customized Models	\N	27	-1	2
454	6	6	f	0	0	0	Customized Models	\N	28	-1	2
454	6	6	f	0	0	0	space-icon-default	\N	29	-1	1
456	6	6	f	0	0	0	inbound	\N	65	0	1
456	6	6	f	0	0	0	Specialise Type to Dictionary Model	\N	27	-1	2
456	6	6	f	0	0	0	Specialise Type to Dictionary Model	\N	28	-1	2
456	1	1	f	0	0	0	\N	\N	62	-1	1
456	1	1	f	0	0	0	\N	\N	63	-1	1
456	1	1	f	0	0	0	\N	\N	64	-1	1
457	1	1	f	0	0	0	\N	\N	68	-1	1
457	0	0	f	0	0	0	\N	\N	69	-1	1
457	6	6	f	0	0	0	composite-action	\N	70	-1	1
457	0	0	f	0	0	0	\N	\N	71	-1	1
458	1	1	f	0	0	0	\N	\N	74	-1	1
458	6	6	f	0	0	0	compare-mime-type	\N	70	-1	1
459	6	6	f	0	0	0	text/xml	\N	77	-1	1
459	6	6	f	0	0	0	value	\N	78	-1	1
460	1	1	f	0	0	0	\N	\N	68	-1	1
460	0	0	f	0	0	0	\N	\N	69	-1	1
460	6	6	f	0	0	0	specialise-type	\N	70	-1	1
460	0	0	f	0	0	0	\N	\N	71	-1	1
461	15	6	f	0	0	0	{http://www.alfresco.org/model/content/1.0}dictionaryModel	\N	77	-1	1
461	6	6	f	0	0	0	type-name	\N	78	-1	1
462	6	6	f	0	0	0	Messages	\N	26	-1	1
462	6	6	f	0	0	0	Customized Messages	\N	27	-1	2
462	6	6	f	0	0	0	Customized Messages	\N	28	-1	2
462	6	6	f	0	0	0	space-icon-default	\N	29	-1	1
463	6	6	f	0	0	0	Web Client Extension	\N	26	-1	1
463	6	6	f	0	0	0	Customized Web Client	\N	27	-1	2
463	6	6	f	0	0	0	Customized Web Client	\N	28	-1	2
463	6	6	f	0	0	0	space-icon-default	\N	29	-1	1
464	6	6	f	0	0	0	Workflow Definitions	\N	26	-1	1
464	6	6	f	0	0	0	Customized Workflow Process Definitions	\N	27	-1	2
464	6	6	f	0	0	0	Customized Workflow Process Definitions	\N	28	-1	2
464	6	6	f	0	0	0	space-icon-default	\N	29	-1	1
466	6	6	f	0	0	0	inbound	\N	65	0	1
466	6	6	f	0	0	0	Specialise Type to Workflow Process Definition	\N	27	-1	2
466	6	6	f	0	0	0	Specialise Type to Workflow Process Definition	\N	28	-1	2
466	1	1	f	0	0	0	\N	\N	62	-1	1
466	1	1	f	0	0	0	\N	\N	63	-1	1
466	1	1	f	0	0	0	\N	\N	64	-1	1
467	1	1	f	0	0	0	\N	\N	68	-1	1
467	0	0	f	0	0	0	\N	\N	69	-1	1
467	6	6	f	0	0	0	composite-action	\N	70	-1	1
467	0	0	f	0	0	0	\N	\N	71	-1	1
468	1	1	f	0	0	0	\N	\N	74	-1	1
468	6	6	f	0	0	0	compare-mime-type	\N	70	-1	1
469	6	6	f	0	0	0	text/xml	\N	77	-1	1
469	6	6	f	0	0	0	value	\N	78	-1	1
470	1	1	f	0	0	0	\N	\N	68	-1	1
470	0	0	f	0	0	0	\N	\N	69	-1	1
470	6	6	f	0	0	0	specialise-type	\N	70	-1	1
470	0	0	f	0	0	0	\N	\N	71	-1	1
471	15	6	f	0	0	0	{http://www.alfresco.org/model/bpm/1.0}workflowDefinition	\N	77	-1	1
471	6	6	f	0	0	0	type-name	\N	78	-1	1
472	6	6	f	0	0	0	Tags	\N	26	-1	1
473	6	6	f	0	0	0	Sites	\N	26	-1	1
473	6	6	f	0	0	0	Site Collaboration Spaces	\N	27	-1	2
473	6	6	f	0	0	0	Sites	\N	28	-1	2
473	6	6	f	0	0	0	space-icon-default	\N	29	-1	1
474	6	6	f	0	0	0	surf-config	\N	26	-1	1
474	6	6	f	0	0	0		\N	27	-1	2
474	2	3	f	0	0	0	\N	\N	82	-1	1
474	1	1	f	0	0	0	\N	\N	83	-1	1
474	1	1	f	0	0	0	\N	\N	84	-1	1
474	1	1	f	0	0	0	\N	\N	86	-1	1
474	1	1	f	0	0	0	\N	\N	87	-1	1
475	6	6	f	0	0	0	extensions	\N	26	-1	1
475	6	6	f	0	0	0		\N	27	-1	2
475	2	3	f	0	0	0	\N	\N	82	-1	1
475	1	1	f	0	0	0	\N	\N	83	-1	1
475	1	1	f	0	0	0	\N	\N	84	-1	1
476	6	6	f	0	0	0	module-deployments	\N	26	-1	1
476	6	6	f	0	0	0		\N	27	-1	2
476	2	3	f	0	0	0	\N	\N	82	-1	1
476	1	1	f	0	0	0	\N	\N	83	-1	1
476	1	1	f	0	0	0	\N	\N	84	-1	1
478	6	6	f	0	0	0	GROUP_ALFRESCO_ADMINISTRATORS	\N	90	-1	1
479	6	6	f	0	0	0	GROUP_EMAIL_CONTRIBUTORS	\N	90	-1	1
480	6	6	f	0	0	0	GROUP_SITE_ADMINISTRATORS	\N	90	-1	1
481	6	6	f	0	0	0	GROUP_ALFRESCO_SEARCH_ADMINISTRATORS	\N	90	-1	1
482	6	6	f	0	0	0	GROUP_ALFRESCO_MODEL_ADMINISTRATORS	\N	90	-1	1
486	6	6	f	0	0	0	Remote Credentials	\N	26	-1	1
486	6	6	f	0	0	0	Root folder for Shared Remote Credentials	\N	27	-1	2
486	6	6	f	0	0	0	Remote Credentials	\N	28	-1	2
487	6	6	f	0	0	0	SyncSet Definitions	\N	26	-1	1
487	6	6	f	0	0	0	Root folder for SyncSet Definitions	\N	27	-1	2
487	6	6	f	0	0	0	SyncSet Definitions	\N	28	-1	2
488	6	6	f	0	0	0	Imap Configs	\N	26	-1	1
488	6	6	f	0	0	0	Imap Configs	\N	27	-1	2
488	6	6	f	0	0	0	Imap Configs	\N	28	-1	2
488	6	6	f	0	0	0	space-icon-default	\N	29	-1	1
489	6	6	f	0	0	0	Templates	\N	26	-1	1
489	6	6	f	0	0	0	Templates for IMAP generated messages	\N	27	-1	2
489	6	6	f	0	0	0	Templates	\N	28	-1	2
489	6	6	f	0	0	0	space-icon-default	\N	29	-1	1
490	1	1	t	0	0	0	\N	\N	52	-1	1
490	6	6	f	0	0	0		\N	54	-1	1
490	6	6	f	0	0	0	emailbody-textplain.ftl	\N	26	-1	1
490	6	6	f	0	0	0	Email template used to generate the "multipart/alternative" IMAP message body ("text/plain" part) - Default version	\N	27	-1	2
490	6	6	f	0	0	0	emailbody-textplain.ftl	\N	28	-1	2
490	21	3	f	68	0	0	\N	\N	51	-1	1
491	1	1	t	0	0	0	\N	\N	52	-1	1
491	6	6	f	0	0	0		\N	54	-1	1
491	6	6	f	0	0	0	emailbody-texthtml.ftl	\N	26	-1	1
491	6	6	f	0	0	0	Email template used to generate the "multipart/alternative" IMAP message body ("text/html" part) - Default version	\N	27	-1	2
491	6	6	f	0	0	0	emailbody-texthtml.ftl	\N	28	-1	2
491	21	3	f	69	0	0	\N	\N	51	-1	1
492	6	6	f	0	0	0	Transfers	\N	26	-1	1
492	6	6	f	0	0	0	Folder used by the Transfer subsystem	\N	27	-1	2
492	6	6	f	0	0	0	Transfers	\N	28	-1	2
492	6	6	f	0	0	0	space-icon-default	\N	29	-1	1
493	6	6	f	0	0	0	Transfer Target Groups	\N	26	-1	1
493	6	6	f	0	0	0	Folder containing groups of transfer targets	\N	27	-1	2
493	6	6	f	0	0	0	Transfer Target Groups	\N	28	-1	2
493	6	6	f	0	0	0	space-icon-default	\N	29	-1	1
494	6	6	f	0	0	0	Default Group	\N	26	-1	1
494	6	6	f	0	0	0	Put your transfer targets in this folder	\N	27	-1	2
494	6	6	f	0	0	0	Default Group	\N	28	-1	2
494	6	6	f	0	0	0	space-icon-default	\N	29	-1	1
495	6	6	f	0	0	0	Inbound Transfer Records	\N	26	-1	1
495	6	6	f	0	0	0	Folder containing records of inbound transfers	\N	27	-1	2
495	6	6	f	0	0	0	Inbound Transfer Records	\N	28	-1	2
495	6	6	f	0	0	0	space-icon-default	\N	29	-1	1
496	6	6	f	0	0	0	Temp	\N	26	-1	1
496	6	6	f	0	0	0	Folder to store temporary nodes during transfer	\N	27	-1	2
496	6	6	f	0	0	0	Temp	\N	28	-1	2
496	6	6	f	0	0	0	space-icon-default	\N	29	-1	1
497	6	6	f	0	0	0	Rendering Actions Space	\N	26	-1	1
497	6	6	f	0	0	0	A space used by the system to persist rendering actions.	\N	27	-1	2
497	6	6	f	0	0	0	Rendering Actions Space	\N	28	-1	2
498	6	6	f	0	0	0	Replication Actions Space	\N	26	-1	1
498	6	6	f	0	0	0	A space used by the system to persist replication actions.	\N	27	-1	2
498	6	6	f	0	0	0	Replication Actions Space	\N	28	-1	2
500	6	6	f	0	0	0	inbound	\N	65	0	1
500	6	6	f	0	0	0		\N	27	-1	2
500	6	6	f	0	0	0	Specialise child folders into Transfer Targets	\N	28	-1	2
500	1	1	f	0	0	0	\N	\N	62	-1	1
500	1	1	f	0	0	0	\N	\N	63	-1	1
500	1	1	f	0	0	0	\N	\N	64	-1	1
501	0	0	f	0	0	0	\N	\N	98	-1	1
501	7	6	f	0	0	0	2010-08-11T12:06:18.419Z	\N	99	-1	1
501	1	1	f	0	0	0	\N	\N	68	-1	1
501	7	6	f	0	0	0	2010-08-11T12:06:18.408Z	\N	100	-1	1
501	0	0	f	0	0	0	\N	\N	69	-1	1
501	6	6	f	0	0	0	Completed	\N	101	-1	1
501	6	6	f	0	0	0	composite-action	\N	70	-1	1
501	0	0	f	0	0	0	\N	\N	71	-1	1
503	0	0	f	0	0	0	\N	\N	98	-1	1
503	0	0	f	0	0	0	\N	\N	99	-1	1
503	1	1	f	0	0	0	\N	\N	68	-1	1
503	0	0	f	0	0	0	\N	\N	100	-1	1
503	0	0	f	0	0	0	\N	\N	69	-1	1
503	6	6	f	0	0	0	New	\N	101	-1	1
503	6	6	f	0	0	0	specialise-type	\N	70	-1	1
503	0	0	f	0	0	0	\N	\N	71	-1	1
504	15	6	f	0	0	0	{http://www.alfresco.org/model/transfer/1.0}transferTarget	\N	77	-1	1
504	6	6	f	0	0	0	type-name	\N	78	-1	1
505	1	1	f	0	0	0	\N	\N	74	-1	1
505	6	6	f	0	0	0	is-subtype	\N	70	-1	1
506	15	6	f	0	0	0	{http://www.alfresco.org/model/content/1.0}folder	\N	77	-1	1
506	6	6	f	0	0	0	type	\N	78	-1	1
507	6	6	f	0	0	0	Scheduled Actions	\N	26	-1	1
507	6	6	f	0	0	0	Schedule of when persistent actions are executed	\N	27	-1	2
507	6	6	f	0	0	0	Scheduled Actions	\N	28	-1	2
508	1	1	t	0	0	0	\N	\N	52	-1	1
508	6	6	f	0	0	0	new-user-email.html.ftl	\N	26	-1	1
508	6	6	f	0	0	0	Email template used to inform new users of their accounts - Default version	\N	27	-1	2
508	6	6	f	0	0	0	new-user-email.html.ftl	\N	28	-1	2
508	21	3	f	70	0	0	\N	\N	51	-1	1
509	1	1	t	0	0	0	\N	\N	52	-1	1
509	6	6	f	0	0	0	new-user-email_fr.html.ftl	\N	26	-1	1
509	6	6	f	0	0	0	Email template used to inform new users of their accounts - French version	\N	27	-1	2
509	6	6	f	0	0	0	new-user-email_fr.html.ftl	\N	28	-1	2
509	21	3	f	71	0	0	\N	\N	51	-1	1
510	1	1	t	0	0	0	\N	\N	52	-1	1
510	6	6	f	0	0	0	new-user-email_es.html.ftl	\N	26	-1	1
510	6	6	f	0	0	0	Email template used to inform new users of their accounts - Spanish version	\N	27	-1	2
510	6	6	f	0	0	0	new-user-email_es.html.ftl	\N	28	-1	2
510	21	3	f	72	0	0	\N	\N	51	-1	1
511	1	1	t	0	0	0	\N	\N	52	-1	1
511	6	6	f	0	0	0	new-user-email_de.html.ftl	\N	26	-1	1
511	6	6	f	0	0	0	Email template used to inform new users of their accounts - German version	\N	27	-1	2
511	6	6	f	0	0	0	new-user-email_de.html.ftl	\N	28	-1	2
511	21	3	f	73	0	0	\N	\N	51	-1	1
512	1	1	t	0	0	0	\N	\N	52	-1	1
512	6	6	f	0	0	0	new-user-email_it.html.ftl	\N	26	-1	1
512	6	6	f	0	0	0	Email template used to inform new users of their accounts - Italian version	\N	27	-1	2
512	6	6	f	0	0	0	new-user-email_it.html.ftl	\N	28	-1	2
512	21	3	f	74	0	0	\N	\N	51	-1	1
513	1	1	t	0	0	0	\N	\N	52	-1	1
513	6	6	f	0	0	0	new-user-email_ja.html.ftl	\N	26	-1	1
513	6	6	f	0	0	0	Email template used to inform new users of their accounts - Japanese version	\N	27	-1	2
513	6	6	f	0	0	0	new-user-email_ja.html.ftl	\N	28	-1	2
513	21	3	f	75	0	0	\N	\N	51	-1	1
514	1	1	t	0	0	0	\N	\N	52	-1	1
514	6	6	f	0	0	0	new-user-email_nl.html.ftl	\N	26	-1	1
514	6	6	f	0	0	0	Email template used to inform new users of their accounts - Dutch version	\N	27	-1	2
514	6	6	f	0	0	0	new-user-email_nl.html.ftl	\N	28	-1	2
514	21	3	f	76	0	0	\N	\N	51	-1	1
515	1	1	t	0	0	0	\N	\N	52	-1	1
515	6	6	f	0	0	0	invite-email.html.ftl	\N	26	-1	1
515	6	6	f	0	0	0	Email template used to generate the invite email for Alfresco Share - Default version	\N	27	-1	2
515	6	6	f	0	0	0	invite-email.html.ftl	\N	28	-1	2
515	21	3	f	77	0	0	\N	\N	51	-1	1
516	1	1	t	0	0	0	\N	\N	52	-1	1
516	6	6	f	0	0	0	invite-email_fr.html.ftl	\N	26	-1	1
516	6	6	f	0	0	0	Email template used to generate the invite email for Alfresco Share - French version	\N	27	-1	2
516	6	6	f	0	0	0	invite-email_fr.html.ftl	\N	28	-1	2
516	21	3	f	78	0	0	\N	\N	51	-1	1
517	1	1	t	0	0	0	\N	\N	52	-1	1
517	6	6	f	0	0	0	invite-email_es.html.ftl	\N	26	-1	1
517	6	6	f	0	0	0	Email template used to generate the invite email for Alfresco Share - Spanish version	\N	27	-1	2
517	6	6	f	0	0	0	invite-email_es.html.ftl	\N	28	-1	2
517	21	3	f	79	0	0	\N	\N	51	-1	1
518	1	1	t	0	0	0	\N	\N	52	-1	1
518	6	6	f	0	0	0	invite-email_de.html.ftl	\N	26	-1	1
518	6	6	f	0	0	0	Email template used to generate the invite email for Alfresco Share - German version	\N	27	-1	2
518	6	6	f	0	0	0	invite-email_de.html.ftl	\N	28	-1	2
518	21	3	f	80	0	0	\N	\N	51	-1	1
519	1	1	t	0	0	0	\N	\N	52	-1	1
519	6	6	f	0	0	0	invite-email_it.html.ftl	\N	26	-1	1
519	6	6	f	0	0	0	Email template used to generate the invite email for Alfresco Share - Italian version	\N	27	-1	2
519	6	6	f	0	0	0	invite-email_it.html.ftl	\N	28	-1	2
519	21	3	f	81	0	0	\N	\N	51	-1	1
520	1	1	t	0	0	0	\N	\N	52	-1	1
520	6	6	f	0	0	0	invite-email_ja.html.ftl	\N	26	-1	1
531	21	3	f	93	0	0	\N	\N	51	-1	1
520	6	6	f	0	0	0	Email template used to generate the invite email for Alfresco Share - Japanese version	\N	27	-1	2
520	6	6	f	0	0	0	invite-email_ja.html.ftl	\N	28	-1	2
520	21	3	f	82	0	0	\N	\N	51	-1	1
521	1	1	t	0	0	0	\N	\N	52	-1	1
521	6	6	f	0	0	0	invite-email_nl.html.ftl	\N	26	-1	1
521	6	6	f	0	0	0	Email template used to generate the invite email for Alfresco Share - Dutch version	\N	27	-1	2
521	6	6	f	0	0	0	invite-email_nl.html.ftl	\N	28	-1	2
521	21	3	f	83	0	0	\N	\N	51	-1	1
522	1	1	t	0	0	0	\N	\N	52	-1	1
522	6	6	f	0	0	0	invite-email-add-direct.html.ftl	\N	26	-1	1
522	6	6	f	0	0	0	Email template used to generate the user added to site email for Alfresco Share - Default version	\N	27	-1	2
522	6	6	f	0	0	0	invite-email-add-direct.html.ftl	\N	28	-1	2
522	21	3	f	84	0	0	\N	\N	51	-1	1
523	1	1	t	0	0	0	\N	\N	52	-1	1
523	6	6	f	0	0	0	invite-email-add-direct.html_fr.ftl	\N	26	-1	1
523	6	6	f	0	0	0	Email template used to generate the user added to site email for Alfresco Share - French version	\N	27	-1	2
523	6	6	f	0	0	0	invite-email-add-direct.html_fr.ftl	\N	28	-1	2
523	21	3	f	85	0	0	\N	\N	51	-1	1
524	1	1	t	0	0	0	\N	\N	52	-1	1
524	6	6	f	0	0	0	invite-email-add-direct.html_es.ftl	\N	26	-1	1
524	6	6	f	0	0	0	Email template used to generate the user added to site email for Alfresco Share - Spanish version	\N	27	-1	2
524	6	6	f	0	0	0	invite-email-add-direct.html_es.ftl	\N	28	-1	2
524	21	3	f	86	0	0	\N	\N	51	-1	1
525	1	1	t	0	0	0	\N	\N	52	-1	1
525	6	6	f	0	0	0	invite-email-add-direct.html_de.ftl	\N	26	-1	1
525	6	6	f	0	0	0	Email template used to generate the user added to site email for Alfresco Share - German version	\N	27	-1	2
525	6	6	f	0	0	0	invite-email-add-direct.html_de.ftl	\N	28	-1	2
525	21	3	f	87	0	0	\N	\N	51	-1	1
526	1	1	t	0	0	0	\N	\N	52	-1	1
526	6	6	f	0	0	0	invite-email-add-direct.html_it.ftl	\N	26	-1	1
526	6	6	f	0	0	0	Email template used to generate the user added to site email for Alfresco Share - Italian version	\N	27	-1	2
526	6	6	f	0	0	0	invite-email-add-direct.html_it.ftl	\N	28	-1	2
526	21	3	f	88	0	0	\N	\N	51	-1	1
527	1	1	t	0	0	0	\N	\N	52	-1	1
527	6	6	f	0	0	0	invite-email-add-direct.html_ja.ftl	\N	26	-1	1
527	6	6	f	0	0	0	Email template used to generate the user added to site email for Alfresco Share - Japanese version	\N	27	-1	2
527	6	6	f	0	0	0	invite-email-add-direct.html_ja.ftl	\N	28	-1	2
527	21	3	f	89	0	0	\N	\N	51	-1	1
528	1	1	t	0	0	0	\N	\N	52	-1	1
528	6	6	f	0	0	0	invite-email-add-direct.html_nl.ftl	\N	26	-1	1
528	6	6	f	0	0	0	Email template used to generate the user added to site email for Alfresco Share - Dutch version	\N	27	-1	2
528	6	6	f	0	0	0	invite-email-add-direct.html_nl.ftl	\N	28	-1	2
528	21	3	f	90	0	0	\N	\N	51	-1	1
529	1	1	t	0	0	0	\N	\N	52	-1	1
529	6	6	f	0	0	0	invite-email-moderated.html.ftl	\N	26	-1	1
529	6	6	f	0	0	0	Email template used to generate the request to join site email for Alfresco Share - Default version	\N	27	-1	2
529	6	6	f	0	0	0	invite-email-moderated.html.ftl	\N	28	-1	2
529	21	3	f	91	0	0	\N	\N	51	-1	1
530	1	1	t	0	0	0	\N	\N	52	-1	1
530	6	6	f	0	0	0	notify_user_email.html.ftl	\N	26	-1	1
530	6	6	f	0	0	0	Email template for notifying users from a rule or action - Default version	\N	27	-1	2
530	6	6	f	0	0	0	notify_user_email.html.ftl	\N	28	-1	2
530	21	3	f	92	0	0	\N	\N	51	-1	1
531	1	1	t	0	0	0	\N	\N	52	-1	1
531	6	6	f	0	0	0	notify_user_email_de.html.ftl	\N	26	-1	1
531	6	6	f	0	0	0	Email template for notifying users from a rule or action - German version	\N	27	-1	2
531	6	6	f	0	0	0	notify_user_email_de.html.ftl	\N	28	-1	2
532	1	1	t	0	0	0	\N	\N	52	-1	1
532	6	6	f	0	0	0	notify_user_email_es.html.ftl	\N	26	-1	1
532	6	6	f	0	0	0	Email template for notifying users from a rule or action - Spanish version	\N	27	-1	2
532	6	6	f	0	0	0	notify_user_email_es.html.ftl	\N	28	-1	2
532	21	3	f	94	0	0	\N	\N	51	-1	1
533	1	1	t	0	0	0	\N	\N	52	-1	1
533	6	6	f	0	0	0	notify_user_email_fr.html.ftl	\N	26	-1	1
533	6	6	f	0	0	0	Email template for notifying users from a rule or action - French version	\N	27	-1	2
533	6	6	f	0	0	0	notify_user_email_fr.html.ftl	\N	28	-1	2
533	21	3	f	95	0	0	\N	\N	51	-1	1
534	1	1	t	0	0	0	\N	\N	52	-1	1
534	6	6	f	0	0	0	notify_user_email_it.html.ftl	\N	26	-1	1
534	6	6	f	0	0	0	Email template for notifying users from a rule or action - Italian version	\N	27	-1	2
534	6	6	f	0	0	0	notify_user_email_it.html.ftl	\N	28	-1	2
534	21	3	f	96	0	0	\N	\N	51	-1	1
535	1	1	t	0	0	0	\N	\N	52	-1	1
535	6	6	f	0	0	0	notify_user_email_ja.html.ftl	\N	26	-1	1
535	6	6	f	0	0	0	Email template for notifying users from a rule or action - Japanese version	\N	27	-1	2
535	6	6	f	0	0	0	notify_user_email_ja.html.ftl	\N	28	-1	2
535	21	3	f	97	0	0	\N	\N	51	-1	1
536	1	1	t	0	0	0	\N	\N	52	-1	1
536	6	6	f	0	0	0	notify_user_email_nl.html.ftl	\N	26	-1	1
536	6	6	f	0	0	0	Email template for notifying users from a rule or action - Dutch version	\N	27	-1	2
536	6	6	f	0	0	0	notify_user_email_nl.html.ftl	\N	28	-1	2
536	21	3	f	98	0	0	\N	\N	51	-1	1
537	1	1	t	0	0	0	\N	\N	52	-1	1
537	6	6	f	0	0	0		\N	54	-1	1
537	6	6	f	0	0	0	emailbody_textplain_share.ftl	\N	26	-1	1
537	6	6	f	0	0	0	Email template used to generate the "multipart/alternative" IMAP message body ("text/plain" part) for Alfresco Share - Default version	\N	27	-1	2
537	6	6	f	0	0	0	emailbody_textplain_share.ftl	\N	28	-1	2
537	21	3	f	99	0	0	\N	\N	51	-1	1
538	1	1	t	0	0	0	\N	\N	52	-1	1
538	6	6	f	0	0	0		\N	54	-1	1
538	6	6	f	0	0	0	emailbody_textplain_alfresco.ftl	\N	26	-1	1
538	6	6	f	0	0	0	Email template used to generate the "multipart/alternative" IMAP message body ("text/plain" part) - Default version	\N	27	-1	2
538	6	6	f	0	0	0	emailbody_textplain_alfresco.ftl	\N	28	-1	2
538	21	3	f	100	0	0	\N	\N	51	-1	1
539	1	1	t	0	0	0	\N	\N	52	-1	1
539	6	6	f	0	0	0		\N	54	-1	1
539	6	6	f	0	0	0	emailbody_texthtml_alfresco.ftl	\N	26	-1	1
539	6	6	f	0	0	0	Email template used to generate the "multipart/alternative" IMAP message body ("text/html" part) - Default version	\N	27	-1	2
539	6	6	f	0	0	0	emailbody_texthtml_alfresco.ftl	\N	28	-1	2
539	21	3	f	101	0	0	\N	\N	51	-1	1
540	1	1	t	0	0	0	\N	\N	52	-1	1
540	6	6	f	0	0	0		\N	54	-1	1
540	6	6	f	0	0	0	emailbody_texthtml_share.ftl	\N	26	-1	1
540	6	6	f	0	0	0	Email template used to generate the "multipart/alternative" IMAP message body ("text/html" part) for Alfresco Share - Default version	\N	27	-1	2
540	6	6	f	0	0	0	emailbody_texthtml_share.ftl	\N	28	-1	2
540	21	3	f	102	0	0	\N	\N	51	-1	1
541	1	1	t	0	0	0	\N	\N	52	-1	1
541	6	6	f	0	0	0		\N	54	-1	1
541	6	6	f	0	0	0	emailbody_textplain_share_de.ftl	\N	26	-1	1
541	6	6	f	0	0	0	Email template used to generate the "multipart/alternative" IMAP message body ("text/plain" part) for Alfresco Share - German version	\N	27	-1	2
541	6	6	f	0	0	0	emailbody_textplain_share_de.ftl	\N	28	-1	2
541	21	3	f	103	0	0	\N	\N	51	-1	1
542	1	1	t	0	0	0	\N	\N	52	-1	1
542	6	6	f	0	0	0		\N	54	-1	1
542	6	6	f	0	0	0	emailbody_textplain_alfresco_de.ftl	\N	26	-1	1
542	6	6	f	0	0	0	Email template used to generate the "multipart/alternative" IMAP message body ("text/plain" part) - German version	\N	27	-1	2
542	6	6	f	0	0	0	emailbody_textplain_alfresco_de.ftl	\N	28	-1	2
542	21	3	f	104	0	0	\N	\N	51	-1	1
543	1	1	t	0	0	0	\N	\N	52	-1	1
543	6	6	f	0	0	0		\N	54	-1	1
543	6	6	f	0	0	0	emailbody_texthtml_alfresco_de.ftl	\N	26	-1	1
543	6	6	f	0	0	0	Email template used to generate the "multipart/alternative" IMAP message body ("text/html" part) - German version	\N	27	-1	2
543	6	6	f	0	0	0	emailbody_texthtml_alfresco_de.ftl	\N	28	-1	2
543	21	3	f	105	0	0	\N	\N	51	-1	1
544	1	1	t	0	0	0	\N	\N	52	-1	1
544	6	6	f	0	0	0		\N	54	-1	1
544	6	6	f	0	0	0	emailbody_texthtml_share_de.ftl	\N	26	-1	1
544	6	6	f	0	0	0	Email template used to generate the "multipart/alternative" IMAP message body ("text/html" part) for Alfresco Share - German version	\N	27	-1	2
544	6	6	f	0	0	0	emailbody_texthtml_share_de.ftl	\N	28	-1	2
544	21	3	f	106	0	0	\N	\N	51	-1	1
545	1	1	t	0	0	0	\N	\N	52	-1	1
545	6	6	f	0	0	0		\N	54	-1	1
545	6	6	f	0	0	0	emailbody_textplain_share_es.ftl	\N	26	-1	1
545	6	6	f	0	0	0	Email template used to generate the "multipart/alternative" IMAP message body ("text/plain" part) for Alfresco Share - Spanish version	\N	27	-1	2
545	6	6	f	0	0	0	emailbody_textplain_share_es.ftl	\N	28	-1	2
545	21	3	f	107	0	0	\N	\N	51	-1	1
546	1	1	t	0	0	0	\N	\N	52	-1	1
546	6	6	f	0	0	0		\N	54	-1	1
546	6	6	f	0	0	0	emailbody_textplain_alfresco_es.ftl	\N	26	-1	1
546	6	6	f	0	0	0	Email template used to generate the "multipart/alternative" IMAP message body ("text/plain" part) - Spanish version	\N	27	-1	2
546	6	6	f	0	0	0	emailbody_textplain_alfresco_es.ftl	\N	28	-1	2
546	21	3	f	108	0	0	\N	\N	51	-1	1
547	1	1	t	0	0	0	\N	\N	52	-1	1
547	6	6	f	0	0	0		\N	54	-1	1
547	6	6	f	0	0	0	emailbody_texthtml_alfresco_es.ftl	\N	26	-1	1
547	6	6	f	0	0	0	Email template used to generate the "multipart/alternative" IMAP message body ("text/html" part) - Spanish version	\N	27	-1	2
547	6	6	f	0	0	0	emailbody_texthtml_alfresco_es.ftl	\N	28	-1	2
547	21	3	f	109	0	0	\N	\N	51	-1	1
548	1	1	t	0	0	0	\N	\N	52	-1	1
548	6	6	f	0	0	0		\N	54	-1	1
548	6	6	f	0	0	0	emailbody_texthtml_share_es.ftl	\N	26	-1	1
548	6	6	f	0	0	0	Email template used to generate the "multipart/alternative" IMAP message body ("text/html" part) for Alfresco Share - Spanish version	\N	27	-1	2
548	6	6	f	0	0	0	emailbody_texthtml_share_es.ftl	\N	28	-1	2
548	21	3	f	110	0	0	\N	\N	51	-1	1
549	1	1	t	0	0	0	\N	\N	52	-1	1
549	6	6	f	0	0	0		\N	54	-1	1
549	6	6	f	0	0	0	emailbody_textplain_share_fr.ftl	\N	26	-1	1
549	6	6	f	0	0	0	Email template used to generate the "multipart/alternative" IMAP message body ("text/plain" part) for Alfresco Share - French version	\N	27	-1	2
549	6	6	f	0	0	0	emailbody_textplain_share_fr.ftl	\N	28	-1	2
549	21	3	f	111	0	0	\N	\N	51	-1	1
550	1	1	t	0	0	0	\N	\N	52	-1	1
550	6	6	f	0	0	0		\N	54	-1	1
550	6	6	f	0	0	0	emailbody_textplain_alfresco_fr.ftl	\N	26	-1	1
550	6	6	f	0	0	0	Email template used to generate the "multipart/alternative" IMAP message body ("text/plain" part) - French version	\N	27	-1	2
550	6	6	f	0	0	0	emailbody_textplain_alfresco_fr.ftl	\N	28	-1	2
550	21	3	f	112	0	0	\N	\N	51	-1	1
551	1	1	t	0	0	0	\N	\N	52	-1	1
551	6	6	f	0	0	0		\N	54	-1	1
551	6	6	f	0	0	0	emailbody_texthtml_alfresco_fr.ftl	\N	26	-1	1
551	6	6	f	0	0	0	Email template used to generate the "multipart/alternative" IMAP message body ("text/html" part) - French version	\N	27	-1	2
551	6	6	f	0	0	0	emailbody_texthtml_alfresco_fr.ftl	\N	28	-1	2
551	21	3	f	113	0	0	\N	\N	51	-1	1
552	1	1	t	0	0	0	\N	\N	52	-1	1
552	6	6	f	0	0	0		\N	54	-1	1
552	6	6	f	0	0	0	emailbody_texthtml_share_fr.ftl	\N	26	-1	1
552	6	6	f	0	0	0	Email template used to generate the "multipart/alternative" IMAP message body ("text/html" part) for Alfresco Share - French version	\N	27	-1	2
552	6	6	f	0	0	0	emailbody_texthtml_share_fr.ftl	\N	28	-1	2
552	21	3	f	114	0	0	\N	\N	51	-1	1
553	1	1	t	0	0	0	\N	\N	52	-1	1
553	6	6	f	0	0	0		\N	54	-1	1
553	6	6	f	0	0	0	emailbody_textplain_share_it.ftl	\N	26	-1	1
553	6	6	f	0	0	0	Email template used to generate the "multipart/alternative" IMAP message body ("text/plain" part) for Alfresco Share - Italian version	\N	27	-1	2
553	6	6	f	0	0	0	emailbody_textplain_share_it.ftl	\N	28	-1	2
553	21	3	f	115	0	0	\N	\N	51	-1	1
554	1	1	t	0	0	0	\N	\N	52	-1	1
554	6	6	f	0	0	0		\N	54	-1	1
554	6	6	f	0	0	0	emailbody_textplain_alfresco_it.ftl	\N	26	-1	1
554	6	6	f	0	0	0	Email template used to generate the "multipart/alternative" IMAP message body ("text/plain" part) - Italian version	\N	27	-1	2
554	6	6	f	0	0	0	emailbody_textplain_alfresco_it.ftl	\N	28	-1	2
554	21	3	f	116	0	0	\N	\N	51	-1	1
555	1	1	t	0	0	0	\N	\N	52	-1	1
555	6	6	f	0	0	0		\N	54	-1	1
555	6	6	f	0	0	0	emailbody_texthtml_alfresco_it.ftl	\N	26	-1	1
555	6	6	f	0	0	0	Email template used to generate the "multipart/alternative" IMAP message body ("text/html" part) - Italian version	\N	27	-1	2
555	6	6	f	0	0	0	emailbody_texthtml_alfresco_it.ftl	\N	28	-1	2
555	21	3	f	117	0	0	\N	\N	51	-1	1
556	1	1	t	0	0	0	\N	\N	52	-1	1
556	6	6	f	0	0	0		\N	54	-1	1
556	6	6	f	0	0	0	emailbody_texthtml_share_it.ftl	\N	26	-1	1
556	6	6	f	0	0	0	Email template used to generate the "multipart/alternative" IMAP message body ("text/html" part) for Alfresco Share - Italian version	\N	27	-1	2
556	6	6	f	0	0	0	emailbody_texthtml_share_it.ftl	\N	28	-1	2
556	21	3	f	118	0	0	\N	\N	51	-1	1
557	1	1	t	0	0	0	\N	\N	52	-1	1
557	6	6	f	0	0	0		\N	54	-1	1
557	6	6	f	0	0	0	emailbody_textplain_share_ja.ftl	\N	26	-1	1
557	6	6	f	0	0	0	Email template used to generate the "multipart/alternative" IMAP message body ("text/plain" part) for Alfresco Share - Japanese version	\N	27	-1	2
557	6	6	f	0	0	0	emailbody_textplain_share_ja.ftl	\N	28	-1	2
557	21	3	f	119	0	0	\N	\N	51	-1	1
558	1	1	t	0	0	0	\N	\N	52	-1	1
558	6	6	f	0	0	0		\N	54	-1	1
558	6	6	f	0	0	0	emailbody_textplain_alfresco_ja.ftl	\N	26	-1	1
558	6	6	f	0	0	0	Email template used to generate the "multipart/alternative" IMAP message body ("text/plain" part) - Japanese version	\N	27	-1	2
558	6	6	f	0	0	0	emailbody_textplain_alfresco_ja.ftl	\N	28	-1	2
558	21	3	f	120	0	0	\N	\N	51	-1	1
559	1	1	t	0	0	0	\N	\N	52	-1	1
559	6	6	f	0	0	0		\N	54	-1	1
559	6	6	f	0	0	0	emailbody_texthtml_alfresco_ja.ftl	\N	26	-1	1
559	6	6	f	0	0	0	Email template used to generate the "multipart/alternative" IMAP message body ("text/html" part) - Japanese version	\N	27	-1	2
559	6	6	f	0	0	0	emailbody_texthtml_alfresco_ja.ftl	\N	28	-1	2
559	21	3	f	121	0	0	\N	\N	51	-1	1
560	1	1	t	0	0	0	\N	\N	52	-1	1
560	6	6	f	0	0	0		\N	54	-1	1
560	6	6	f	0	0	0	emailbody_texthtml_share_ja.ftl	\N	26	-1	1
560	6	6	f	0	0	0	Email template used to generate the "multipart/alternative" IMAP message body ("text/html" part) for Alfresco Share - Japanese version	\N	27	-1	2
560	6	6	f	0	0	0	emailbody_texthtml_share_ja.ftl	\N	28	-1	2
560	21	3	f	122	0	0	\N	\N	51	-1	1
561	1	1	t	0	0	0	\N	\N	52	-1	1
561	6	6	f	0	0	0		\N	54	-1	1
561	6	6	f	0	0	0	emailbody_textplain_share_nb.ftl	\N	26	-1	1
561	6	6	f	0	0	0	Email template used to generate the "multipart/alternative" IMAP message body ("text/plain" part) for Alfresco Share - Norwegian Bokmal version	\N	27	-1	2
561	6	6	f	0	0	0	emailbody_textplain_share_nb.ftl	\N	28	-1	2
561	21	3	f	123	0	0	\N	\N	51	-1	1
562	1	1	t	0	0	0	\N	\N	52	-1	1
562	6	6	f	0	0	0		\N	54	-1	1
562	6	6	f	0	0	0	emailbody_textplain_alfresco_nb.ftl	\N	26	-1	1
562	6	6	f	0	0	0	Email template used to generate the "multipart/alternative" IMAP message body ("text/plain" part) - Norwegian Bokmal version	\N	27	-1	2
562	6	6	f	0	0	0	emailbody_textplain_alfresco_nb.ftl	\N	28	-1	2
562	21	3	f	124	0	0	\N	\N	51	-1	1
563	1	1	t	0	0	0	\N	\N	52	-1	1
563	6	6	f	0	0	0		\N	54	-1	1
563	6	6	f	0	0	0	emailbody_texthtml_alfresco_nb.ftl	\N	26	-1	1
563	6	6	f	0	0	0	Email template used to generate the "multipart/alternative" IMAP message body ("text/html" part) - Norwegian Bokmal version	\N	27	-1	2
563	6	6	f	0	0	0	emailbody_texthtml_alfresco_nb.ftl	\N	28	-1	2
563	21	3	f	125	0	0	\N	\N	51	-1	1
564	1	1	t	0	0	0	\N	\N	52	-1	1
564	6	6	f	0	0	0		\N	54	-1	1
564	6	6	f	0	0	0	emailbody_texthtml_share_nb.ftl	\N	26	-1	1
564	6	6	f	0	0	0	Email template used to generate the "multipart/alternative" IMAP message body ("text/html" part) for Alfresco Share - Norwegian Bokmal version	\N	27	-1	2
564	6	6	f	0	0	0	emailbody_texthtml_share_nb.ftl	\N	28	-1	2
564	21	3	f	126	0	0	\N	\N	51	-1	1
565	1	1	t	0	0	0	\N	\N	52	-1	1
565	6	6	f	0	0	0		\N	54	-1	1
565	6	6	f	0	0	0	emailbody_textplain_share_nl.ftl	\N	26	-1	1
565	6	6	f	0	0	0	Email template used to generate the "multipart/alternative" IMAP message body ("text/plain" part) for Alfresco Share - Dutch version	\N	27	-1	2
565	6	6	f	0	0	0	emailbody_textplain_share_nl.ftl	\N	28	-1	2
565	21	3	f	127	0	0	\N	\N	51	-1	1
566	1	1	t	0	0	0	\N	\N	52	-1	1
566	6	6	f	0	0	0		\N	54	-1	1
566	6	6	f	0	0	0	emailbody_textplain_alfresco_nl.ftl	\N	26	-1	1
566	6	6	f	0	0	0	Email template used to generate the "multipart/alternative" IMAP message body ("text/plain" part) - Dutch version	\N	27	-1	2
566	6	6	f	0	0	0	emailbody_textplain_alfresco_nl.ftl	\N	28	-1	2
566	21	3	f	128	0	0	\N	\N	51	-1	1
567	1	1	t	0	0	0	\N	\N	52	-1	1
567	6	6	f	0	0	0		\N	54	-1	1
567	6	6	f	0	0	0	emailbody_texthtml_alfresco_nl.ftl	\N	26	-1	1
567	6	6	f	0	0	0	Email template used to generate the "multipart/alternative" IMAP message body ("text/html" part) - Dutch version	\N	27	-1	2
567	6	6	f	0	0	0	emailbody_texthtml_alfresco_nl.ftl	\N	28	-1	2
567	21	3	f	129	0	0	\N	\N	51	-1	1
568	1	1	t	0	0	0	\N	\N	52	-1	1
568	6	6	f	0	0	0		\N	54	-1	1
568	6	6	f	0	0	0	emailbody_texthtml_share_nl.ftl	\N	26	-1	1
568	6	6	f	0	0	0	Email template used to generate the "multipart/alternative" IMAP message body ("text/html" part) for Alfresco Share - Dutch version	\N	27	-1	2
568	6	6	f	0	0	0	emailbody_texthtml_share_nl.ftl	\N	28	-1	2
568	21	3	f	130	0	0	\N	\N	51	-1	1
569	1	1	t	0	0	0	\N	\N	52	-1	1
569	6	6	f	0	0	0		\N	54	-1	1
569	6	6	f	0	0	0	emailbody_textplain_share_pt_BR.ftl	\N	26	-1	1
569	6	6	f	0	0	0	Email template used to generate the "multipart/alternative" IMAP message body ("text/plain" part) for Alfresco Share - Brazilian Portuguese version	\N	27	-1	2
569	6	6	f	0	0	0	emailbody_textplain_share_pt_BR.ftl	\N	28	-1	2
569	21	3	f	131	0	0	\N	\N	51	-1	1
570	1	1	t	0	0	0	\N	\N	52	-1	1
570	6	6	f	0	0	0		\N	54	-1	1
570	6	6	f	0	0	0	emailbody_textplain_alfresco_pt_BR.ftl	\N	26	-1	1
579	6	6	f	0	0	0	emailbody_texthtml_alfresco_zh_CN.ftl	\N	28	-1	2
570	6	6	f	0	0	0	Email template used to generate the "multipart/alternative" IMAP message body ("text/plain" part) - Brazilian Portuguese version	\N	27	-1	2
570	6	6	f	0	0	0	emailbody_textplain_alfresco_pt_BR.ftl	\N	28	-1	2
570	21	3	f	132	0	0	\N	\N	51	-1	1
571	1	1	t	0	0	0	\N	\N	52	-1	1
571	6	6	f	0	0	0		\N	54	-1	1
571	6	6	f	0	0	0	emailbody_texthtml_alfresco_pt_BR.ftl	\N	26	-1	1
571	6	6	f	0	0	0	Email template used to generate the "multipart/alternative" IMAP message body ("text/html" part) - Brazilian Portuguese version	\N	27	-1	2
571	6	6	f	0	0	0	emailbody_texthtml_alfresco_pt_BR.ftl	\N	28	-1	2
571	21	3	f	133	0	0	\N	\N	51	-1	1
572	1	1	t	0	0	0	\N	\N	52	-1	1
572	6	6	f	0	0	0		\N	54	-1	1
572	6	6	f	0	0	0	emailbody_texthtml_share_pt_BR.ftl	\N	26	-1	1
572	6	6	f	0	0	0	Email template used to generate the "multipart/alternative" IMAP message body ("text/html" part) for Alfresco Share - Brazilian Portuguese version	\N	27	-1	2
572	6	6	f	0	0	0	emailbody_texthtml_share_pt_BR.ftl	\N	28	-1	2
572	21	3	f	134	0	0	\N	\N	51	-1	1
573	1	1	t	0	0	0	\N	\N	52	-1	1
573	6	6	f	0	0	0		\N	54	-1	1
573	6	6	f	0	0	0	emailbody_textplain_share_ru.ftl	\N	26	-1	1
573	6	6	f	0	0	0	Email template used to generate the "multipart/alternative" IMAP message body ("text/plain" part) for Alfresco Share - Russian version	\N	27	-1	2
573	6	6	f	0	0	0	emailbody_textplain_share_ru.ftl	\N	28	-1	2
573	21	3	f	135	0	0	\N	\N	51	-1	1
574	1	1	t	0	0	0	\N	\N	52	-1	1
574	6	6	f	0	0	0		\N	54	-1	1
574	6	6	f	0	0	0	emailbody_textplain_alfresco_ru.ftl	\N	26	-1	1
574	6	6	f	0	0	0	Email template used to generate the "multipart/alternative" IMAP message body ("text/plain" part) - Russian version	\N	27	-1	2
574	6	6	f	0	0	0	emailbody_textplain_alfresco_ru.ftl	\N	28	-1	2
574	21	3	f	136	0	0	\N	\N	51	-1	1
575	1	1	t	0	0	0	\N	\N	52	-1	1
575	6	6	f	0	0	0		\N	54	-1	1
575	6	6	f	0	0	0	emailbody_texthtml_alfresco_ru.ftl	\N	26	-1	1
575	6	6	f	0	0	0	Email template used to generate the "multipart/alternative" IMAP message body ("text/html" part) - Russian version	\N	27	-1	2
575	6	6	f	0	0	0	emailbody_texthtml_alfresco_ru.ftl	\N	28	-1	2
575	21	3	f	137	0	0	\N	\N	51	-1	1
576	1	1	t	0	0	0	\N	\N	52	-1	1
576	6	6	f	0	0	0		\N	54	-1	1
576	6	6	f	0	0	0	emailbody_texthtml_share_ru.ftl	\N	26	-1	1
576	6	6	f	0	0	0	Email template used to generate the "multipart/alternative" IMAP message body ("text/html" part) for Alfresco Share - Russian version	\N	27	-1	2
576	6	6	f	0	0	0	emailbody_texthtml_share_ru.ftl	\N	28	-1	2
576	21	3	f	138	0	0	\N	\N	51	-1	1
577	1	1	t	0	0	0	\N	\N	52	-1	1
577	6	6	f	0	0	0		\N	54	-1	1
577	6	6	f	0	0	0	emailbody_textplain_share_zh_CN.ftl	\N	26	-1	1
577	6	6	f	0	0	0	Email template used to generate the "multipart/alternative" IMAP message body ("text/plain" part) for Alfresco Share - Simplified Chinese version	\N	27	-1	2
577	6	6	f	0	0	0	emailbody_textplain_share_zh_CN.ftl	\N	28	-1	2
577	21	3	f	139	0	0	\N	\N	51	-1	1
578	1	1	t	0	0	0	\N	\N	52	-1	1
578	6	6	f	0	0	0		\N	54	-1	1
578	6	6	f	0	0	0	emailbody_textplain_alfresco_zh_CN.ftl	\N	26	-1	1
578	6	6	f	0	0	0	Email template used to generate the "multipart/alternative" IMAP message body ("text/plain" part) - Simplified Chinese version	\N	27	-1	2
578	6	6	f	0	0	0	emailbody_textplain_alfresco_zh_CN.ftl	\N	28	-1	2
578	21	3	f	140	0	0	\N	\N	51	-1	1
579	1	1	t	0	0	0	\N	\N	52	-1	1
579	6	6	f	0	0	0		\N	54	-1	1
579	6	6	f	0	0	0	emailbody_texthtml_alfresco_zh_CN.ftl	\N	26	-1	1
579	6	6	f	0	0	0	Email template used to generate the "multipart/alternative" IMAP message body ("text/html" part) - Simplified Chinese version	\N	27	-1	2
579	21	3	f	141	0	0	\N	\N	51	-1	1
580	1	1	t	0	0	0	\N	\N	52	-1	1
580	6	6	f	0	0	0		\N	54	-1	1
580	6	6	f	0	0	0	emailbody_texthtml_share_zh_CN.ftl	\N	26	-1	1
580	6	6	f	0	0	0	Email template used to generate the "multipart/alternative" IMAP message body ("text/html" part) for Alfresco Share - Simplified Chinese version	\N	27	-1	2
580	6	6	f	0	0	0	emailbody_texthtml_share_zh_CN.ftl	\N	28	-1	2
580	21	3	f	142	0	0	\N	\N	51	-1	1
581	6	6	f	0	0	0	Publishing Root	\N	26	-1	1
581	6	6	f	0	0	0	Root folder for the PublishingService.	\N	27	-1	2
581	6	6	f	0	0	0	Publishing Root	\N	28	-1	2
582	6	6	f	0	0	0	Downloads	\N	26	-1	1
582	6	6	f	0	0	0	Root folder for downloads	\N	27	-1	2
582	6	6	f	0	0	0	Downloads	\N	28	-1	2
583	1	1	t	0	0	0	\N	\N	52	-1	1
583	6	6	f	0	0	0	smartFoldersExample.json	\N	26	-1	1
583	6	6	f	0	0	0	Smart Folder Template Sample	\N	27	-1	2
583	6	6	f	0	0	0	Smart Folder Template Sample	\N	28	-1	2
583	21	3	f	143	0	0	\N	\N	51	-1	1
7	1	1	f	0	0	0	\N	\N	86	-1	1
7	1	1	f	0	0	0	\N	\N	87	-1	1
7	6	6	f	0	0	0	UNKNOWN	\N	105	-1	1
7	6	6	f	0	0	0	Main Repository	\N	16	-1	1
7	21	3	f	144	0	0	\N	\N	106	-1	1
584	1	1	t	0	0	0	\N	\N	52	-1	1
584	6	6	f	0	0	0	Alfresco	\N	54	-1	1
584	6	6	f	0	0	0	start-pooled-review-workflow.js	\N	26	-1	1
584	6	6	f	0	0	0	Starts the Pooled Review and Approve workflow for all members of the site the document belongs to	\N	27	-1	2
584	6	6	f	0	0	0	Start Pooled Review and Approve Workflow	\N	28	-1	2
584	21	3	f	145	0	0	\N	\N	51	-1	1
586	6	6	f	0	0	0	site_swsdp	\N	113	-1	1
586	6	6	f	0	0	0	4f78dc6e000a27fc3bb7e9c70aa6b5d9	\N	26	-1	1
586	6	6	f	0	0	0	GROUP_site_swsdp	\N	90	-1	1
587	6	6	f	0	0	0	APP.SHARE	\N	26	-1	1
588	6	6	f	0	0	0	site_swsdp_SiteManager	\N	113	-1	1
588	6	6	f	0	0	0	9e5cb3fa1850083495559ca2a4ca2de9	\N	26	-1	1
588	6	6	f	0	0	0	GROUP_site_swsdp_SiteManager	\N	90	-1	1
588	3	3	f	3642343970	0	0	\N	\N	94	-1	1
588	3	3	f	10	0	0	\N	\N	96	-1	1
589	6	6	f	0	0	0	site_swsdp_SiteCollaborator	\N	113	-1	1
589	6	6	f	0	0	0	58d3dfc926fbcb0ce0a1213c37dc4711	\N	26	-1	1
589	6	6	f	0	0	0	GROUP_site_swsdp_SiteCollaborator	\N	90	-1	1
589	3	3	f	791955811	0	0	\N	\N	94	-1	1
589	3	3	f	10	0	0	\N	\N	96	-1	1
590	6	6	f	0	0	0	site_swsdp_SiteContributor	\N	113	-1	1
590	6	6	f	0	0	0	5b487fd6a02f7430721726163ba0daa9	\N	26	-1	1
590	6	6	f	0	0	0	GROUP_site_swsdp_SiteContributor	\N	90	-1	1
590	3	3	f	2395652948	0	0	\N	\N	94	-1	1
590	3	3	f	10	0	0	\N	\N	96	-1	1
591	6	6	f	0	0	0	site_swsdp_SiteConsumer	\N	113	-1	1
591	6	6	f	0	0	0	73714588eb587e2a207a436130080c9e	\N	26	-1	1
591	6	6	f	0	0	0	GROUP_site_swsdp_SiteConsumer	\N	90	-1	1
591	3	3	f	1982701871	0	0	\N	\N	94	-1	1
591	3	3	f	10	0	0	\N	\N	96	-1	1
592	0	0	f	0	0	0	\N	\N	114	-1	1
592	1	1	f	0	0	0	\N	\N	6	-1	1
592	1	1	f	0	0	0	\N	\N	7	-1	1
592	1	1	f	0	0	0	\N	\N	8	-1	1
592	6	6	f	0	0	0	abeecher	\N	9	-1	1
592	6	6	f	0	0	0	0eeb8b5ee6e96f1a8443edfb1dfc36ad	\N	10	-1	1
592	1	1	f	0	0	0	\N	\N	11	-1	1
593	0	0	f	0	0	0	\N	\N	114	-1	1
593	1	1	f	0	0	0	\N	\N	6	-1	1
593	1	1	f	0	0	0	\N	\N	7	-1	1
593	1	1	f	0	0	0	\N	\N	8	-1	1
593	6	6	f	0	0	0	mjackson	\N	9	-1	1
593	6	6	f	0	0	0	0eeb8b5ee6e96f1a8443edfb1dfc36ad	\N	10	-1	1
593	1	1	f	0	0	0	\N	\N	11	-1	1
594	6	6	f	0	0	0	Moresby, Garland and Wedge	\N	129	-1	1
594	6	6	f	0	0	0		\N	130	-1	1
594	6	6	f	0	0	0	Helping to design the look and feel of the new web site	\N	131	-1	1
594	3	3	f	440	0	0	\N	\N	132	-1	1
594	7	6	f	0	0	0	2011-02-15T20:20:13.432Z	\N	133	-1	1
594	3	3	f	8382006	0	0	\N	\N	36	-1	1
594	6	6	f	0	0	0	abeecher	\N	37	-1	1
594	6	6	f	0	0	0	abeecher@example.com	\N	38	-1	1
594	6	6	f	0	0	0	userHomesHomeFolderProvider	\N	39	-1	1
594	6	6	f	0	0	0	abeecher	\N	40	-1	1
594	6	6	f	0	0	0	Beecher	\N	41	-1	1
594	6	6	f	0	0	0	Alice	\N	43	-1	1
594	6	6	f	0	0	0	Graphic Designer	\N	115	-1	1
594	6	6	f	0	0	0	Tilbury, UK	\N	116	-1	1
594	6	6	f	0	0	0	0112211001100	\N	117	-1	1
594	6	6	f	0	0	0	abeecher	\N	118	-1	1
594	6	6	f	0	0	0	200 Butterwick Street	\N	119	-1	1
594	6	6	f	0	0	0	0112211001100	\N	120	-1	1
594	3	3	f	-1	0	0	\N	\N	121	-1	1
594	6	6	f	0	0	0		\N	122	-1	1
594	6	6	f	0	0	0	ALF1 SAM1	\N	123	-1	1
594	6	6	f	0	0	0		\N	124	-1	1
594	6	6	f	0	0	0	UK	\N	125	-1	1
594	6	6	f	0	0	0		\N	126	-1	1
594	6	6	f	0	0	0		\N	127	-1	1
594	6	6	f	0	0	0	Tilbury	\N	128	-1	1
594	21	3	f	146	0	0	\N	\N	136	-1	1
594	21	3	f	147	0	0	\N	\N	137	-1	1
595	6	6	f	0	0	0	abeecher-avatar.jpg	\N	26	-1	1
595	6	6	f	0	0	0	avatar:1443523516088	\N	139	0	1
595	21	3	f	148	0	0	\N	\N	51	-1	1
596	6	6	f	0	0	0	avatar	\N	145	-1	1
596	1	1	t	0	0	0	\N	\N	86	-1	1
596	1	1	f	0	0	0	\N	\N	87	-1	1
596	6	6	f	0	0	0	avatar	\N	26	-1	1
596	15	6	f	0	0	0	{http://www.alfresco.org/model/content/1.0}content	\N	144	-1	1
596	21	3	f	149	0	0	\N	\N	51	-1	1
597	6	6	f	0	0	0	Green Energy	\N	129	-1	1
597	6	6	f	0	0	0		\N	130	-1	1
597	6	6	f	0	0	0	Working on a new web design for the corporate site	\N	131	-1	1
597	3	3	f	442	0	0	\N	\N	132	-1	1
597	7	6	f	0	0	0	2011-02-15T20:13:09.649Z	\N	133	-1	1
597	3	3	f	8834773	0	0	\N	\N	36	-1	1
597	6	6	f	0	0	0	mjackson	\N	37	-1	1
597	6	6	f	0	0	0	mjackson@example.com	\N	38	-1	1
597	6	6	f	0	0	0	userHomesHomeFolderProvider	\N	39	-1	1
597	6	6	f	0	0	0	mjackson	\N	40	-1	1
597	6	6	f	0	0	0	Jackson	\N	41	-1	1
597	6	6	f	0	0	0	Mike	\N	43	-1	1
597	6	6	f	0	0	0	Web Site Manager	\N	115	-1	1
597	6	6	f	0	0	0	Threepwood, UK	\N	116	-1	1
597	6	6	f	0	0	0	012211331100	\N	117	-1	1
597	6	6	f	0	0	0	mjackson	\N	118	-1	1
597	6	6	f	0	0	0	100 Cavendish Street	\N	119	-1	1
597	6	6	f	0	0	0	012211331100	\N	120	-1	1
597	3	3	f	-1	0	0	\N	\N	121	-1	1
597	6	6	f	0	0	0		\N	122	-1	1
597	6	6	f	0	0	0	ALF1 SAM1	\N	123	-1	1
597	6	6	f	0	0	0		\N	124	-1	1
597	6	6	f	0	0	0	UK	\N	125	-1	1
597	6	6	f	0	0	0		\N	126	-1	1
597	6	6	f	0	0	0		\N	127	-1	1
597	6	6	f	0	0	0	Threepwood	\N	128	-1	1
597	21	3	f	150	0	0	\N	\N	136	-1	1
597	21	3	f	151	0	0	\N	\N	137	-1	1
598	6	6	f	0	0	0	mjackson-avatar.jpg	\N	26	-1	1
598	6	6	f	0	0	0	avatar:1443523488273	\N	139	0	1
598	21	3	f	152	0	0	\N	\N	51	-1	1
599	6	6	f	0	0	0	avatar	\N	145	-1	1
599	1	1	t	0	0	0	\N	\N	86	-1	1
599	1	1	f	0	0	0	\N	\N	87	-1	1
599	6	6	f	0	0	0	avatar	\N	26	-1	1
599	15	6	f	0	0	0	{http://www.alfresco.org/model/content/1.0}content	\N	144	-1	1
599	21	3	f	153	0	0	\N	\N	51	-1	1
594	0	0	f	0	0	0	\N	\N	45	-1	1
597	0	0	f	0	0	0	\N	\N	45	-1	1
594	3	3	f	1290339595	0	0	\N	\N	94	-1	1
594	3	3	f	10	0	0	\N	\N	96	-1	1
597	3	3	f	2842924926	0	0	\N	\N	94	-1	1
597	3	3	f	10	0	0	\N	\N	96	-1	1
600	3	3	f	585	0	0	\N	\N	150	-1	1
601	9	9	f	0	0	0	\N	\\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078	151	-1	1
601	6	6	f	0	0	0	admin	\N	40	-1	1
601	6	6	f	0	0	0	swsdp	\N	26	-1	1
601	6	6	f	0	0	0	This is a Sample Alfresco Team site.	\N	27	-1	2
601	6	6	f	0	0	0	PUBLIC	\N	108	-1	1
601	6	6	f	0	0	0	Sample: Web Site Design Project	\N	28	-1	2
601	6	6	f	0	0	0	site-dashboard	\N	109	-1	1
601	21	3	f	154	0	0	\N	\N	152	-1	1
602	9	9	f	0	0	0	\N	\\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078	151	-1	1
602	6	6	f	0	0	0	admin	\N	40	-1	1
602	6	6	f	0	0	0	documentLibrary	\N	153	-1	1
602	6	6	f	0	0	0	documentLibrary	\N	26	-1	1
602	6	6	f	0	0	0	Document Library	\N	27	-1	2
602	21	3	f	155	0	0	\N	\N	152	-1	1
603	6	6	f	0	0	0	admin	\N	40	-1	1
603	6	6	f	0	0	0	Agency Files	\N	26	-1	1
603	6	6	f	0	0	0	This folder holds the agency related files for the project	\N	27	-1	2
603	6	6	f	0	0	0	Agency related files	\N	28	-1	2
604	6	6	f	0	0	0	admin	\N	40	-1	1
604	6	6	f	0	0	0	Contracts	\N	26	-1	1
604	6	6	f	0	0	0	This folder holds the agency contracts	\N	27	-1	2
604	6	6	f	0	0	0	Project contracts	\N	28	-1	2
605	2	3	f	0	0	0	\N	\N	161	-1	1
605	6	6	f	0	0	0	Alice Beecher	\N	54	-1	1
605	6	6	f	0	0	0	admin	\N	40	-1	1
605	6	6	f	0	0	0	Project Contract.pdf	\N	26	-1	1
605	6	6	f	0	0	0	Contract for the Green Energy project	\N	27	-1	2
605	1	1	f	0	0	0	\N	\N	156	-1	1
605	6	6	f	0	0	0	Project Contract for Green Energy	\N	28	-1	2
605	4	4	f	0	0	0	\N	\N	157	-1	1
605	1	1	t	0	0	0	\N	\N	159	-1	1
605	1	1	t	0	0	0	\N	\N	160	-1	1
605	21	3	f	156	0	0	\N	\N	51	-1	1
606	6	6	f	0	0	0	1a0b110f-1e09-4ca2-b367-fe25e4964a4e	\N	26	-1	1
606	6	6	f	0	0	0	1a0b110f-1e09-4ca2-b367-fe25e4964a4e	\N	166	-1	1
607	6	6	f	0	0	0	Project Contract.pdf	\N	26	-1	1
607	21	3	f	157	0	0	\N	\N	51	-1	1
607	12	6	f	0	0	0	workspace://SpacesStore/1a0b110f-1e09-4ca2-b367-fe25e4964a4e	\N	168	-1	1
607	0	0	f	0	0	0	\N	\N	169	-1	1
607	3	3	f	605	0	0	\N	\N	171	-1	1
607	1	1	f	0	0	0	\N	\N	156	-1	1
607	0	0	f	0	0	0	\N	\N	172	-1	1
607	1	1	t	0	0	0	\N	\N	159	-1	1
607	1	1	t	0	0	0	\N	\N	160	-1	1
607	6	6	f	0	0	0	Contract for the Green Energy project	\N	27	-1	2
607	6	6	f	0	0	0	Project Contract for Green Energy	\N	28	-1	2
607	6	6	f	0	0	0	admin	\N	40	-1	1
607	6	6	f	0	0	0	abeecher	\N	173	-1	1
607	7	6	f	0	0	0	2011-02-15T21:26:54.600Z	\N	174	-1	1
607	6	6	f	0	0	0	admin	\N	175	-1	1
607	7	6	f	0	0	0	2011-06-14T10:28:54.714Z	\N	176	-1	1
607	0	0	f	0	0	0	\N	\N	177	-1	1
607	2	3	f	0	0	0	\N	\N	161	-1	1
607	4	4	f	0	0	0	\N	\N	157	-1	1
607	6	6	f	0	0	0	Alice Beecher	\N	54	-1	1
605	0	0	f	0	0	0	\N	\N	172	-1	1
605	6	6	f	0	0	0	1.1	\N	158	-1	1
607	0	0	f	0	0	0	\N	\N	158	-1	1
607	6	6	f	0	0	0	1.1	\N	170	-1	1
608	6	6	f	0	0	0	doclib	\N	26	-1	1
608	15	6	f	0	0	0	{http://www.alfresco.org/model/content/1.0}content	\N	144	-1	1
608	6	6	f	0	0	0	admin	\N	40	-1	1
608	21	3	f	158	0	0	\N	\N	51	-1	1
609	6	6	f	0	0	0	webpreview	\N	26	-1	1
609	15	6	f	0	0	0	{http://www.alfresco.org/model/content/1.0}content	\N	144	-1	1
609	6	6	f	0	0	0	admin	\N	40	-1	1
609	21	3	f	159	0	0	\N	\N	51	-1	1
610	6	6	f	0	0	0	admin	\N	40	-1	1
610	6	6	f	0	0	0	Images	\N	26	-1	1
610	6	6	f	0	0	0	This folder holds new web site images	\N	27	-1	2
610	6	6	f	0	0	0	Project images	\N	28	-1	2
611	5	5	f	0	0	0.0031250000000000002	\N	\N	193	-1	1
611	6	6	f	0	0	0	admin	\N	40	-1	1
611	6	6	f	0	0	0	Adobe Photoshop CS5 Macintosh	\N	179	-1	1
611	5	5	f	0	0	22	\N	\N	180	-1	1
611	5	5	f	0	0	72	\N	\N	181	-1	1
611	6	6	f	0	0	0	Inch	\N	182	-1	1
611	7	6	f	0	0	0	2003-09-23T14:55:24.000Z	\N	183	-1	1
611	2	3	f	1	0	0	\N	\N	184	-1	1
611	2	3	f	840	0	0	\N	\N	185	-1	1
611	6	6	f	0	0	0	coins.JPG	\N	26	-1	1
611	6	6	f	0	0	0	E-10	\N	186	-1	1
611	6	6	f	0	0	0	OLYMPUS DIGITAL CAMERA	\N	27	-1	4
611	5	5	f	0	0	72	\N	\N	187	-1	1
611	6	6	f	0	0	0	coins.JPG	\N	28	-1	4
611	1	1	f	0	0	0	\N	\N	188	-1	1
611	5	5	f	0	0	9	\N	\N	189	-1	1
611	6	6	f	0	0	0	80	\N	190	-1	1
611	6	6	f	0	0	0	OLYMPUS OPTICAL CO.,LTD	\N	191	-1	1
611	2	3	f	1120	0	0	\N	\N	192	-1	1
611	21	3	f	160	0	0	\N	\N	51	-1	1
612	6	6	f	0	0	0	doclib	\N	145	-1	1
612	6	6	f	0	0	0	admin	\N	40	-1	1
612	6	6	f	0	0	0	doclib	\N	26	-1	1
612	15	6	f	0	0	0	{http://www.alfresco.org/model/content/1.0}content	\N	144	-1	1
612	21	3	f	161	0	0	\N	\N	51	-1	1
613	5	5	f	0	0	0.0055555555555555601	\N	\N	193	-1	1
613	6	6	f	0	0	0	admin	\N	40	-1	1
613	6	6	f	0	0	0	Adobe Photoshop CS5 Macintosh	\N	179	-1	1
613	5	5	f	0	0	230	\N	\N	180	-1	1
613	5	5	f	0	0	72	\N	\N	181	-1	1
613	6	6	f	0	0	0	Inch	\N	182	-1	1
613	7	6	f	0	0	0	2003-12-30T15:17:54.000Z	\N	183	-1	1
613	2	3	f	1	0	0	\N	\N	184	-1	1
613	2	3	f	664	0	0	\N	\N	185	-1	1
613	6	6	f	0	0	0	graph.JPG	\N	26	-1	1
613	6	6	f	0	0	0	PENTAX K20D	\N	186	-1	1
613	5	5	f	0	0	72	\N	\N	187	-1	1
613	6	6	f	0	0	0	graph.JPG	\N	28	-1	4
613	1	1	f	0	0	0	\N	\N	188	-1	1
613	5	5	f	0	0	6.2999999999999998	\N	\N	189	-1	1
613	6	6	f	0	0	0	100	\N	190	-1	1
613	6	6	f	0	0	0	PENTAX Corporation	\N	191	-1	1
613	2	3	f	1000	0	0	\N	\N	192	-1	1
613	21	3	f	162	0	0	\N	\N	51	-1	1
614	6	6	f	0	0	0	doclib	\N	145	-1	1
614	6	6	f	0	0	0	admin	\N	40	-1	1
614	6	6	f	0	0	0	doclib	\N	26	-1	1
614	15	6	f	0	0	0	{http://www.alfresco.org/model/content/1.0}content	\N	144	-1	1
614	21	3	f	163	0	0	\N	\N	51	-1	1
615	5	5	f	0	0	0.0080000000000000002	\N	\N	193	-1	1
615	6	6	f	0	0	0	admin	\N	40	-1	1
615	6	6	f	0	0	0	Adobe Photoshop CS5 Macintosh	\N	179	-1	1
615	5	5	f	0	0	23.420000000000002	\N	\N	180	-1	1
615	5	5	f	0	0	72	\N	\N	181	-1	1
615	6	6	f	0	0	0	Inch	\N	182	-1	1
615	7	6	f	0	0	0	2003-12-30T15:17:54.000Z	\N	183	-1	1
615	2	3	f	1	0	0	\N	\N	184	-1	1
615	2	3	f	754	0	0	\N	\N	185	-1	1
615	6	6	f	0	0	0	grass.jpg	\N	26	-1	1
615	6	6	f	0	0	0	HP PhotoSmart C850 (V05.27)	\N	186	-1	1
615	5	5	f	0	0	72	\N	\N	187	-1	1
615	6	6	f	0	0	0	grass.jpg	\N	28	-1	4
615	1	1	t	0	0	0	\N	\N	188	-1	1
615	5	5	f	0	0	3	\N	\N	189	-1	1
615	6	6	f	0	0	0	100	\N	190	-1	1
615	6	6	f	0	0	0	Hewlett-Packard	\N	191	-1	1
615	2	3	f	1000	0	0	\N	\N	192	-1	1
615	21	3	f	164	0	0	\N	\N	51	-1	1
616	6	6	f	0	0	0	doclib	\N	145	-1	1
616	6	6	f	0	0	0	admin	\N	40	-1	1
616	6	6	f	0	0	0	doclib	\N	26	-1	1
616	15	6	f	0	0	0	{http://www.alfresco.org/model/content/1.0}content	\N	144	-1	1
616	21	3	f	165	0	0	\N	\N	51	-1	1
617	6	6	f	0	0	0	imgpreview	\N	145	-1	1
617	6	6	f	0	0	0	admin	\N	40	-1	1
617	6	6	f	0	0	0	imgpreview	\N	26	-1	1
617	15	6	f	0	0	0	{http://www.alfresco.org/model/content/1.0}content	\N	144	-1	1
617	21	3	f	166	0	0	\N	\N	51	-1	1
618	5	5	f	0	0	0.033333333333333298	\N	\N	193	-1	1
618	6	6	f	0	0	0	admin	\N	40	-1	1
618	6	6	f	0	0	0	Adobe Photoshop CS5 Macintosh	\N	179	-1	1
618	5	5	f	0	0	8	\N	\N	180	-1	1
618	5	5	f	0	0	72	\N	\N	181	-1	1
618	6	6	f	0	0	0	Inch	\N	182	-1	1
618	7	6	f	0	0	0	2005-07-06T09:07:21.000Z	\N	183	-1	1
618	2	3	f	1	0	0	\N	\N	184	-1	1
618	2	3	f	1932	0	0	\N	\N	185	-1	1
618	6	6	f	0	0	0	money.JPG	\N	26	-1	1
618	6	6	f	0	0	0	KODAK DX4530 ZOOM DIGITAL CAMERA	\N	186	-1	1
618	5	5	f	0	0	72	\N	\N	187	-1	1
618	6	6	f	0	0	0	money.JPG	\N	28	-1	4
618	1	1	f	0	0	0	\N	\N	188	-1	1
618	5	5	f	0	0	2.7999999999999998	\N	\N	189	-1	1
618	6	6	f	0	0	0	200	\N	190	-1	1
618	6	6	f	0	0	0	EASTMAN KODAK COMPANY	\N	191	-1	1
618	2	3	f	2580	0	0	\N	\N	192	-1	1
618	21	3	f	167	0	0	\N	\N	51	-1	1
619	6	6	f	0	0	0	doclib	\N	145	-1	1
619	6	6	f	0	0	0	admin	\N	40	-1	1
619	6	6	f	0	0	0	doclib	\N	26	-1	1
619	15	6	f	0	0	0	{http://www.alfresco.org/model/content/1.0}content	\N	144	-1	1
619	21	3	f	168	0	0	\N	\N	51	-1	1
620	5	5	f	0	0	0.033333333333333298	\N	\N	193	-1	1
620	6	6	f	0	0	0	admin	\N	40	-1	1
620	6	6	f	0	0	0	Adobe Photoshop CS5 Macintosh	\N	179	-1	1
620	5	5	f	0	0	16	\N	\N	180	-1	1
620	5	5	f	0	0	72	\N	\N	181	-1	1
620	6	6	f	0	0	0	Inch	\N	182	-1	1
620	7	6	f	0	0	0	2008-12-13T17:05:16.000Z	\N	183	-1	1
620	2	3	f	1	0	0	\N	\N	184	-1	1
620	2	3	f	2448	0	0	\N	\N	185	-1	1
620	6	6	f	0	0	0	plugs.jpg	\N	26	-1	1
620	6	6	f	0	0	0	Canon PowerShot A590 IS	\N	186	-1	1
620	5	5	f	0	0	72	\N	\N	187	-1	1
620	6	6	f	0	0	0	plugs.jpg	\N	28	-1	4
620	1	1	f	0	0	0	\N	\N	188	-1	1
620	5	5	f	0	0	4.5	\N	\N	189	-1	1
620	6	6	f	0	0	0	200	\N	190	-1	1
620	6	6	f	0	0	0	Canon	\N	191	-1	1
620	2	3	f	3264	0	0	\N	\N	192	-1	1
620	21	3	f	169	0	0	\N	\N	51	-1	1
621	6	6	f	0	0	0	doclib	\N	145	-1	1
621	6	6	f	0	0	0	admin	\N	40	-1	1
621	6	6	f	0	0	0	doclib	\N	26	-1	1
621	15	6	f	0	0	0	{http://www.alfresco.org/model/content/1.0}content	\N	144	-1	1
621	21	3	f	170	0	0	\N	\N	51	-1	1
622	5	5	f	0	0	0.40000000000000002	\N	\N	193	-1	1
622	6	6	f	0	0	0	admin	\N	40	-1	1
622	6	6	f	0	0	0	Adobe Photoshop CS5 Macintosh	\N	179	-1	1
622	5	5	f	0	0	18	\N	\N	180	-1	1
622	5	5	f	0	0	72	\N	\N	181	-1	1
622	6	6	f	0	0	0	Inch	\N	182	-1	1
622	7	6	f	0	0	0	2005-01-09T16:00:55.000Z	\N	183	-1	1
622	2	3	f	1	0	0	\N	\N	184	-1	1
622	2	3	f	2048	0	0	\N	\N	185	-1	1
622	6	6	f	0	0	0	turbine.JPG	\N	26	-1	1
622	6	6	f	0	0	0	Canon EOS 300D DIGITAL	\N	186	-1	1
622	5	5	f	0	0	72	\N	\N	187	-1	1
622	6	6	f	0	0	0	turbine.JPG	\N	28	-1	4
622	1	1	t	0	0	0	\N	\N	188	-1	1
622	5	5	f	0	0	3.5	\N	\N	189	-1	1
622	6	6	f	0	0	0	400	\N	190	-1	1
622	6	6	f	0	0	0	Canon	\N	191	-1	1
622	2	3	f	3072	0	0	\N	\N	192	-1	1
622	21	3	f	171	0	0	\N	\N	51	-1	1
623	6	6	f	0	0	0	doclib	\N	145	-1	1
623	6	6	f	0	0	0	admin	\N	40	-1	1
623	6	6	f	0	0	0	doclib	\N	26	-1	1
623	15	6	f	0	0	0	{http://www.alfresco.org/model/content/1.0}content	\N	144	-1	1
623	21	3	f	172	0	0	\N	\N	51	-1	1
624	6	6	f	0	0	0	Adobe Photoshop CS5 Macintosh	\N	179	-1	1
624	5	5	f	0	0	72	\N	\N	181	-1	1
624	6	6	f	0	0	0	Inch	\N	182	-1	1
624	2	3	f	1	0	0	\N	\N	184	-1	1
624	6	6	f	0	0	0	admin	\N	40	-1	1
624	2	3	f	912	0	0	\N	\N	185	-1	1
624	6	6	f	0	0	0	wires.JPG	\N	26	-1	1
624	5	5	f	0	0	72	\N	\N	187	-1	1
624	6	6	f	0	0	0	wires.JPG	\N	28	-1	4
624	2	3	f	1216	0	0	\N	\N	192	-1	1
624	21	3	f	173	0	0	\N	\N	51	-1	1
625	6	6	f	0	0	0	doclib	\N	145	-1	1
625	6	6	f	0	0	0	admin	\N	40	-1	1
625	6	6	f	0	0	0	doclib	\N	26	-1	1
625	15	6	f	0	0	0	{http://www.alfresco.org/model/content/1.0}content	\N	144	-1	1
625	21	3	f	174	0	0	\N	\N	51	-1	1
626	6	6	f	0	0	0	Adobe Photoshop CS5 Macintosh	\N	179	-1	1
626	5	5	f	0	0	72	\N	\N	181	-1	1
626	6	6	f	0	0	0	Inch	\N	182	-1	1
626	2	3	f	1	0	0	\N	\N	184	-1	1
626	6	6	f	0	0	0	admin	\N	40	-1	1
626	2	3	f	3008	0	0	\N	\N	185	-1	1
626	6	6	f	0	0	0	wind turbine.JPG	\N	26	-1	1
626	5	5	f	0	0	72	\N	\N	187	-1	1
626	6	6	f	0	0	0	wind turbine.JPG	\N	28	-1	4
626	2	3	f	2000	0	0	\N	\N	192	-1	1
626	21	3	f	175	0	0	\N	\N	51	-1	1
627	6	6	f	0	0	0	doclib	\N	145	-1	1
627	6	6	f	0	0	0	admin	\N	40	-1	1
627	6	6	f	0	0	0	doclib	\N	26	-1	1
627	15	6	f	0	0	0	{http://www.alfresco.org/model/content/1.0}content	\N	144	-1	1
627	21	3	f	176	0	0	\N	\N	51	-1	1
628	6	6	f	0	0	0	admin	\N	40	-1	1
628	2	3	f	217	0	0	\N	\N	185	-1	1
628	6	6	f	0	0	0	header.png	\N	26	-1	1
628	6	6	f	0	0	0	header.png	\N	28	-1	4
628	2	3	f	793	0	0	\N	\N	192	-1	1
628	21	3	f	177	0	0	\N	\N	51	-1	1
629	6	6	f	0	0	0	doclib	\N	145	-1	1
629	6	6	f	0	0	0	admin	\N	40	-1	1
629	6	6	f	0	0	0	doclib	\N	26	-1	1
629	15	6	f	0	0	0	{http://www.alfresco.org/model/content/1.0}content	\N	144	-1	1
629	21	3	f	178	0	0	\N	\N	51	-1	1
630	6	6	f	0	0	0	admin	\N	40	-1	1
630	2	3	f	1000	0	0	\N	\N	185	-1	1
630	6	6	f	0	0	0	windmill.png	\N	26	-1	1
630	6	6	f	0	0	0	windmill.png	\N	28	-1	4
630	2	3	f	591	0	0	\N	\N	192	-1	1
630	21	3	f	179	0	0	\N	\N	51	-1	1
631	6	6	f	0	0	0	doclib	\N	145	-1	1
631	6	6	f	0	0	0	admin	\N	40	-1	1
631	6	6	f	0	0	0	doclib	\N	26	-1	1
631	15	6	f	0	0	0	{http://www.alfresco.org/model/content/1.0}content	\N	144	-1	1
631	21	3	f	180	0	0	\N	\N	51	-1	1
632	6	6	f	0	0	0	admin	\N	40	-1	1
632	2	3	f	245	0	0	\N	\N	185	-1	1
632	6	6	f	0	0	0	low consumption bulb.png	\N	26	-1	1
632	6	6	f	0	0	0	low consumption bulb.png	\N	28	-1	4
632	2	3	f	625	0	0	\N	\N	192	-1	1
632	21	3	f	181	0	0	\N	\N	51	-1	1
633	6	6	f	0	0	0	doclib	\N	145	-1	1
633	6	6	f	0	0	0	admin	\N	40	-1	1
633	6	6	f	0	0	0	doclib	\N	26	-1	1
633	15	6	f	0	0	0	{http://www.alfresco.org/model/content/1.0}content	\N	144	-1	1
633	21	3	f	182	0	0	\N	\N	51	-1	1
634	6	6	f	0	0	0	admin	\N	40	-1	1
634	6	6	f	0	0	0	Logo Files	\N	26	-1	1
634	6	6	f	0	0	0	This folder holds new logo files for the web site	\N	27	-1	2
634	6	6	f	0	0	0	Project logo files	\N	28	-1	2
635	2	3	f	1	0	0	\N	\N	161	-1	1
635	6	6	f	0	0	0	admin	\N	40	-1	1
635	2	3	f	192	0	0	\N	\N	185	-1	1
635	6	6	f	0	0	0	GE Logo.png	\N	26	-1	1
635	6	6	f	0	0	0	GE Logo.png	\N	28	-1	4
635	4	4	f	0	1	0	\N	\N	157	-1	1
635	2	3	f	400	0	0	\N	\N	192	-1	1
635	21	3	f	183	0	0	\N	\N	51	-1	1
636	6	6	f	0	0	0	doclib	\N	145	-1	1
636	6	6	f	0	0	0	admin	\N	40	-1	1
636	6	6	f	0	0	0	doclib	\N	26	-1	1
636	15	6	f	0	0	0	{http://www.alfresco.org/model/content/1.0}content	\N	144	-1	1
636	21	3	f	184	0	0	\N	\N	51	-1	1
637	2	3	f	1	0	0	\N	\N	161	-1	1
637	6	6	f	0	0	0	admin	\N	40	-1	1
637	2	3	f	398	0	0	\N	\N	185	-1	1
637	6	6	f	0	0	0	logo.png	\N	26	-1	1
637	6	6	f	0	0	0	logo.png	\N	28	-1	4
637	4	4	f	0	1	0	\N	\N	157	-1	1
637	2	3	f	414	0	0	\N	\N	192	-1	1
637	21	3	f	185	0	0	\N	\N	51	-1	1
638	6	6	f	0	0	0	doclib	\N	145	-1	1
638	6	6	f	0	0	0	admin	\N	40	-1	1
638	6	6	f	0	0	0	doclib	\N	26	-1	1
638	15	6	f	0	0	0	{http://www.alfresco.org/model/content/1.0}content	\N	144	-1	1
638	21	3	f	186	0	0	\N	\N	51	-1	1
639	6	6	f	0	0	0	admin	\N	40	-1	1
639	6	6	f	0	0	0	Mock-Ups	\N	26	-1	1
639	6	6	f	0	0	0	This folder holds the web site mock-ups or wireframes	\N	27	-1	2
639	6	6	f	0	0	0	Web wireframes	\N	28	-1	2
640	6	6	f	0	0	0	admin	\N	40	-1	1
640	2	3	f	893	0	0	\N	\N	185	-1	1
640	6	6	f	0	0	0	sample 1.png	\N	26	-1	1
640	6	6	f	0	0	0	sample 1.png	\N	28	-1	4
640	2	3	f	1067	0	0	\N	\N	192	-1	1
640	21	3	f	187	0	0	\N	\N	51	-1	1
641	6	6	f	0	0	0	doclib	\N	145	-1	1
641	6	6	f	0	0	0	admin	\N	40	-1	1
641	6	6	f	0	0	0	doclib	\N	26	-1	1
641	15	6	f	0	0	0	{http://www.alfresco.org/model/content/1.0}content	\N	144	-1	1
641	21	3	f	188	0	0	\N	\N	51	-1	1
642	6	6	f	0	0	0	admin	\N	40	-1	1
642	2	3	f	921	0	0	\N	\N	185	-1	1
642	6	6	f	0	0	0	sample 2.png	\N	26	-1	1
642	6	6	f	0	0	0	sample 2.png	\N	28	-1	4
642	2	3	f	778	0	0	\N	\N	192	-1	1
642	21	3	f	189	0	0	\N	\N	51	-1	1
643	6	6	f	0	0	0	doclib	\N	145	-1	1
643	6	6	f	0	0	0	admin	\N	40	-1	1
643	6	6	f	0	0	0	doclib	\N	26	-1	1
643	15	6	f	0	0	0	{http://www.alfresco.org/model/content/1.0}content	\N	144	-1	1
643	21	3	f	190	0	0	\N	\N	51	-1	1
644	6	6	f	0	0	0	imgpreview	\N	145	-1	1
644	6	6	f	0	0	0	admin	\N	40	-1	1
644	6	6	f	0	0	0	imgpreview	\N	26	-1	1
644	15	6	f	0	0	0	{http://www.alfresco.org/model/content/1.0}content	\N	144	-1	1
644	21	3	f	191	0	0	\N	\N	51	-1	1
645	2	3	f	2	0	0	\N	\N	161	-1	1
645	6	6	f	0	0	0	admin	\N	40	-1	1
645	2	3	f	769	0	0	\N	\N	185	-1	1
645	6	6	f	0	0	0	sample 3.png	\N	26	-1	1
645	6	6	f	0	0	0	sample 3.png	\N	28	-1	4
645	4	4	f	0	2	0	\N	\N	157	-1	1
645	2	3	f	782	0	0	\N	\N	192	-1	1
645	21	3	f	192	0	0	\N	\N	51	-1	1
646	6	6	f	0	0	0	doclib	\N	145	-1	1
646	6	6	f	0	0	0	admin	\N	40	-1	1
646	6	6	f	0	0	0	doclib	\N	26	-1	1
646	15	6	f	0	0	0	{http://www.alfresco.org/model/content/1.0}content	\N	144	-1	1
646	21	3	f	193	0	0	\N	\N	51	-1	1
647	6	6	f	0	0	0	imgpreview	\N	145	-1	1
647	6	6	f	0	0	0	admin	\N	40	-1	1
647	6	6	f	0	0	0	imgpreview	\N	26	-1	1
647	15	6	f	0	0	0	{http://www.alfresco.org/model/content/1.0}content	\N	144	-1	1
647	21	3	f	194	0	0	\N	\N	51	-1	1
648	6	6	f	0	0	0	admin	\N	40	-1	1
648	6	6	f	0	0	0	Video Files	\N	26	-1	1
648	6	6	f	0	0	0	This folder holds any video files related to the project	\N	27	-1	4
648	6	6	f	0	0	0	Folder for video files	\N	28	-1	4
649	6	6	f	0	0	0	Created by John Cavendish	\N	54	-1	1
649	6	6	f	0	0	0	admin	\N	40	-1	1
649	6	6	f	0	0	0	WebSiteReview.mp4	\N	26	-1	1
649	6	6	f	0	0	0	This is a video of the mock up to show the planned structure for the new web site.	\N	27	-1	4
649	6	6	f	0	0	0	WebSiteReview.mp4	\N	28	-1	4
649	21	3	f	195	0	0	\N	\N	51	-1	1
650	6	6	f	0	0	0	admin	\N	40	-1	1
650	6	6	f	0	0	0	Budget Files	\N	26	-1	1
650	6	6	f	0	0	0	This folder holds the project budget and invoices	\N	27	-1	2
650	6	6	f	0	0	0	Project finance files	\N	28	-1	2
651	6	6	f	0	0	0	admin	\N	40	-1	1
651	6	6	f	0	0	0	Invoices	\N	26	-1	1
651	6	6	f	0	0	0	This folder holds invoices for the project	\N	27	-1	2
651	6	6	f	0	0	0	Project invoices	\N	28	-1	2
652	6	6	f	0	0	0	admin	\N	40	-1	1
652	2	3	f	974	0	0	\N	\N	185	-1	1
652	6	6	f	0	0	0	inv I200-109.png	\N	26	-1	1
652	6	6	f	0	0	0	inv I200-109.png	\N	28	-1	4
652	2	3	f	749	0	0	\N	\N	192	-1	1
652	21	3	f	196	0	0	\N	\N	51	-1	1
653	6	6	f	0	0	0	doclib	\N	145	-1	1
653	6	6	f	0	0	0	admin	\N	40	-1	1
653	6	6	f	0	0	0	doclib	\N	26	-1	1
653	15	6	f	0	0	0	{http://www.alfresco.org/model/content/1.0}content	\N	144	-1	1
653	21	3	f	197	0	0	\N	\N	51	-1	1
654	6	6	f	0	0	0	admin	\N	40	-1	1
654	2	3	f	970	0	0	\N	\N	185	-1	1
654	6	6	f	0	0	0	inv I200-189.png	\N	26	-1	1
654	6	6	f	0	0	0	inv I200-189.png	\N	28	-1	4
654	2	3	f	751	0	0	\N	\N	192	-1	1
654	21	3	f	198	0	0	\N	\N	51	-1	1
655	6	6	f	0	0	0	doclib	\N	145	-1	1
655	6	6	f	0	0	0	admin	\N	40	-1	1
655	6	6	f	0	0	0	doclib	\N	26	-1	1
655	15	6	f	0	0	0	{http://www.alfresco.org/model/content/1.0}content	\N	144	-1	1
655	21	3	f	199	0	0	\N	\N	51	-1	1
656	6	6	f	0	0	0	Mike Jackson	\N	54	-1	1
656	6	6	f	0	0	0	admin	\N	40	-1	1
656	6	6	f	0	0	0	budget.xls	\N	26	-1	1
656	6	6	f	0	0	0	Budget file for the web site redesign	\N	27	-1	2
656	6	6	f	0	0	0	Web Site Design - Budget	\N	28	-1	2
656	21	3	f	200	0	0	\N	\N	51	-1	1
657	6	6	f	0	0	0	doclib	\N	145	-1	1
657	6	6	f	0	0	0	admin	\N	40	-1	1
657	6	6	f	0	0	0	doclib	\N	26	-1	1
657	15	6	f	0	0	0	{http://www.alfresco.org/model/content/1.0}content	\N	144	-1	1
657	21	3	f	201	0	0	\N	\N	51	-1	1
658	6	6	f	0	0	0	webpreview	\N	145	-1	1
658	6	6	f	0	0	0	admin	\N	40	-1	1
658	6	6	f	0	0	0	webpreview	\N	26	-1	1
658	15	6	f	0	0	0	{http://www.alfresco.org/model/content/1.0}content	\N	144	-1	1
658	21	3	f	202	0	0	\N	\N	51	-1	1
659	6	6	f	0	0	0	budget.xls discussion	\N	26	-1	1
659	6	6	f	0	0	0	forum	\N	29	-1	1
659	6	6	f	0	0	0	admin	\N	40	-1	1
660	6	6	f	0	0	0	Comments	\N	26	-1	1
660	6	6	f	0	0	0	admin	\N	40	-1	1
661	6	6	f	0	0	0	comment-1297852210661_622	\N	26	-1	1
661	6	6	f	0	0	0		\N	28	-1	2
661	6	6	f	0	0	0	admin	\N	40	-1	1
661	21	3	f	203	0	0	\N	\N	51	-1	1
662	6	6	f	0	0	0	admin	\N	40	-1	1
662	6	6	f	0	0	0	Meeting Notes	\N	26	-1	1
662	6	6	f	0	0	0	This folder holds notes from the project review meetings	\N	27	-1	2
662	6	6	f	0	0	0	Project meeting notes	\N	28	-1	2
663	6	6	f	0	0	0	Meeting Notes 2011-01-27.doc	\N	26	-1	1
663	6	6	f	0	0	0	Meeting Notes 2011-01-27.doc	\N	28	-1	2
663	6	6	f	0	0	0	admin	\N	40	-1	1
663	21	3	f	204	0	0	\N	\N	51	-1	1
664	6	6	f	0	0	0	doclib	\N	145	-1	1
664	6	6	f	0	0	0	admin	\N	40	-1	1
664	6	6	f	0	0	0	doclib	\N	26	-1	1
664	15	6	f	0	0	0	{http://www.alfresco.org/model/content/1.0}content	\N	144	-1	1
664	21	3	f	205	0	0	\N	\N	51	-1	1
665	6	6	f	0	0	0	webpreview	\N	145	-1	1
665	6	6	f	0	0	0	admin	\N	40	-1	1
665	6	6	f	0	0	0	webpreview	\N	26	-1	1
665	15	6	f	0	0	0	{http://www.alfresco.org/model/content/1.0}content	\N	144	-1	1
665	21	3	f	206	0	0	\N	\N	51	-1	1
666	6	6	f	0	0	0	Meeting Notes 2011-02-03.doc	\N	26	-1	1
666	6	6	f	0	0	0	Meeting Notes 2011-02-03.doc	\N	28	-1	2
666	6	6	f	0	0	0	admin	\N	40	-1	1
666	21	3	f	207	0	0	\N	\N	51	-1	1
667	6	6	f	0	0	0	doclib	\N	145	-1	1
667	6	6	f	0	0	0	admin	\N	40	-1	1
667	6	6	f	0	0	0	doclib	\N	26	-1	1
667	15	6	f	0	0	0	{http://www.alfresco.org/model/content/1.0}content	\N	144	-1	1
667	21	3	f	208	0	0	\N	\N	51	-1	1
668	6	6	f	0	0	0	webpreview	\N	145	-1	1
668	6	6	f	0	0	0	admin	\N	40	-1	1
668	6	6	f	0	0	0	webpreview	\N	26	-1	1
668	15	6	f	0	0	0	{http://www.alfresco.org/model/content/1.0}content	\N	144	-1	1
668	21	3	f	209	0	0	\N	\N	51	-1	1
669	6	6	f	0	0	0	Meeting Notes 2011-02-10.doc	\N	26	-1	1
669	6	6	f	0	0	0	Meeting Notes 2011-02-10.doc	\N	28	-1	2
669	6	6	f	0	0	0	admin	\N	40	-1	1
669	21	3	f	210	0	0	\N	\N	51	-1	1
670	6	6	f	0	0	0	doclib	\N	145	-1	1
670	6	6	f	0	0	0	admin	\N	40	-1	1
670	6	6	f	0	0	0	doclib	\N	26	-1	1
670	15	6	f	0	0	0	{http://www.alfresco.org/model/content/1.0}content	\N	144	-1	1
670	21	3	f	211	0	0	\N	\N	51	-1	1
671	6	6	f	0	0	0	webpreview	\N	145	-1	1
671	6	6	f	0	0	0	admin	\N	40	-1	1
671	6	6	f	0	0	0	webpreview	\N	26	-1	1
671	15	6	f	0	0	0	{http://www.alfresco.org/model/content/1.0}content	\N	144	-1	1
671	21	3	f	212	0	0	\N	\N	51	-1	1
672	6	6	f	0	0	0	admin	\N	40	-1	1
672	6	6	f	0	0	0	Presentations	\N	26	-1	1
672	6	6	f	0	0	0	This folder holds presentations from the project	\N	27	-1	2
672	6	6	f	0	0	0	Project presentations	\N	28	-1	2
673	6	6	f	0	0	0	Project Objectives.ppt	\N	26	-1	1
673	6	6	f	0	0	0	Project Objectives.ppt	\N	28	-1	4
673	6	6	f	0	0	0	admin	\N	40	-1	1
673	21	3	f	213	0	0	\N	\N	51	-1	1
674	6	6	f	0	0	0	doclib	\N	145	-1	1
674	6	6	f	0	0	0	admin	\N	40	-1	1
674	6	6	f	0	0	0	doclib	\N	26	-1	1
674	15	6	f	0	0	0	{http://www.alfresco.org/model/content/1.0}content	\N	144	-1	1
674	21	3	f	214	0	0	\N	\N	51	-1	1
675	6	6	f	0	0	0	webpreview	\N	145	-1	1
675	6	6	f	0	0	0	admin	\N	40	-1	1
675	6	6	f	0	0	0	webpreview	\N	26	-1	1
675	15	6	f	0	0	0	{http://www.alfresco.org/model/content/1.0}content	\N	144	-1	1
675	21	3	f	215	0	0	\N	\N	51	-1	1
676	6	6	f	0	0	0	Project Overview.ppt	\N	26	-1	1
676	6	6	f	0	0	0	Project Overview.ppt	\N	28	-1	4
676	6	6	f	0	0	0	admin	\N	40	-1	1
676	21	3	f	216	0	0	\N	\N	51	-1	1
677	6	6	f	0	0	0	doclib	\N	145	-1	1
677	6	6	f	0	0	0	admin	\N	40	-1	1
677	6	6	f	0	0	0	doclib	\N	26	-1	1
677	15	6	f	0	0	0	{http://www.alfresco.org/model/content/1.0}content	\N	144	-1	1
677	21	3	f	217	0	0	\N	\N	51	-1	1
678	6	6	f	0	0	0	webpreview	\N	145	-1	1
678	6	6	f	0	0	0	admin	\N	40	-1	1
678	6	6	f	0	0	0	webpreview	\N	26	-1	1
678	15	6	f	0	0	0	{http://www.alfresco.org/model/content/1.0}content	\N	144	-1	1
678	21	3	f	218	0	0	\N	\N	51	-1	1
679	6	6	f	0	0	0	links	\N	153	-1	1
679	6	6	f	0	0	0	links	\N	26	-1	1
679	6	6	f	0	0	0	admin	\N	40	-1	1
680	6	6	f	0	0	0	admin	\N	40	-1	1
680	6	6	f	0	0	0	The W3 Schools web site has some good guides (with interactive examples) on how to create websites	\N	201	-1	1
680	6	6	f	0	0	0	link-1297806194371_850	\N	26	-1	1
680	6	6	f	0	0	0	W3 Schools	\N	202	-1	1
680	6	6	f	0	0	0	http://www.w3schools.com/	\N	203	-1	1
680	21	3	f	219	0	0	\N	\N	51	-1	1
681	6	6	f	0	0	0	admin	\N	40	-1	1
681	6	6	f	0	0	0	W3C website. Includes some good guides to web design and application	\N	201	-1	1
681	6	6	f	0	0	0	link-1297806244007_178	\N	26	-1	1
681	6	6	f	0	0	0	Web Design and Applications	\N	202	-1	1
681	6	6	f	0	0	0	http://www.w3.org/standards/webdesign/	\N	203	-1	1
681	21	3	f	220	0	0	\N	\N	51	-1	1
682	6	6	f	0	0	0	admin	\N	40	-1	1
682	6	6	f	0	0	0	dataLists	\N	153	-1	1
682	6	6	f	0	0	0	dataLists	\N	26	-1	1
682	6	6	f	0	0	0	Data Lists	\N	27	-1	2
683	6	6	f	0	0	0	admin	\N	40	-1	1
683	6	6	f	0	0	0	71824d77-9cd8-44c3-b3e4-dbca7e17dc49	\N	26	-1	1
683	6	6	f	0	0	0	Project issues	\N	27	-1	2
683	6	6	f	0	0	0	Issue Log	\N	28	-1	2
683	6	6	f	0	0	0	dl:issue	\N	205	-1	1
684	6	6	f	0	0	0		\N	209	-1	1
684	7	6	f	0	0	0	2011-03-09T00:00:00.000Z	\N	210	-1	1
684	6	6	f	0	0	0	Issue 1	\N	211	-1	1
684	6	6	f	0	0	0	admin	\N	40	-1	1
684	6	6	f	0	0	0	e6fc15e9-5caf-4f17-857e-7b0cfbc655a9	\N	26	-1	1
684	6	6	f	0	0	0	Support need to be able to access and update content of the corporate web site. Need to find a solution.	\N	27	-1	2
684	6	6	f	0	0	0	Support access	\N	28	-1	2
684	6	6	f	0	0	0	Not Started	\N	207	-1	1
684	6	6	f	0	0	0	Normal	\N	208	-1	1
685	6	6	f	0	0	0	Looking to use an Open Source solution	\N	209	-1	1
685	7	6	f	0	0	0	2011-02-24T00:00:00.000Z	\N	210	-1	1
685	6	6	f	0	0	0	Issue 3	\N	211	-1	1
685	6	6	f	0	0	0	admin	\N	40	-1	1
685	6	6	f	0	0	0	42fcbae6-b1fe-4028-9f85-9ad7f81a8e3b	\N	26	-1	1
685	6	6	f	0	0	0	The budget has been cut. Need to address the cuts and work out how accomodate the project.	\N	27	-1	2
685	6	6	f	0	0	0	Budget cut	\N	28	-1	2
685	6	6	f	0	0	0	Not Started	\N	207	-1	1
685	6	6	f	0	0	0	High	\N	208	-1	1
686	6	6	f	0	0	0	Alice is actively trying to sort this	\N	209	-1	1
686	7	6	f	0	0	0	2011-03-02T00:00:00.000Z	\N	210	-1	1
686	6	6	f	0	0	0	Issue 2	\N	211	-1	1
686	6	6	f	0	0	0	admin	\N	40	-1	1
686	6	6	f	0	0	0	66028f46-c074-4cf5-9f37-8490e51ca540	\N	26	-1	1
686	6	6	f	0	0	0	There is an issue with the copyright of one of the images selected. Need to source a replacement.	\N	27	-1	2
686	6	6	f	0	0	0	Copyright issue	\N	28	-1	2
686	6	6	f	0	0	0	In Progress	\N	207	-1	1
686	6	6	f	0	0	0	High	\N	208	-1	1
687	6	6	f	0	0	0	This has been solved. Izzy Previn has joined the team.	\N	209	-1	1
687	7	6	f	0	0	0	2011-02-17T00:00:00.000Z	\N	210	-1	1
687	6	6	f	0	0	0	Issue 4	\N	211	-1	1
687	6	6	f	0	0	0	admin	\N	40	-1	1
687	6	6	f	0	0	0	50046ccd-9034-420f-925b-0530836488c4	\N	26	-1	1
687	6	6	f	0	0	0	The Web Manager has resigned. Need to find a replacement.	\N	27	-1	2
687	6	6	f	0	0	0	Web Manager	\N	28	-1	2
687	6	6	f	0	0	0	Complete	\N	207	-1	1
687	6	6	f	0	0	0	High	\N	208	-1	1
688	6	6	f	0	0	0	admin	\N	40	-1	1
688	6	6	f	0	0	0	aea88103-517e-4aa0-a3be-de258d0e6465	\N	26	-1	1
688	6	6	f	0	0	0	Project to do list	\N	27	-1	4
688	6	6	f	0	0	0	Project to do list	\N	27	-1	2
688	6	6	f	0	0	0	To-Do	\N	28	-1	4
688	6	6	f	0	0	0	Task Log	\N	28	-1	2
688	6	6	f	0	0	0	dl:todoList	\N	205	-1	1
689	6	6	f	0	0	0	Not Started	\N	214	-1	1
689	2	3	f	3	0	0	\N	\N	215	-1	1
689	6	6	f	0	0	0		\N	216	-1	1
689	6	6	f	0	0	0	admin	\N	40	-1	1
689	6	6	f	0	0	0	Revise Project Objectives	\N	217	-1	1
689	6	6	f	0	0	0	9198bd31-a664-4584-a271-b529daf4793b	\N	26	-1	1
689	7	6	f	0	0	0	2011-03-08T00:00:00.000Z	\N	218	-1	1
690	6	6	f	0	0	0	In Progress	\N	214	-1	1
690	2	3	f	1	0	0	\N	\N	215	-1	1
690	6	6	f	0	0	0		\N	216	-1	1
690	6	6	f	0	0	0	admin	\N	40	-1	1
690	6	6	f	0	0	0	Update budget	\N	217	-1	1
690	6	6	f	0	0	0	eb1c2fda-4868-4384-b29e-78c01b6601ec	\N	26	-1	1
690	7	6	f	0	0	0	2011-03-14T00:00:00.000Z	\N	218	-1	1
691	6	6	f	0	0	0	On Hold	\N	214	-1	1
691	2	3	f	5	0	0	\N	\N	215	-1	1
691	6	6	f	0	0	0		\N	216	-1	1
691	6	6	f	0	0	0	admin	\N	40	-1	1
691	6	6	f	0	0	0	Upload new images	\N	217	-1	1
691	6	6	f	0	0	0	35b8be80-170f-40af-a173-513758b83165	\N	26	-1	1
691	7	6	f	0	0	0	2011-03-16T00:00:00.000Z	\N	218	-1	1
692	6	6	f	0	0	0	Complete	\N	214	-1	1
692	2	3	f	2	0	0	\N	\N	215	-1	1
692	6	6	f	0	0	0		\N	216	-1	1
692	6	6	f	0	0	0	admin	\N	40	-1	1
692	6	6	f	0	0	0	Contract	\N	217	-1	1
692	6	6	f	0	0	0	567ee439-4ebc-40cf-a783-3e561ad5a605	\N	26	-1	1
692	7	6	f	0	0	0	2011-02-01T00:00:00.000Z	\N	218	-1	1
693	6	6	f	0	0	0	Not Started	\N	214	-1	1
693	2	3	f	2	0	0	\N	\N	215	-1	1
693	6	6	f	0	0	0	Please take a look at the structure video and provide your feedback	\N	216	-1	1
693	6	6	f	0	0	0	admin	\N	40	-1	1
693	6	6	f	0	0	0	Review the web structure video	\N	217	-1	1
693	6	6	f	0	0	0	7a0bb872-bf7c-457b-831e-95f94efb9816	\N	26	-1	1
693	7	6	f	0	0	0	2011-03-30T23:00:00.000Z	\N	218	-1	1
694	6	6	f	0	0	0	wiki	\N	153	-1	1
694	6	6	f	0	0	0	wiki	\N	26	-1	1
694	6	6	f	0	0	0	admin	\N	40	-1	1
695	6	6	f	0	0	0	admin	\N	40	-1	1
695	6	6	f	0	0	0	Main_Page	\N	26	-1	1
695	1	1	t	0	0	0	\N	\N	156	-1	1
695	6	6	f	0	0	0	Main Page	\N	28	-1	4
695	6	6	f	0	0	0	Main Page	\N	28	-1	2
695	1	1	t	0	0	0	\N	\N	159	-1	1
695	1	1	t	0	0	0	\N	\N	160	-1	1
695	21	3	f	221	0	0	\N	\N	51	-1	1
696	6	6	f	0	0	0	d6f3a279-ce86-4a12-8985-93b71afbb71d	\N	26	-1	1
696	6	6	f	0	0	0	d6f3a279-ce86-4a12-8985-93b71afbb71d	\N	166	-1	1
697	6	6	f	0	0	0	Main_Page	\N	26	-1	1
697	21	3	f	222	0	0	\N	\N	51	-1	1
697	12	6	f	0	0	0	workspace://SpacesStore/d6f3a279-ce86-4a12-8985-93b71afbb71d	\N	168	-1	1
697	0	0	f	0	0	0	\N	\N	169	-1	1
697	3	3	f	695	0	0	\N	\N	171	-1	1
697	1	1	t	0	0	0	\N	\N	156	-1	1
697	0	0	f	0	0	0	\N	\N	172	-1	1
697	1	1	t	0	0	0	\N	\N	159	-1	1
697	1	1	t	0	0	0	\N	\N	160	-1	1
697	6	6	f	0	0	0	admin	\N	40	-1	1
697	0	0	f	0	0	0	\N	\N	27	-1	2
697	6	6	f	0	0	0	Main Page	\N	28	-1	4
697	6	6	f	0	0	0	Main Page	\N	28	-1	2
697	6	6	f	0	0	0	mjackson	\N	173	-1	1
697	7	6	f	0	0	0	2011-02-15T21:46:47.847Z	\N	174	-1	1
697	6	6	f	0	0	0	admin	\N	175	-1	1
697	7	6	f	0	0	0	2011-06-14T10:28:57.221Z	\N	176	-1	1
697	0	0	f	0	0	0	\N	\N	177	-1	1
697	0	0	f	0	0	0	\N	\N	155	-1	1
695	0	0	f	0	0	0	\N	\N	172	-1	1
695	6	6	f	0	0	0	1.15	\N	158	-1	1
697	0	0	f	0	0	0	\N	\N	158	-1	1
697	6	6	f	0	0	0	1.15	\N	170	-1	1
698	6	6	f	0	0	0	admin	\N	40	-1	1
698	6	6	f	0	0	0	Meetings	\N	26	-1	1
698	1	1	t	0	0	0	\N	\N	156	-1	1
698	6	6	f	0	0	0	Meetings	\N	28	-1	4
698	6	6	f	0	0	0	Meetings	\N	28	-1	2
698	1	1	t	0	0	0	\N	\N	159	-1	1
698	1	1	t	0	0	0	\N	\N	160	-1	1
698	21	3	f	223	0	0	\N	\N	51	-1	1
699	6	6	f	0	0	0	1373739a-2849-4647-9e97-7a4e05cc5841	\N	26	-1	1
699	6	6	f	0	0	0	1373739a-2849-4647-9e97-7a4e05cc5841	\N	166	-1	1
700	6	6	f	0	0	0	Meetings	\N	26	-1	1
700	21	3	f	224	0	0	\N	\N	51	-1	1
700	12	6	f	0	0	0	workspace://SpacesStore/1373739a-2849-4647-9e97-7a4e05cc5841	\N	168	-1	1
700	0	0	f	0	0	0	\N	\N	169	-1	1
700	3	3	f	698	0	0	\N	\N	171	-1	1
700	1	1	t	0	0	0	\N	\N	156	-1	1
700	0	0	f	0	0	0	\N	\N	172	-1	1
700	1	1	t	0	0	0	\N	\N	159	-1	1
700	1	1	t	0	0	0	\N	\N	160	-1	1
700	6	6	f	0	0	0	admin	\N	40	-1	1
700	0	0	f	0	0	0	\N	\N	27	-1	2
700	6	6	f	0	0	0	Meetings	\N	28	-1	4
700	6	6	f	0	0	0	Meetings	\N	28	-1	2
700	6	6	f	0	0	0	mjackson	\N	173	-1	1
700	7	6	f	0	0	0	2011-02-15T21:50:49.999Z	\N	174	-1	1
700	6	6	f	0	0	0	admin	\N	175	-1	1
700	7	6	f	0	0	0	2011-06-14T10:28:57.304Z	\N	176	-1	1
700	0	0	f	0	0	0	\N	\N	177	-1	1
700	0	0	f	0	0	0	\N	\N	155	-1	1
698	0	0	f	0	0	0	\N	\N	172	-1	1
698	6	6	f	0	0	0	1.2	\N	158	-1	1
700	0	0	f	0	0	0	\N	\N	158	-1	1
700	6	6	f	0	0	0	1.2	\N	170	-1	1
701	6	6	f	0	0	0	admin	\N	40	-1	1
701	6	6	f	0	0	0	Milestones	\N	26	-1	1
701	1	1	t	0	0	0	\N	\N	156	-1	1
701	6	6	f	0	0	0	Milestones	\N	28	-1	2
701	1	1	t	0	0	0	\N	\N	159	-1	1
701	1	1	t	0	0	0	\N	\N	160	-1	1
701	21	3	f	225	0	0	\N	\N	51	-1	1
702	6	6	f	0	0	0	3c73aace-9f54-420d-a1c0-c54b6a116dcf	\N	26	-1	1
702	6	6	f	0	0	0	3c73aace-9f54-420d-a1c0-c54b6a116dcf	\N	166	-1	1
703	6	6	f	0	0	0	Milestones	\N	26	-1	1
703	21	3	f	226	0	0	\N	\N	51	-1	1
703	12	6	f	0	0	0	workspace://SpacesStore/3c73aace-9f54-420d-a1c0-c54b6a116dcf	\N	168	-1	1
703	0	0	f	0	0	0	\N	\N	169	-1	1
703	3	3	f	701	0	0	\N	\N	171	-1	1
703	1	1	t	0	0	0	\N	\N	156	-1	1
703	0	0	f	0	0	0	\N	\N	172	-1	1
703	1	1	t	0	0	0	\N	\N	159	-1	1
703	1	1	t	0	0	0	\N	\N	160	-1	1
703	6	6	f	0	0	0	admin	\N	40	-1	1
703	0	0	f	0	0	0	\N	\N	27	-1	2
703	6	6	f	0	0	0	Milestones	\N	28	-1	2
703	6	6	f	0	0	0	mjackson	\N	173	-1	1
703	7	6	f	0	0	0	2011-02-15T21:59:31.855Z	\N	174	-1	1
703	6	6	f	0	0	0	admin	\N	175	-1	1
703	7	6	f	0	0	0	2011-06-14T10:28:57.370Z	\N	176	-1	1
703	0	0	f	0	0	0	\N	\N	177	-1	1
703	0	0	f	0	0	0	\N	\N	155	-1	1
701	0	0	f	0	0	0	\N	\N	172	-1	1
701	6	6	f	0	0	0	1.0	\N	158	-1	1
703	0	0	f	0	0	0	\N	\N	158	-1	1
703	6	6	f	0	0	0	1.0	\N	170	-1	1
704	6	6	f	0	0	0	discussions	\N	153	-1	1
704	6	6	f	0	0	0	discussions	\N	26	-1	1
704	6	6	f	0	0	0	admin	\N	40	-1	1
705	6	6	f	0	0	0	post-1297807546884_964	\N	26	-1	1
705	6	6	f	0	0	0	admin	\N	40	-1	1
706	6	6	f	0	0	0	admin	\N	40	-1	1
706	6	6	f	0	0	0	post-1297807546884_964	\N	26	-1	1
706	7	6	f	0	0	0	2011-02-15T22:05:46.921Z	\N	219	-1	1
706	6	6	f	0	0	0	Images for the web site	\N	28	-1	2
706	21	3	f	227	0	0	\N	\N	51	-1	1
707	6	6	f	0	0	0	admin	\N	40	-1	1
707	6	6	f	0	0	0	post-1297807619797_315	\N	26	-1	1
707	7	6	f	0	0	0	2011-02-15T22:06:59.836Z	\N	219	-1	1
707	6	6	f	0	0	0		\N	28	-1	2
707	21	3	f	228	0	0	\N	\N	51	-1	1
708	6	6	f	0	0	0	admin	\N	40	-1	1
708	6	6	f	0	0	0	post-1297807729794_112	\N	26	-1	1
708	7	6	f	0	0	0	2011-02-15T22:08:49.829Z	\N	219	-1	1
708	6	6	f	0	0	0		\N	28	-1	2
708	21	3	f	229	0	0	\N	\N	51	-1	1
709	6	6	f	0	0	0	admin	\N	40	-1	1
709	6	6	f	0	0	0	post-1297807767790_183	\N	26	-1	1
709	7	6	f	0	0	0	2011-02-15T22:09:27.840Z	\N	219	-1	1
709	6	6	f	0	0	0		\N	28	-1	2
709	21	3	f	230	0	0	\N	\N	51	-1	1
710	6	6	f	0	0	0	post-1297807581026_873	\N	26	-1	1
710	6	6	f	0	0	0	admin	\N	40	-1	1
711	6	6	f	0	0	0	admin	\N	40	-1	1
711	6	6	f	0	0	0	post-1297807581026_873	\N	26	-1	1
711	7	6	f	0	0	0	2011-02-15T22:06:21.056Z	\N	219	-1	1
711	6	6	f	0	0	0	Web Content Management Technology	\N	28	-1	2
711	21	3	f	231	0	0	\N	\N	51	-1	1
712	6	6	f	0	0	0	admin	\N	40	-1	1
712	6	6	f	0	0	0	post-1297807650635_649	\N	26	-1	1
712	7	6	f	0	0	0	2011-02-15T22:07:30.663Z	\N	219	-1	1
712	6	6	f	0	0	0		\N	28	-1	2
712	7	6	f	0	0	0	2011-02-15T22:08:02.670Z	\N	222	-1	1
712	21	3	f	232	0	0	\N	\N	51	-1	1
713	2	3	f	0	0	0	\N	\N	82	-1	1
713	1	1	f	0	0	0	\N	\N	83	-1	1
713	1	1	f	0	0	0	\N	\N	84	-1	1
713	1	1	t	0	0	0	\N	\N	86	-1	1
713	1	1	f	0	0	0	\N	\N	87	-1	1
713	6	6	f	0	0	0	surf-config	\N	26	-1	1
713	1	1	f	0	0	0	\N	\N	223	-1	1
714	6	6	f	0	0	0	pages	\N	26	-1	1
714	1	1	t	0	0	0	\N	\N	86	-1	1
714	1	1	f	0	0	0	\N	\N	87	-1	1
715	6	6	f	0	0	0	site	\N	26	-1	1
715	1	1	t	0	0	0	\N	\N	86	-1	1
715	1	1	f	0	0	0	\N	\N	87	-1	1
716	6	6	f	0	0	0	swsdp	\N	26	-1	1
716	1	1	t	0	0	0	\N	\N	86	-1	1
716	1	1	f	0	0	0	\N	\N	87	-1	1
717	6	6	f	0	0	0	dashboard.xml	\N	26	-1	1
717	1	1	t	0	0	0	\N	\N	86	-1	1
717	1	1	f	0	0	0	\N	\N	87	-1	1
717	21	3	f	233	0	0	\N	\N	51	-1	1
718	6	6	f	0	0	0	components	\N	26	-1	1
718	1	1	t	0	0	0	\N	\N	86	-1	1
718	1	1	f	0	0	0	\N	\N	87	-1	1
719	6	6	f	0	0	0	page.component-1-1.site~swsdp~dashboard.xml	\N	26	-1	1
719	1	1	t	0	0	0	\N	\N	86	-1	1
719	1	1	f	0	0	0	\N	\N	87	-1	1
719	21	3	f	234	0	0	\N	\N	51	-1	1
720	6	6	f	0	0	0	page.component-1-3.site~swsdp~dashboard.xml	\N	26	-1	1
720	1	1	t	0	0	0	\N	\N	86	-1	1
720	1	1	f	0	0	0	\N	\N	87	-1	1
720	21	3	f	235	0	0	\N	\N	51	-1	1
721	6	6	f	0	0	0	page.component-2-1.site~swsdp~dashboard.xml	\N	26	-1	1
721	1	1	t	0	0	0	\N	\N	86	-1	1
721	1	1	f	0	0	0	\N	\N	87	-1	1
721	21	3	f	236	0	0	\N	\N	51	-1	1
722	6	6	f	0	0	0	page.component-2-2.site~swsdp~dashboard.xml	\N	26	-1	1
722	1	1	t	0	0	0	\N	\N	86	-1	1
722	1	1	f	0	0	0	\N	\N	87	-1	1
722	21	3	f	237	0	0	\N	\N	51	-1	1
723	6	6	f	0	0	0	page.component-2-3.site~swsdp~dashboard.xml	\N	26	-1	1
723	1	1	t	0	0	0	\N	\N	86	-1	1
723	1	1	f	0	0	0	\N	\N	87	-1	1
723	21	3	f	238	0	0	\N	\N	51	-1	1
724	6	6	f	0	0	0	page.navigation.site~swsdp~dashboard.xml	\N	26	-1	1
724	1	1	t	0	0	0	\N	\N	86	-1	1
724	1	1	f	0	0	0	\N	\N	87	-1	1
724	21	3	f	239	0	0	\N	\N	51	-1	1
725	6	6	f	0	0	0	page.title.site~swsdp~dashboard.xml	\N	26	-1	1
725	1	1	t	0	0	0	\N	\N	86	-1	1
725	1	1	f	0	0	0	\N	\N	87	-1	1
725	21	3	f	240	0	0	\N	\N	51	-1	1
726	6	6	f	0	0	0	page.component-1-2.site~swsdp~dashboard.xml	\N	26	-1	1
726	1	1	t	0	0	0	\N	\N	86	-1	1
726	1	1	f	0	0	0	\N	\N	87	-1	1
726	21	3	f	241	0	0	\N	\N	51	-1	1
727	6	6	f	0	0	0	page.component-1-4.site~swsdp~dashboard.xml	\N	26	-1	1
727	1	1	t	0	0	0	\N	\N	86	-1	1
727	1	1	f	0	0	0	\N	\N	87	-1	1
727	21	3	f	242	0	0	\N	\N	51	-1	1
603	0	0	f	0	0	0	\N	\N	155	-1	1
649	0	0	f	0	0	0	\N	\N	155	-1	1
650	0	0	f	0	0	0	\N	\N	155	-1	1
680	9	9	f	0	0	0	\N	\\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078	155	-1	1
681	9	9	f	0	0	0	\N	\\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078	155	-1	1
695	9	9	f	0	0	0	\N	\\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078	155	-1	1
698	9	9	f	0	0	0	\N	\\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078	155	-1	1
701	9	9	f	0	0	0	\N	\\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078	155	-1	1
705	9	9	f	0	0	0	\N	\\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078	155	-1	1
710	9	9	f	0	0	0	\N	\\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078	155	-1	1
728	6	6	f	0	0	0	modules	\N	26	-1	1
729	6	6	f	0	0	0	alfresco-aos-module	\N	26	-1	1
729	9	9	f	0	0	0	\N	\\xaced00057372002c6f72672e616c66726573636f2e7265706f2e6d6f64756c652e4d6f64756c6556657273696f6e4e756d62657277473de5d9c7c28c0c0000787077070005312e312e3678	228	-1	1
729	9	9	f	0	0	0	\N	\\xaced00057372002c6f72672e616c66726573636f2e7265706f2e6d6f64756c652e4d6f64756c6556657273696f6e4e756d62657277473de5d9c7c28c0c0000787077070005312e312e3678	229	-1	1
730	6	6	f	0	0	0	org.alfresco.integrations.google.docs	\N	26	-1	1
730	9	9	f	0	0	0	\N	\\xaced00057372002c6f72672e616c66726573636f2e7265706f2e6d6f64756c652e4d6f64756c6556657273696f6e4e756d62657277473de5d9c7c28c0c0000787077070005332e302e3478	228	-1	1
730	9	9	f	0	0	0	\N	\\xaced00057372002c6f72672e616c66726573636f2e7265706f2e6d6f64756c652e4d6f64756c6556657273696f6e4e756d62657277473de5d9c7c28c0c0000787077070005332e302e3478	229	-1	1
731	6	6	f	0	0	0	alfresco-share-services	\N	26	-1	1
731	9	9	f	0	0	0	\N	\\xaced00057372002c6f72672e616c66726573636f2e7265706f2e6d6f64756c652e4d6f64756c6556657273696f6e4e756d62657277473de5d9c7c28c0c0000787077070005352e322e3078	228	-1	1
731	9	9	f	0	0	0	\N	\\xaced00057372002c6f72672e616c66726573636f2e7265706f2e6d6f64756c652e4d6f64756c6556657273696f6e4e756d62657277473de5d9c7c28c0c0000787077070005352e322e3078	229	-1	1
732	6	6	f	0	0	0	alfresco-trashcan-cleaner	\N	26	-1	1
732	9	9	f	0	0	0	\N	\\xaced00057372002c6f72672e616c66726573636f2e7265706f2e6d6f64756c652e4d6f64756c6556657273696f6e4e756d62657277473de5d9c7c28c0c0000787077050003322e3278	228	-1	1
732	9	9	f	0	0	0	\N	\\xaced00057372002c6f72672e616c66726573636f2e7265706f2e6d6f64756c652e4d6f64756c6556657273696f6e4e756d62657277473de5d9c7c28c0c0000787077050003322e3278	229	-1	1
733	6	6	f	0	0	0	imageRenderingEngine	\N	70	-1	1
733	0	0	f	0	0	0	\N	\N	98	-1	1
733	0	0	f	0	0	0	\N	\N	99	-1	1
733	1	1	f	0	0	0	\N	\N	68	-1	1
733	0	0	f	0	0	0	\N	\N	100	-1	1
733	0	0	f	0	0	0	\N	\N	69	-1	1
733	6	6	f	0	0	0	New	\N	101	-1	1
733	0	0	f	0	0	0	\N	\N	71	-1	1
734	3	3	f	-1	0	0	\N	\N	77	-1	1
734	6	6	f	0	0	0	maxSourceSizeKBytes	\N	78	-1	1
735	6	6	f	0	0	0	System	\N	77	-1	1
735	6	6	f	0	0	0	runAs	\N	78	-1	1
736	1	1	t	0	0	0	\N	\N	77	-1	1
736	6	6	f	0	0	0	autoOrientation	\N	78	-1	1
737	6	6	f	0	0	0	image/jpeg	\N	77	-1	1
737	6	6	f	0	0	0	mime-type	\N	78	-1	1
738	2	3	f	960	0	0	\N	\N	77	-1	1
738	6	6	f	0	0	0	ysize	\N	78	-1	1
739	15	6	f	0	0	0	{http://www.alfresco.org/model/content/1.0}thumbnail	\N	77	-1	1
739	6	6	f	0	0	0	rendition-nodetype	\N	78	-1	1
740	6	6	f	0	0	0	imgpreview	\N	77	-1	1
740	6	6	f	0	0	0	use	\N	78	-1	1
741	3	3	f	-1	0	0	\N	\N	77	-1	1
741	6	6	f	0	0	0	readLimitKBytes	\N	78	-1	1
742	2	3	f	960	0	0	\N	\N	77	-1	1
742	6	6	f	0	0	0	xsize	\N	78	-1	1
743	15	6	f	0	0	0	{http://www.alfresco.org/model/content/1.0}imgpreview	\N	77	-1	1
743	6	6	f	0	0	0	renderingActionName	\N	78	-1	1
744	6	6	f	0	0	0	alfresco/thumbnail/thumbnail_placeholder_256.png	\N	77	-1	1
744	6	6	f	0	0	0	placeHolderResourcePath	\N	78	-1	1
745	2	3	f	1	0	0	\N	\N	77	-1	1
745	6	6	f	0	0	0	pageLimit	\N	78	-1	1
746	3	3	f	-1	0	0	\N	\N	77	-1	1
746	6	6	f	0	0	0	timeoutMs	\N	78	-1	1
747	2	3	f	-1	0	0	\N	\N	77	-1	1
747	6	6	f	0	0	0	maxPages	\N	78	-1	1
748	1	1	f	0	0	0	\N	\N	77	-1	1
748	6	6	f	0	0	0	isAbsolute	\N	78	-1	1
749	1	1	t	0	0	0	\N	\N	77	-1	1
749	6	6	f	0	0	0	resizeToThumbnail	\N	78	-1	1
750	6	6	f	0	0	0		\N	77	-1	1
750	6	6	f	0	0	0	commandOptions	\N	78	-1	1
751	1	1	f	0	0	0	\N	\N	77	-1	1
751	6	6	f	0	0	0	allowEnlargement	\N	78	-1	1
752	1	1	t	0	0	0	\N	\N	77	-1	1
752	6	6	f	0	0	0	maintainAspectRatio	\N	78	-1	1
753	3	3	f	-1	0	0	\N	\N	77	-1	1
753	6	6	f	0	0	0	readLimitTimeMs	\N	78	-1	1
754	6	6	f	0	0	0	imageRenderingEngine	\N	70	-1	1
754	0	0	f	0	0	0	\N	\N	98	-1	1
754	0	0	f	0	0	0	\N	\N	99	-1	1
754	1	1	f	0	0	0	\N	\N	68	-1	1
754	0	0	f	0	0	0	\N	\N	100	-1	1
754	0	0	f	0	0	0	\N	\N	69	-1	1
754	6	6	f	0	0	0	New	\N	101	-1	1
754	0	0	f	0	0	0	\N	\N	71	-1	1
755	3	3	f	-1	0	0	\N	\N	77	-1	1
755	6	6	f	0	0	0	maxSourceSizeKBytes	\N	78	-1	1
756	6	6	f	0	0	0	System	\N	77	-1	1
756	6	6	f	0	0	0	runAs	\N	78	-1	1
757	1	1	t	0	0	0	\N	\N	77	-1	1
757	6	6	f	0	0	0	autoOrientation	\N	78	-1	1
758	6	6	f	0	0	0	image/png	\N	77	-1	1
758	6	6	f	0	0	0	mime-type	\N	78	-1	1
759	2	3	f	100	0	0	\N	\N	77	-1	1
759	6	6	f	0	0	0	ysize	\N	78	-1	1
760	15	6	f	0	0	0	{http://www.alfresco.org/model/content/1.0}thumbnail	\N	77	-1	1
760	6	6	f	0	0	0	rendition-nodetype	\N	78	-1	1
761	6	6	f	0	0	0	doclib	\N	77	-1	1
761	6	6	f	0	0	0	use	\N	78	-1	1
762	3	3	f	-1	0	0	\N	\N	77	-1	1
762	6	6	f	0	0	0	readLimitKBytes	\N	78	-1	1
763	2	3	f	100	0	0	\N	\N	77	-1	1
763	6	6	f	0	0	0	xsize	\N	78	-1	1
764	15	6	f	0	0	0	{http://www.alfresco.org/model/content/1.0}doclib	\N	77	-1	1
764	6	6	f	0	0	0	renderingActionName	\N	78	-1	1
765	6	6	f	0	0	0	alfresco/thumbnail/thumbnail_placeholder_doclib.png	\N	77	-1	1
765	6	6	f	0	0	0	placeHolderResourcePath	\N	78	-1	1
766	2	3	f	1	0	0	\N	\N	77	-1	1
766	6	6	f	0	0	0	pageLimit	\N	78	-1	1
767	3	3	f	-1	0	0	\N	\N	77	-1	1
767	6	6	f	0	0	0	timeoutMs	\N	78	-1	1
768	2	3	f	-1	0	0	\N	\N	77	-1	1
768	6	6	f	0	0	0	maxPages	\N	78	-1	1
769	1	1	f	0	0	0	\N	\N	77	-1	1
769	6	6	f	0	0	0	isAbsolute	\N	78	-1	1
770	1	1	t	0	0	0	\N	\N	77	-1	1
770	6	6	f	0	0	0	resizeToThumbnail	\N	78	-1	1
771	6	6	f	0	0	0		\N	77	-1	1
771	6	6	f	0	0	0	commandOptions	\N	78	-1	1
772	1	1	f	0	0	0	\N	\N	77	-1	1
772	6	6	f	0	0	0	allowEnlargement	\N	78	-1	1
773	1	1	t	0	0	0	\N	\N	77	-1	1
773	6	6	f	0	0	0	maintainAspectRatio	\N	78	-1	1
774	3	3	f	-1	0	0	\N	\N	77	-1	1
774	6	6	f	0	0	0	readLimitTimeMs	\N	78	-1	1
775	6	6	f	0	0	0	reformat	\N	70	-1	1
775	0	0	f	0	0	0	\N	\N	98	-1	1
775	0	0	f	0	0	0	\N	\N	99	-1	1
775	1	1	f	0	0	0	\N	\N	68	-1	1
775	0	0	f	0	0	0	\N	\N	100	-1	1
775	0	0	f	0	0	0	\N	\N	69	-1	1
775	6	6	f	0	0	0	New	\N	101	-1	1
775	0	0	f	0	0	0	\N	\N	71	-1	1
776	3	3	f	-1	0	0	\N	\N	77	-1	1
776	6	6	f	0	0	0	maxSourceSizeKBytes	\N	78	-1	1
777	2	3	f	-1	0	0	\N	\N	77	-1	1
777	6	6	f	0	0	0	pageLimit	\N	78	-1	1
778	6	6	f	0	0	0	application/pdf	\N	77	-1	1
778	6	6	f	0	0	0	mime-type	\N	78	-1	1
779	6	6	f	0	0	0	9	\N	77	-1	1
779	6	6	f	0	0	0	flashVersion	\N	78	-1	1
780	15	6	f	0	0	0	{http://www.alfresco.org/model/content/1.0}thumbnail	\N	77	-1	1
780	6	6	f	0	0	0	rendition-nodetype	\N	78	-1	1
781	3	3	f	-1	0	0	\N	\N	77	-1	1
781	6	6	f	0	0	0	timeoutMs	\N	78	-1	1
782	6	6	f	0	0	0	pdf	\N	77	-1	1
782	6	6	f	0	0	0	use	\N	78	-1	1
783	2	3	f	-1	0	0	\N	\N	77	-1	1
783	6	6	f	0	0	0	maxPages	\N	78	-1	1
784	3	3	f	-1	0	0	\N	\N	77	-1	1
784	6	6	f	0	0	0	readLimitKBytes	\N	78	-1	1
785	15	6	f	0	0	0	{http://www.alfresco.org/model/content/1.0}pdf	\N	77	-1	1
785	6	6	f	0	0	0	renderingActionName	\N	78	-1	1
786	3	3	f	-1	0	0	\N	\N	77	-1	1
786	6	6	f	0	0	0	readLimitTimeMs	\N	78	-1	1
787	6	6	f	0	0	0	imageRenderingEngine	\N	70	-1	1
787	0	0	f	0	0	0	\N	\N	98	-1	1
787	0	0	f	0	0	0	\N	\N	99	-1	1
787	1	1	f	0	0	0	\N	\N	68	-1	1
787	0	0	f	0	0	0	\N	\N	100	-1	1
787	0	0	f	0	0	0	\N	\N	69	-1	1
787	6	6	f	0	0	0	New	\N	101	-1	1
787	0	0	f	0	0	0	\N	\N	71	-1	1
788	3	3	f	-1	0	0	\N	\N	77	-1	1
788	6	6	f	0	0	0	maxSourceSizeKBytes	\N	78	-1	1
789	6	6	f	0	0	0	System	\N	77	-1	1
789	6	6	f	0	0	0	runAs	\N	78	-1	1
790	1	1	t	0	0	0	\N	\N	77	-1	1
790	6	6	f	0	0	0	autoOrientation	\N	78	-1	1
791	6	6	f	0	0	0	image/jpeg	\N	77	-1	1
791	6	6	f	0	0	0	mime-type	\N	78	-1	1
792	2	3	f	100	0	0	\N	\N	77	-1	1
792	6	6	f	0	0	0	ysize	\N	78	-1	1
793	15	6	f	0	0	0	{http://www.alfresco.org/model/content/1.0}thumbnail	\N	77	-1	1
793	6	6	f	0	0	0	rendition-nodetype	\N	78	-1	1
794	6	6	f	0	0	0	medium	\N	77	-1	1
794	6	6	f	0	0	0	use	\N	78	-1	1
795	3	3	f	-1	0	0	\N	\N	77	-1	1
795	6	6	f	0	0	0	readLimitKBytes	\N	78	-1	1
796	2	3	f	100	0	0	\N	\N	77	-1	1
796	6	6	f	0	0	0	xsize	\N	78	-1	1
797	15	6	f	0	0	0	{http://www.alfresco.org/model/content/1.0}medium	\N	77	-1	1
797	6	6	f	0	0	0	renderingActionName	\N	78	-1	1
798	6	6	f	0	0	0	alfresco/thumbnail/thumbnail_placeholder_medium.jpg	\N	77	-1	1
798	6	6	f	0	0	0	placeHolderResourcePath	\N	78	-1	1
799	2	3	f	1	0	0	\N	\N	77	-1	1
799	6	6	f	0	0	0	pageLimit	\N	78	-1	1
800	3	3	f	-1	0	0	\N	\N	77	-1	1
800	6	6	f	0	0	0	timeoutMs	\N	78	-1	1
801	2	3	f	-1	0	0	\N	\N	77	-1	1
801	6	6	f	0	0	0	maxPages	\N	78	-1	1
802	1	1	f	0	0	0	\N	\N	77	-1	1
802	6	6	f	0	0	0	isAbsolute	\N	78	-1	1
803	1	1	t	0	0	0	\N	\N	77	-1	1
803	6	6	f	0	0	0	resizeToThumbnail	\N	78	-1	1
804	6	6	f	0	0	0		\N	77	-1	1
804	6	6	f	0	0	0	commandOptions	\N	78	-1	1
805	1	1	t	0	0	0	\N	\N	77	-1	1
805	6	6	f	0	0	0	allowEnlargement	\N	78	-1	1
806	1	1	t	0	0	0	\N	\N	77	-1	1
806	6	6	f	0	0	0	maintainAspectRatio	\N	78	-1	1
807	3	3	f	-1	0	0	\N	\N	77	-1	1
807	6	6	f	0	0	0	readLimitTimeMs	\N	78	-1	1
808	6	6	f	0	0	0	imageRenderingEngine	\N	70	-1	1
808	0	0	f	0	0	0	\N	\N	98	-1	1
808	0	0	f	0	0	0	\N	\N	99	-1	1
808	1	1	f	0	0	0	\N	\N	68	-1	1
808	0	0	f	0	0	0	\N	\N	100	-1	1
808	0	0	f	0	0	0	\N	\N	69	-1	1
808	6	6	f	0	0	0	New	\N	101	-1	1
808	0	0	f	0	0	0	\N	\N	71	-1	1
809	3	3	f	-1	0	0	\N	\N	77	-1	1
809	6	6	f	0	0	0	maxSourceSizeKBytes	\N	78	-1	1
810	6	6	f	0	0	0	System	\N	77	-1	1
810	6	6	f	0	0	0	runAs	\N	78	-1	1
811	1	1	t	0	0	0	\N	\N	77	-1	1
811	6	6	f	0	0	0	autoOrientation	\N	78	-1	1
812	6	6	f	0	0	0	image/png	\N	77	-1	1
812	6	6	f	0	0	0	mime-type	\N	78	-1	1
813	2	3	f	64	0	0	\N	\N	77	-1	1
813	6	6	f	0	0	0	ysize	\N	78	-1	1
814	15	6	f	0	0	0	{http://www.alfresco.org/model/content/1.0}thumbnail	\N	77	-1	1
814	6	6	f	0	0	0	rendition-nodetype	\N	78	-1	1
815	6	6	f	0	0	0	avatar	\N	77	-1	1
815	6	6	f	0	0	0	use	\N	78	-1	1
816	3	3	f	-1	0	0	\N	\N	77	-1	1
816	6	6	f	0	0	0	readLimitKBytes	\N	78	-1	1
817	2	3	f	64	0	0	\N	\N	77	-1	1
817	6	6	f	0	0	0	xsize	\N	78	-1	1
818	15	6	f	0	0	0	{http://www.alfresco.org/model/content/1.0}avatar	\N	77	-1	1
818	6	6	f	0	0	0	renderingActionName	\N	78	-1	1
819	6	6	f	0	0	0	alfresco/thumbnail/thumbnail_placeholder_avatar.png	\N	77	-1	1
819	6	6	f	0	0	0	placeHolderResourcePath	\N	78	-1	1
820	2	3	f	1	0	0	\N	\N	77	-1	1
820	6	6	f	0	0	0	pageLimit	\N	78	-1	1
821	3	3	f	-1	0	0	\N	\N	77	-1	1
821	6	6	f	0	0	0	timeoutMs	\N	78	-1	1
822	2	3	f	-1	0	0	\N	\N	77	-1	1
822	6	6	f	0	0	0	maxPages	\N	78	-1	1
823	1	1	f	0	0	0	\N	\N	77	-1	1
823	6	6	f	0	0	0	isAbsolute	\N	78	-1	1
824	1	1	t	0	0	0	\N	\N	77	-1	1
824	6	6	f	0	0	0	resizeToThumbnail	\N	78	-1	1
825	6	6	f	0	0	0		\N	77	-1	1
825	6	6	f	0	0	0	commandOptions	\N	78	-1	1
826	1	1	f	0	0	0	\N	\N	77	-1	1
826	6	6	f	0	0	0	allowEnlargement	\N	78	-1	1
827	1	1	t	0	0	0	\N	\N	77	-1	1
827	6	6	f	0	0	0	maintainAspectRatio	\N	78	-1	1
828	3	3	f	-1	0	0	\N	\N	77	-1	1
828	6	6	f	0	0	0	readLimitTimeMs	\N	78	-1	1
829	6	6	f	0	0	0	reformat	\N	70	-1	1
829	0	0	f	0	0	0	\N	\N	98	-1	1
829	0	0	f	0	0	0	\N	\N	99	-1	1
829	1	1	f	0	0	0	\N	\N	68	-1	1
829	0	0	f	0	0	0	\N	\N	100	-1	1
829	0	0	f	0	0	0	\N	\N	69	-1	1
829	6	6	f	0	0	0	New	\N	101	-1	1
829	0	0	f	0	0	0	\N	\N	71	-1	1
830	3	3	f	-1	0	0	\N	\N	77	-1	1
830	6	6	f	0	0	0	maxSourceSizeKBytes	\N	78	-1	1
831	6	6	f	0	0	0	System	\N	77	-1	1
831	6	6	f	0	0	0	runAs	\N	78	-1	1
832	6	6	f	0	0	0	application/x-shockwave-flash	\N	77	-1	1
832	6	6	f	0	0	0	mime-type	\N	78	-1	1
833	15	6	f	0	0	0	{http://www.alfresco.org/model/content/1.0}thumbnail	\N	77	-1	1
833	6	6	f	0	0	0	rendition-nodetype	\N	78	-1	1
834	6	6	f	0	0	0	webpreview	\N	77	-1	1
834	6	6	f	0	0	0	use	\N	78	-1	1
835	3	3	f	-1	0	0	\N	\N	77	-1	1
835	6	6	f	0	0	0	readLimitKBytes	\N	78	-1	1
836	15	6	f	0	0	0	{http://www.alfresco.org/model/content/1.0}webpreview	\N	77	-1	1
836	6	6	f	0	0	0	renderingActionName	\N	78	-1	1
837	2	3	f	-1	0	0	\N	\N	77	-1	1
837	6	6	f	0	0	0	pageLimit	\N	78	-1	1
838	6	6	f	0	0	0	9	\N	77	-1	1
838	6	6	f	0	0	0	flashVersion	\N	78	-1	1
839	3	3	f	-1	0	0	\N	\N	77	-1	1
839	6	6	f	0	0	0	timeoutMs	\N	78	-1	1
840	2	3	f	-1	0	0	\N	\N	77	-1	1
840	6	6	f	0	0	0	maxPages	\N	78	-1	1
841	3	3	f	-1	0	0	\N	\N	77	-1	1
841	6	6	f	0	0	0	readLimitTimeMs	\N	78	-1	1
842	6	6	f	0	0	0	imageRenderingEngine	\N	70	-1	1
842	0	0	f	0	0	0	\N	\N	98	-1	1
842	0	0	f	0	0	0	\N	\N	99	-1	1
842	1	1	f	0	0	0	\N	\N	68	-1	1
842	0	0	f	0	0	0	\N	\N	100	-1	1
842	0	0	f	0	0	0	\N	\N	69	-1	1
842	6	6	f	0	0	0	New	\N	101	-1	1
842	0	0	f	0	0	0	\N	\N	71	-1	1
843	3	3	f	-1	0	0	\N	\N	77	-1	1
843	6	6	f	0	0	0	maxSourceSizeKBytes	\N	78	-1	1
844	6	6	f	0	0	0	System	\N	77	-1	1
844	6	6	f	0	0	0	runAs	\N	78	-1	1
845	1	1	t	0	0	0	\N	\N	77	-1	1
845	6	6	f	0	0	0	autoOrientation	\N	78	-1	1
846	6	6	f	0	0	0	image/png	\N	77	-1	1
846	6	6	f	0	0	0	mime-type	\N	78	-1	1
847	2	3	f	32	0	0	\N	\N	77	-1	1
847	6	6	f	0	0	0	ysize	\N	78	-1	1
848	15	6	f	0	0	0	{http://www.alfresco.org/model/content/1.0}thumbnail	\N	77	-1	1
848	6	6	f	0	0	0	rendition-nodetype	\N	78	-1	1
849	6	6	f	0	0	0	avatar32	\N	77	-1	1
849	6	6	f	0	0	0	use	\N	78	-1	1
850	3	3	f	-1	0	0	\N	\N	77	-1	1
850	6	6	f	0	0	0	readLimitKBytes	\N	78	-1	1
851	2	3	f	32	0	0	\N	\N	77	-1	1
851	6	6	f	0	0	0	xsize	\N	78	-1	1
852	15	6	f	0	0	0	{http://www.alfresco.org/model/content/1.0}avatar32	\N	77	-1	1
852	6	6	f	0	0	0	renderingActionName	\N	78	-1	1
853	6	6	f	0	0	0	alfresco/thumbnail/thumbnail_placeholder_avatar32.png	\N	77	-1	1
853	6	6	f	0	0	0	placeHolderResourcePath	\N	78	-1	1
854	2	3	f	1	0	0	\N	\N	77	-1	1
854	6	6	f	0	0	0	pageLimit	\N	78	-1	1
855	3	3	f	-1	0	0	\N	\N	77	-1	1
855	6	6	f	0	0	0	timeoutMs	\N	78	-1	1
856	2	3	f	-1	0	0	\N	\N	77	-1	1
856	6	6	f	0	0	0	maxPages	\N	78	-1	1
857	1	1	f	0	0	0	\N	\N	77	-1	1
857	6	6	f	0	0	0	isAbsolute	\N	78	-1	1
858	1	1	t	0	0	0	\N	\N	77	-1	1
858	6	6	f	0	0	0	resizeToThumbnail	\N	78	-1	1
859	6	6	f	0	0	0		\N	77	-1	1
859	6	6	f	0	0	0	commandOptions	\N	78	-1	1
860	1	1	f	0	0	0	\N	\N	77	-1	1
860	6	6	f	0	0	0	allowEnlargement	\N	78	-1	1
861	1	1	t	0	0	0	\N	\N	77	-1	1
861	6	6	f	0	0	0	maintainAspectRatio	\N	78	-1	1
862	3	3	f	-1	0	0	\N	\N	77	-1	1
862	6	6	f	0	0	0	readLimitTimeMs	\N	78	-1	1
863	1	1	t	0	0	0	\N	\N	86	-1	1
863	1	1	f	0	0	0	\N	\N	87	-1	1
863	6	6	f	0	0	0	Solr Facets Space	\N	26	-1	1
863	6	6	f	0	0	0	Root folder for the Solr Facet properties\n         	\N	27	-1	2
863	6	6	f	0	0	0	Solr Facets Space	\N	28	-1	2
863	6	6	f	0	0	0	filter_mimetype	\N	231	1	1
863	6	6	f	0	0	0	filter_created	\N	231	2	1
863	6	6	f	0	0	0	filter_content_size	\N	231	3	1
863	6	6	f	0	0	0	filter_modifier	\N	231	4	1
863	6	6	f	0	0	0	filter_modified	\N	231	5	1
863	6	6	f	0	0	0	filter_creator	\N	231	0	1
864	6	6	f	0	0	0	components	\N	26	-1	1
864	1	1	f	0	0	0	\N	\N	86	-1	1
864	1	1	f	0	0	0	\N	\N	87	-1	1
864	6	6	f	0	0	0	admin	\N	40	-1	1
865	6	6	f	0	0	0	page.title.user~admin~dashboard.xml	\N	26	-1	1
865	6	6	f	0	0	0	admin	\N	40	-1	1
865	1	1	t	0	0	0	\N	\N	86	-1	1
865	1	1	f	0	0	0	\N	\N	87	-1	1
866	6	6	f	0	0	0	page.full-width-dashlet.user~admin~dashboard.xml	\N	26	-1	1
866	6	6	f	0	0	0	admin	\N	40	-1	1
866	1	1	t	0	0	0	\N	\N	86	-1	1
866	1	1	f	0	0	0	\N	\N	87	-1	1
867	6	6	f	0	0	0	page.component-1-1.user~admin~dashboard.xml	\N	26	-1	1
867	6	6	f	0	0	0	admin	\N	40	-1	1
867	1	1	t	0	0	0	\N	\N	86	-1	1
867	1	1	f	0	0	0	\N	\N	87	-1	1
868	6	6	f	0	0	0	page.component-1-2.user~admin~dashboard.xml	\N	26	-1	1
868	6	6	f	0	0	0	admin	\N	40	-1	1
868	1	1	t	0	0	0	\N	\N	86	-1	1
868	1	1	f	0	0	0	\N	\N	87	-1	1
869	6	6	f	0	0	0	page.component-2-1.user~admin~dashboard.xml	\N	26	-1	1
869	6	6	f	0	0	0	admin	\N	40	-1	1
869	1	1	t	0	0	0	\N	\N	86	-1	1
869	1	1	f	0	0	0	\N	\N	87	-1	1
870	6	6	f	0	0	0	page.component-2-2.user~admin~dashboard.xml	\N	26	-1	1
870	6	6	f	0	0	0	admin	\N	40	-1	1
870	1	1	t	0	0	0	\N	\N	86	-1	1
870	1	1	f	0	0	0	\N	\N	87	-1	1
871	6	6	f	0	0	0	pages	\N	26	-1	1
871	1	1	f	0	0	0	\N	\N	86	-1	1
871	1	1	f	0	0	0	\N	\N	87	-1	1
872	6	6	f	0	0	0	user	\N	26	-1	1
872	1	1	f	0	0	0	\N	\N	86	-1	1
872	1	1	f	0	0	0	\N	\N	87	-1	1
873	6	6	f	0	0	0	admin	\N	26	-1	1
873	1	1	f	0	0	0	\N	\N	86	-1	1
873	1	1	f	0	0	0	\N	\N	87	-1	1
871	6	6	f	0	0	0	admin	\N	40	-1	1
872	6	6	f	0	0	0	admin	\N	40	-1	1
873	6	6	f	0	0	0	admin	\N	40	-1	1
874	6	6	f	0	0	0	dashboard.xml	\N	26	-1	1
874	6	6	f	0	0	0	admin	\N	40	-1	1
874	1	1	t	0	0	0	\N	\N	86	-1	1
874	1	1	f	0	0	0	\N	\N	87	-1	1
865	21	3	f	250	0	0	\N	\N	51	-1	1
866	21	3	f	251	0	0	\N	\N	51	-1	1
867	21	3	f	252	0	0	\N	\N	51	-1	1
868	21	3	f	253	0	0	\N	\N	51	-1	1
869	21	3	f	254	0	0	\N	\N	51	-1	1
870	21	3	f	255	0	0	\N	\N	51	-1	1
874	21	3	f	256	0	0	\N	\N	51	-1	1
875	6	6	f	0	0	0	avattar-alfresco	\N	26	-1	1
875	6	6	f	0	0	0	Sitio de prueba de Avattar Alfresco	\N	27	-1	3
875	6	6	f	0	0	0	PUBLIC	\N	108	-1	1
875	6	6	f	0	0	0	avattar-alfresco	\N	28	-1	3
875	6	6	f	0	0	0	site-dashboard	\N	109	-1	1
876	6	6	f	0	0	0	site_avattar-alfresco	\N	113	-1	1
876	6	6	f	0	0	0	72ee4f33070dca0fd01f878c04c2e572	\N	26	-1	1
876	6	6	f	0	0	0	GROUP_site_avattar-alfresco	\N	90	-1	1
877	6	6	f	0	0	0	site_avattar-alfresco_SiteManager	\N	113	-1	1
877	6	6	f	0	0	0	9cad04baf51f3ba1325c95b1c29e2f70	\N	26	-1	1
877	6	6	f	0	0	0	GROUP_site_avattar-alfresco_SiteManager	\N	90	-1	1
877	3	3	f	1372022528	0	0	\N	\N	94	-1	1
877	3	3	f	19	0	0	\N	\N	96	-1	1
878	6	6	f	0	0	0	site_avattar-alfresco_SiteCollaborator	\N	113	-1	1
878	6	6	f	0	0	0	3371721f4bd5c451d330c7ba3105cb4d	\N	26	-1	1
878	6	6	f	0	0	0	GROUP_site_avattar-alfresco_SiteCollaborator	\N	90	-1	1
878	3	3	f	3461946976	0	0	\N	\N	94	-1	1
878	3	3	f	19	0	0	\N	\N	96	-1	1
879	6	6	f	0	0	0	site_avattar-alfresco_SiteContributor	\N	113	-1	1
879	6	6	f	0	0	0	25088bcde5dcead03a271a0e8892b092	\N	26	-1	1
879	6	6	f	0	0	0	GROUP_site_avattar-alfresco_SiteContributor	\N	90	-1	1
879	3	3	f	2554387749	0	0	\N	\N	94	-1	1
879	3	3	f	19	0	0	\N	\N	96	-1	1
880	6	6	f	0	0	0	site_avattar-alfresco_SiteConsumer	\N	113	-1	1
880	6	6	f	0	0	0	50773562cc2f6ef0cd77a94a2a131609	\N	26	-1	1
880	6	6	f	0	0	0	GROUP_site_avattar-alfresco_SiteConsumer	\N	90	-1	1
880	3	3	f	2528774496	0	0	\N	\N	94	-1	1
880	3	3	f	19	0	0	\N	\N	96	-1	1
32	3	3	f	1940747137	0	0	\N	\N	94	-1	1
32	3	3	f	19	0	0	\N	\N	96	-1	1
881	6	6	f	0	0	0	surf-config	\N	26	-1	1
881	2	3	f	0	0	0	\N	\N	82	-1	1
881	1	1	f	0	0	0	\N	\N	83	-1	1
881	1	1	f	0	0	0	\N	\N	84	-1	1
881	1	1	f	0	0	0	\N	\N	223	-1	1
881	1	1	f	0	0	0	\N	\N	86	-1	1
881	1	1	f	0	0	0	\N	\N	87	-1	1
881	6	6	f	0	0	0	admin	\N	40	-1	1
882	6	6	f	0	0	0	components	\N	26	-1	1
882	1	1	f	0	0	0	\N	\N	86	-1	1
882	1	1	f	0	0	0	\N	\N	87	-1	1
882	6	6	f	0	0	0	admin	\N	40	-1	1
883	6	6	f	0	0	0	page.title.site~avattar-alfresco~dashboard.xml	\N	26	-1	1
883	6	6	f	0	0	0	admin	\N	40	-1	1
883	1	1	t	0	0	0	\N	\N	86	-1	1
883	1	1	f	0	0	0	\N	\N	87	-1	1
883	21	3	f	257	0	0	\N	\N	51	-1	1
884	6	6	f	0	0	0	page.navigation.site~avattar-alfresco~dashboard.xml	\N	26	-1	1
884	6	6	f	0	0	0	admin	\N	40	-1	1
884	1	1	t	0	0	0	\N	\N	86	-1	1
884	1	1	f	0	0	0	\N	\N	87	-1	1
884	21	3	f	258	0	0	\N	\N	51	-1	1
885	6	6	f	0	0	0	page.component-1-1.site~avattar-alfresco~dashboard.xml	\N	26	-1	1
885	6	6	f	0	0	0	admin	\N	40	-1	1
885	1	1	t	0	0	0	\N	\N	86	-1	1
885	1	1	f	0	0	0	\N	\N	87	-1	1
885	21	3	f	259	0	0	\N	\N	51	-1	1
886	6	6	f	0	0	0	page.component-2-1.site~avattar-alfresco~dashboard.xml	\N	26	-1	1
886	6	6	f	0	0	0	admin	\N	40	-1	1
886	1	1	t	0	0	0	\N	\N	86	-1	1
886	1	1	f	0	0	0	\N	\N	87	-1	1
886	21	3	f	260	0	0	\N	\N	51	-1	1
887	6	6	f	0	0	0	page.component-2-2.site~avattar-alfresco~dashboard.xml	\N	26	-1	1
887	6	6	f	0	0	0	admin	\N	40	-1	1
887	1	1	t	0	0	0	\N	\N	86	-1	1
887	1	1	f	0	0	0	\N	\N	87	-1	1
887	21	3	f	261	0	0	\N	\N	51	-1	1
888	6	6	f	0	0	0	pages	\N	26	-1	1
888	1	1	f	0	0	0	\N	\N	86	-1	1
888	1	1	f	0	0	0	\N	\N	87	-1	1
889	6	6	f	0	0	0	site	\N	26	-1	1
889	1	1	f	0	0	0	\N	\N	86	-1	1
889	1	1	f	0	0	0	\N	\N	87	-1	1
890	6	6	f	0	0	0	avattar-alfresco	\N	26	-1	1
890	1	1	f	0	0	0	\N	\N	86	-1	1
890	1	1	f	0	0	0	\N	\N	87	-1	1
888	6	6	f	0	0	0	admin	\N	40	-1	1
889	6	6	f	0	0	0	admin	\N	40	-1	1
890	6	6	f	0	0	0	admin	\N	40	-1	1
891	6	6	f	0	0	0	dashboard.xml	\N	26	-1	1
891	6	6	f	0	0	0	admin	\N	40	-1	1
891	1	1	t	0	0	0	\N	\N	86	-1	1
891	1	1	f	0	0	0	\N	\N	87	-1	1
891	21	3	f	262	0	0	\N	\N	51	-1	1
892	6	6	f	0	0	0	documentLibrary	\N	26	-1	1
892	6	6	f	0	0	0	documentLibrary	\N	153	-1	1
892	6	6	f	0	0	0	admin	\N	40	-1	1
892	6	6	f	0	0	0	Document Library	\N	27	-1	3
32	21	3	f	266	0	0	\N	\N	136	-1	1
893	6	6	f	0	0	0	Avattar	\N	26	-1	1
893	6	6	f	0	0	0		\N	27	-1	3
893	6	6	f	0	0	0		\N	28	-1	3
894	6	6	f	0	0	0	doclib:1642632464231	\N	139	0	1
900	6	6	f	0	0	0	COMPU-06.png	\N	26	-1	1
900	21	3	f	273	0	0	\N	\N	51	-1	1
900	2	3	f	1440	0	0	\N	\N	185	-1	1
900	2	3	f	1692	0	0	\N	\N	192	-1	1
900	1	1	f	0	0	0	\N	\N	156	-1	1
900	1	1	t	0	0	0	\N	\N	159	-1	1
900	1	1	t	0	0	0	\N	\N	160	-1	1
901	6	6	f	0	0	0	cecbc25a-5e1f-4beb-ac58-7e21bbe7e804	\N	26	-1	1
901	6	6	f	0	0	0	cecbc25a-5e1f-4beb-ac58-7e21bbe7e804	\N	166	-1	1
902	6	6	f	0	0	0	COMPU-06.png	\N	26	-1	1
902	21	3	f	274	0	0	\N	\N	51	-1	1
902	12	6	f	0	0	0	workspace://SpacesStore/cecbc25a-5e1f-4beb-ac58-7e21bbe7e804	\N	168	-1	1
902	0	0	f	0	0	0	\N	\N	169	-1	1
902	6	6	f	0	0	0	1.0	\N	170	-1	1
902	3	3	f	900	0	0	\N	\N	171	-1	1
902	9	9	f	0	0	0	\N	\\xaced00057e72002c6f72672e616c66726573636f2e736572766963652e636d722e76657273696f6e2e56657273696f6e5479706500000000000000001200007872000e6a6176612e6c616e672e456e756d000000000000000012000078707400054d414a4f52	232	-1	1
902	1	1	f	0	0	0	\N	\N	156	-1	1
902	0	0	f	0	0	0	\N	\N	172	-1	1
902	0	0	f	0	0	0	\N	\N	158	-1	1
902	1	1	t	0	0	0	\N	\N	159	-1	1
902	1	1	t	0	0	0	\N	\N	160	-1	1
902	0	0	f	0	0	0	\N	\N	27	-1	2
902	0	0	f	0	0	0	\N	\N	28	-1	2
902	6	6	f	0	0	0	admin	\N	173	-1	1
902	7	6	f	0	0	0	2022-01-19T22:47:49.755Z	\N	174	-1	1
902	6	6	f	0	0	0	admin	\N	175	-1	1
902	7	6	f	0	0	0	2022-01-19T22:47:49.755Z	\N	176	-1	1
902	0	0	f	0	0	0	\N	\N	177	-1	1
902	0	0	f	0	0	0	\N	\N	54	-1	1
902	0	0	f	0	0	0	\N	\N	193	-1	1
902	0	0	f	0	0	0	\N	\N	179	-1	1
902	0	0	f	0	0	0	\N	\N	180	-1	1
902	0	0	f	0	0	0	\N	\N	181	-1	1
902	0	0	f	0	0	0	\N	\N	182	-1	1
902	0	0	f	0	0	0	\N	\N	183	-1	1
902	0	0	f	0	0	0	\N	\N	184	-1	1
902	2	3	f	1440	0	0	\N	\N	185	-1	1
902	0	0	f	0	0	0	\N	\N	186	-1	1
902	0	0	f	0	0	0	\N	\N	187	-1	1
902	0	0	f	0	0	0	\N	\N	188	-1	1
902	0	0	f	0	0	0	\N	\N	189	-1	1
902	0	0	f	0	0	0	\N	\N	190	-1	1
902	0	0	f	0	0	0	\N	\N	191	-1	1
902	2	3	f	1692	0	0	\N	\N	192	-1	1
900	6	6	f	0	0	0	1.0	\N	158	-1	1
900	6	6	f	0	0	0	MAJOR	\N	172	-1	1
903	6	6	f	0	0	0	ICONO-06.png	\N	26	-1	1
903	21	3	f	276	0	0	\N	\N	51	-1	1
903	2	3	f	1440	0	0	\N	\N	185	-1	1
903	2	3	f	1547	0	0	\N	\N	192	-1	1
903	1	1	f	0	0	0	\N	\N	156	-1	1
903	1	1	t	0	0	0	\N	\N	159	-1	1
903	1	1	t	0	0	0	\N	\N	160	-1	1
904	6	6	f	0	0	0	d2882da6-dbad-4e4a-80f5-ef8380f6f526	\N	26	-1	1
904	6	6	f	0	0	0	d2882da6-dbad-4e4a-80f5-ef8380f6f526	\N	166	-1	1
905	6	6	f	0	0	0	ICONO-06.png	\N	26	-1	1
905	21	3	f	277	0	0	\N	\N	51	-1	1
894	6	6	f	0	0	0	AVTR.html	\N	26	-1	1
894	21	3	f	268	0	0	\N	\N	51	-1	1
894	6	6	f	0	0	0	Somos consultores apasionados por la tecnologÃ­a enfocados en potenciar DevOps, Seguridad, ITOM y AnalÃ­tica. Utiliza nuestras mejores prÃ¡cticas y lo Ãºltimo en tecnologÃ­a para liberar el potencial del negocio.	\N	27	-1	2
894	6	6	f	0	0	0	AVTR	\N	28	-1	2
894	1	1	f	0	0	0	\N	\N	156	-1	1
894	1	1	t	0	0	0	\N	\N	159	-1	1
894	1	1	t	0	0	0	\N	\N	160	-1	1
895	6	6	f	0	0	0	e0a2499a-8217-439d-b0c1-9eb385bebefe	\N	26	-1	1
895	6	6	f	0	0	0	e0a2499a-8217-439d-b0c1-9eb385bebefe	\N	166	-1	1
896	6	6	f	0	0	0	AVTR.html	\N	26	-1	1
896	21	3	f	269	0	0	\N	\N	51	-1	1
896	12	6	f	0	0	0	workspace://SpacesStore/e0a2499a-8217-439d-b0c1-9eb385bebefe	\N	168	-1	1
896	0	0	f	0	0	0	\N	\N	169	-1	1
896	6	6	f	0	0	0	1.0	\N	170	-1	1
896	3	3	f	894	0	0	\N	\N	171	-1	1
896	9	9	f	0	0	0	\N	\\xaced00057e72002c6f72672e616c66726573636f2e736572766963652e636d722e76657273696f6e2e56657273696f6e5479706500000000000000001200007872000e6a6176612e6c616e672e456e756d000000000000000012000078707400054d414a4f52	232	-1	1
896	1	1	f	0	0	0	\N	\N	156	-1	1
896	0	0	f	0	0	0	\N	\N	172	-1	1
896	0	0	f	0	0	0	\N	\N	158	-1	1
896	1	1	t	0	0	0	\N	\N	159	-1	1
896	1	1	t	0	0	0	\N	\N	160	-1	1
896	6	6	f	0	0	0	Somos consultores apasionados por la tecnologÃ­a enfocados en potenciar DevOps, Seguridad, ITOM y AnalÃ­tica. Utiliza nuestras mejores prÃ¡cticas y lo Ãºltimo en tecnologÃ­a para liberar el potencial del negocio.	\N	27	-1	2
896	6	6	f	0	0	0	AVTR	\N	28	-1	2
896	6	6	f	0	0	0	admin	\N	173	-1	1
896	7	6	f	0	0	0	2022-01-19T22:47:40.112Z	\N	174	-1	1
896	6	6	f	0	0	0	admin	\N	175	-1	1
896	7	6	f	0	0	0	2022-01-19T22:47:40.112Z	\N	176	-1	1
896	0	0	f	0	0	0	\N	\N	177	-1	1
894	6	6	f	0	0	0	1.0	\N	158	-1	1
894	6	6	f	0	0	0	MAJOR	\N	172	-1	1
898	1	1	t	0	0	0	\N	\N	86	-1	1
898	1	1	f	0	0	0	\N	\N	87	-1	1
898	6	6	f	0	0	0	doclib	\N	26	-1	1
898	21	3	f	271	0	0	\N	\N	51	-1	1
898	15	6	f	0	0	0	{http://www.alfresco.org/model/content/1.0}content	\N	144	-1	1
899	3	3	f	897	0	0	\N	\N	150	-1	1
898	6	6	f	0	0	0	doclib	\N	145	-1	1
905	12	6	f	0	0	0	workspace://SpacesStore/d2882da6-dbad-4e4a-80f5-ef8380f6f526	\N	168	-1	1
905	0	0	f	0	0	0	\N	\N	169	-1	1
905	6	6	f	0	0	0	1.0	\N	170	-1	1
905	3	3	f	903	0	0	\N	\N	171	-1	1
905	9	9	f	0	0	0	\N	\\xaced00057e72002c6f72672e616c66726573636f2e736572766963652e636d722e76657273696f6e2e56657273696f6e5479706500000000000000001200007872000e6a6176612e6c616e672e456e756d000000000000000012000078707400054d414a4f52	232	-1	1
905	1	1	f	0	0	0	\N	\N	156	-1	1
905	0	0	f	0	0	0	\N	\N	172	-1	1
905	0	0	f	0	0	0	\N	\N	158	-1	1
905	1	1	t	0	0	0	\N	\N	159	-1	1
905	1	1	t	0	0	0	\N	\N	160	-1	1
905	0	0	f	0	0	0	\N	\N	27	-1	2
905	0	0	f	0	0	0	\N	\N	28	-1	2
905	6	6	f	0	0	0	admin	\N	173	-1	1
905	7	6	f	0	0	0	2022-01-19T22:47:50.188Z	\N	174	-1	1
905	6	6	f	0	0	0	admin	\N	175	-1	1
905	7	6	f	0	0	0	2022-01-19T22:47:50.188Z	\N	176	-1	1
905	0	0	f	0	0	0	\N	\N	177	-1	1
905	0	0	f	0	0	0	\N	\N	54	-1	1
905	0	0	f	0	0	0	\N	\N	193	-1	1
905	0	0	f	0	0	0	\N	\N	179	-1	1
905	0	0	f	0	0	0	\N	\N	180	-1	1
905	0	0	f	0	0	0	\N	\N	181	-1	1
905	0	0	f	0	0	0	\N	\N	182	-1	1
905	0	0	f	0	0	0	\N	\N	183	-1	1
905	0	0	f	0	0	0	\N	\N	184	-1	1
905	2	3	f	1440	0	0	\N	\N	185	-1	1
905	0	0	f	0	0	0	\N	\N	186	-1	1
905	0	0	f	0	0	0	\N	\N	187	-1	1
905	0	0	f	0	0	0	\N	\N	188	-1	1
905	0	0	f	0	0	0	\N	\N	189	-1	1
905	0	0	f	0	0	0	\N	\N	190	-1	1
905	0	0	f	0	0	0	\N	\N	191	-1	1
905	2	3	f	1547	0	0	\N	\N	192	-1	1
903	6	6	f	0	0	0	1.0	\N	158	-1	1
903	6	6	f	0	0	0	MAJOR	\N	172	-1	1
906	6	6	f	0	0	0	logo-avtr.png	\N	26	-1	1
906	21	3	f	279	0	0	\N	\N	51	-1	1
906	2	3	f	43	0	0	\N	\N	185	-1	1
906	2	3	f	117	0	0	\N	\N	192	-1	1
906	1	1	f	0	0	0	\N	\N	156	-1	1
906	1	1	t	0	0	0	\N	\N	159	-1	1
906	1	1	t	0	0	0	\N	\N	160	-1	1
907	6	6	f	0	0	0	053777c9-5ebf-402f-aeff-7e405d3c76dd	\N	26	-1	1
907	6	6	f	0	0	0	053777c9-5ebf-402f-aeff-7e405d3c76dd	\N	166	-1	1
908	6	6	f	0	0	0	logo-avtr.png	\N	26	-1	1
908	21	3	f	280	0	0	\N	\N	51	-1	1
908	12	6	f	0	0	0	workspace://SpacesStore/053777c9-5ebf-402f-aeff-7e405d3c76dd	\N	168	-1	1
908	0	0	f	0	0	0	\N	\N	169	-1	1
908	6	6	f	0	0	0	1.0	\N	170	-1	1
908	3	3	f	906	0	0	\N	\N	171	-1	1
908	9	9	f	0	0	0	\N	\\xaced00057e72002c6f72672e616c66726573636f2e736572766963652e636d722e76657273696f6e2e56657273696f6e5479706500000000000000001200007872000e6a6176612e6c616e672e456e756d000000000000000012000078707400054d414a4f52	232	-1	1
908	1	1	f	0	0	0	\N	\N	156	-1	1
908	0	0	f	0	0	0	\N	\N	172	-1	1
908	0	0	f	0	0	0	\N	\N	158	-1	1
908	1	1	t	0	0	0	\N	\N	159	-1	1
908	1	1	t	0	0	0	\N	\N	160	-1	1
908	0	0	f	0	0	0	\N	\N	27	-1	2
908	0	0	f	0	0	0	\N	\N	28	-1	2
908	6	6	f	0	0	0	admin	\N	173	-1	1
908	7	6	f	0	0	0	2022-01-19T22:47:50.410Z	\N	174	-1	1
908	6	6	f	0	0	0	admin	\N	175	-1	1
908	7	6	f	0	0	0	2022-01-19T22:47:50.410Z	\N	176	-1	1
908	0	0	f	0	0	0	\N	\N	177	-1	1
908	0	0	f	0	0	0	\N	\N	54	-1	1
908	0	0	f	0	0	0	\N	\N	193	-1	1
908	0	0	f	0	0	0	\N	\N	179	-1	1
908	0	0	f	0	0	0	\N	\N	180	-1	1
908	0	0	f	0	0	0	\N	\N	181	-1	1
908	0	0	f	0	0	0	\N	\N	182	-1	1
908	0	0	f	0	0	0	\N	\N	183	-1	1
908	0	0	f	0	0	0	\N	\N	184	-1	1
908	2	3	f	43	0	0	\N	\N	185	-1	1
908	0	0	f	0	0	0	\N	\N	186	-1	1
908	0	0	f	0	0	0	\N	\N	187	-1	1
908	0	0	f	0	0	0	\N	\N	188	-1	1
908	0	0	f	0	0	0	\N	\N	189	-1	1
908	0	0	f	0	0	0	\N	\N	190	-1	1
908	0	0	f	0	0	0	\N	\N	191	-1	1
908	2	3	f	117	0	0	\N	\N	192	-1	1
906	6	6	f	0	0	0	1.0	\N	158	-1	1
906	6	6	f	0	0	0	MAJOR	\N	172	-1	1
909	6	6	f	0	0	0	ROBOT-06.png	\N	26	-1	1
909	21	3	f	282	0	0	\N	\N	51	-1	1
909	2	3	f	1440	0	0	\N	\N	185	-1	1
909	2	3	f	1863	0	0	\N	\N	192	-1	1
909	1	1	f	0	0	0	\N	\N	156	-1	1
909	1	1	t	0	0	0	\N	\N	159	-1	1
909	1	1	t	0	0	0	\N	\N	160	-1	1
910	6	6	f	0	0	0	89c2308b-2ecc-46f2-8995-f851fa91039f	\N	26	-1	1
910	6	6	f	0	0	0	89c2308b-2ecc-46f2-8995-f851fa91039f	\N	166	-1	1
911	6	6	f	0	0	0	ROBOT-06.png	\N	26	-1	1
911	21	3	f	283	0	0	\N	\N	51	-1	1
911	12	6	f	0	0	0	workspace://SpacesStore/89c2308b-2ecc-46f2-8995-f851fa91039f	\N	168	-1	1
911	0	0	f	0	0	0	\N	\N	169	-1	1
911	6	6	f	0	0	0	1.0	\N	170	-1	1
911	3	3	f	909	0	0	\N	\N	171	-1	1
911	9	9	f	0	0	0	\N	\\xaced00057e72002c6f72672e616c66726573636f2e736572766963652e636d722e76657273696f6e2e56657273696f6e5479706500000000000000001200007872000e6a6176612e6c616e672e456e756d000000000000000012000078707400054d414a4f52	232	-1	1
911	1	1	f	0	0	0	\N	\N	156	-1	1
911	0	0	f	0	0	0	\N	\N	172	-1	1
911	0	0	f	0	0	0	\N	\N	158	-1	1
911	1	1	t	0	0	0	\N	\N	159	-1	1
911	1	1	t	0	0	0	\N	\N	160	-1	1
911	0	0	f	0	0	0	\N	\N	27	-1	2
911	0	0	f	0	0	0	\N	\N	28	-1	2
911	6	6	f	0	0	0	admin	\N	173	-1	1
911	7	6	f	0	0	0	2022-01-19T22:47:50.642Z	\N	174	-1	1
911	6	6	f	0	0	0	admin	\N	175	-1	1
911	7	6	f	0	0	0	2022-01-19T22:47:50.642Z	\N	176	-1	1
911	0	0	f	0	0	0	\N	\N	177	-1	1
911	0	0	f	0	0	0	\N	\N	54	-1	1
911	0	0	f	0	0	0	\N	\N	193	-1	1
911	0	0	f	0	0	0	\N	\N	179	-1	1
911	0	0	f	0	0	0	\N	\N	180	-1	1
911	0	0	f	0	0	0	\N	\N	181	-1	1
911	0	0	f	0	0	0	\N	\N	182	-1	1
911	0	0	f	0	0	0	\N	\N	183	-1	1
911	0	0	f	0	0	0	\N	\N	184	-1	1
911	2	3	f	1440	0	0	\N	\N	185	-1	1
911	0	0	f	0	0	0	\N	\N	186	-1	1
911	0	0	f	0	0	0	\N	\N	187	-1	1
911	0	0	f	0	0	0	\N	\N	188	-1	1
911	0	0	f	0	0	0	\N	\N	189	-1	1
911	0	0	f	0	0	0	\N	\N	190	-1	1
911	0	0	f	0	0	0	\N	\N	191	-1	1
911	2	3	f	1863	0	0	\N	\N	192	-1	1
909	6	6	f	0	0	0	1.0	\N	158	-1	1
909	6	6	f	0	0	0	MAJOR	\N	172	-1	1
\.


--
-- Name: alf_node_seq; Type: SEQUENCE SET; Schema: public; Owner: alfresco
--

SELECT pg_catalog.setval('alf_node_seq', 911, true);


--
-- Data for Name: alf_permission; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY alf_permission (id, version, type_qname_id, name) FROM stdin;
1	0	21	All
2	0	32	Consumer
3	0	32	Contributor
4	0	34	Read
5	0	32	Collaborator
6	0	34	AddChildren
7	0	34	FullControl
8	0	107	SiteManager
9	0	107	SiteCollaborator
10	0	107	SiteContributor
11	0	107	SiteConsumer
12	0	34	ReadPermissions
\.


--
-- Name: alf_permission_seq; Type: SEQUENCE SET; Schema: public; Owner: alfresco
--

SELECT pg_catalog.setval('alf_permission_seq', 12, true);


--
-- Data for Name: alf_prop_class; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY alf_prop_class (id, java_class_name, java_class_name_short, java_class_name_crc) FROM stdin;
1	java.lang.String	java.lang.string	2004016611
2	java.lang.Object	java.lang.object	1096926374
3	org.alfresco.util.Pair	org.alfresco.util.pair	1801692418
4	java.util.HashSet	java.util.hashset	1058840703
5	java.lang.Long	java.lang.long	4227064769
\.


--
-- Name: alf_prop_class_seq; Type: SEQUENCE SET; Schema: public; Owner: alfresco
--

SELECT pg_catalog.setval('alf_prop_class_seq', 5, true);


--
-- Data for Name: alf_prop_date_value; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY alf_prop_date_value (date_value, full_year, half_of_year, quarter_of_year, month_of_year, week_of_year, week_of_month, day_of_year, day_of_month, day_of_week) FROM stdin;
\.


--
-- Data for Name: alf_prop_double_value; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY alf_prop_double_value (id, double_value) FROM stdin;
\.


--
-- Name: alf_prop_double_value_seq; Type: SEQUENCE SET; Schema: public; Owner: alfresco
--

SELECT pg_catalog.setval('alf_prop_double_value_seq', 1, false);


--
-- Data for Name: alf_prop_link; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY alf_prop_link (root_prop_id, prop_index, contained_in, key_prop_id, value_prop_id) FROM stdin;
1	0	0	4	4
2	0	0	6	6
3	0	0	9	9
4	0	0	11	11
5	0	0	13	13
6	0	0	15	15
7	0	0	18	18
8	0	0	19	19
9	0	0	20	20
10	0	0	21	21
11	0	0	11	11
12	0	0	13	13
13	0	0	15	15
14	0	0	18	18
15	0	0	19	19
16	0	0	22	22
17	0	0	23	23
18	0	0	11	11
19	0	0	13	13
20	0	0	15	15
21	0	0	18	18
22	0	0	19	19
23	0	0	24	24
24	0	0	25	25
25	0	0	11	11
26	0	0	13	13
27	0	0	15	15
28	0	0	18	18
29	0	0	19	19
30	0	0	26	26
31	0	0	27	27
32	0	0	11	11
33	0	0	13	13
34	0	0	15	15
35	0	0	18	18
36	0	0	19	19
37	0	0	28	28
\.


--
-- Data for Name: alf_prop_root; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY alf_prop_root (id, version) FROM stdin;
1	0
2	0
3	0
4	0
5	0
6	0
7	0
8	0
9	0
10	0
11	0
12	0
13	0
14	0
15	0
16	0
17	0
18	0
19	0
20	0
21	0
22	0
23	0
24	0
25	0
26	0
27	0
28	0
29	0
30	0
31	0
32	0
33	0
34	0
35	0
36	0
37	0
\.


--
-- Name: alf_prop_root_seq; Type: SEQUENCE SET; Schema: public; Owner: alfresco
--

SELECT pg_catalog.setval('alf_prop_root_seq', 37, true);


--
-- Data for Name: alf_prop_serializable_value; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY alf_prop_serializable_value (id, serializable_value) FROM stdin;
1	\\xaced0005737200166f72672e616c66726573636f2e7574696c2e506169729937b84d08eece6c0200024c000566697273747400124c6a6176612f6c616e672f4f626a6563743b4c00067365636f6e6471007e0001787074002461613036353634322d356561612d343039312d393464332d393133313937306134623536737200196a617661782e63727970746f2e5365616c65644f626a6563743e363da6c3b754700200045b000d656e636f646564506172616d737400025b425b0010656e63727970746564436f6e74656e7471007e00054c0009706172616d73416c677400124c6a6176612f6c616e672f537472696e673b4c00077365616c416c6771007e00067870757200025b42acf317f8060854e002000078700000000a04080ab6e197d1c719f37571007e000800000030584bfba4040d12a0c480de34678dd7a9a66769d75e57f2491fe828a4d5e8c7d4012112b2697684904a0785fec1f854d37400064445536564657400174445536564652f4342432f504b43533550616464696e67
\.


--
-- Name: alf_prop_serializable_value_seq; Type: SEQUENCE SET; Schema: public; Owner: alfresco
--

SELECT pg_catalog.setval('alf_prop_serializable_value_seq', 1, true);


--
-- Data for Name: alf_prop_string_value; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY alf_prop_string_value (id, string_value, string_end_lower, string_crc) FROM stdin;
1	keyCheck	keycheck	644688069
2	metadata	metadata	1326724116
3	Alfresco Tagging Service	 tagging service	590014304
4	java.util.HashSet	ava.util.hashset	1058840703
5	.ChainingUserRegistrySynchronizer	strysynchronizer	3393647685
6	START_TIME	start_time	2591279036
7	END_TIME	end_time	1185195849
8	LAST_RUN_HOST	last_run_host	1321510405
9	127.0.0.1:8080	127.0.0.1:8080	144111656
10	STATUS	status	2348327578
11	IN_PROGRESS	in_progress	1779080785
12	LAST_ERROR	last_error	866488931
13	SUMMARY	summary	4050491513
14	.empty	.empty	578883388
15	COMPLETE	complete	2220117103
\.


--
-- Name: alf_prop_string_value_seq; Type: SEQUENCE SET; Schema: public; Owner: alfresco
--

SELECT pg_catalog.setval('alf_prop_string_value_seq', 15, true);


--
-- Data for Name: alf_prop_unique_ctx; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY alf_prop_unique_ctx (id, version, value1_prop_id, value2_prop_id, value3_prop_id, prop1_id) FROM stdin;
1	0	1	2	3	1
2	4	7	8	3	31
4	4	7	12	3	33
6	4	7	16	3	\N
7	4	7	17	3	35
5	9	7	14	3	36
3	9	7	10	3	37
\.


--
-- Name: alf_prop_unique_ctx_seq; Type: SEQUENCE SET; Schema: public; Owner: alfresco
--

SELECT pg_catalog.setval('alf_prop_unique_ctx_seq', 7, true);


--
-- Data for Name: alf_prop_value; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY alf_prop_value (id, actual_type_id, persisted_type, long_value) FROM stdin;
1	1	3	1
2	1	3	2
3	2	0	0
4	3	4	1
5	1	3	3
6	4	5	4
7	1	3	5
8	1	3	6
9	5	1	1642631478935
10	1	3	7
11	5	1	-1
12	1	3	8
13	1	3	9
14	1	3	10
15	1	3	11
16	1	3	12
17	1	3	13
18	1	3	14
19	1	3	15
20	5	1	1642631479029
21	5	1	1642636800449
22	5	1	1642636800593
23	5	1	1642719453940
24	5	1	1642719454060
25	5	1	1642723200235
26	5	1	1642723200610
27	5	1	1642788529722
28	5	1	1642788530352
\.


--
-- Name: alf_prop_value_seq; Type: SEQUENCE SET; Schema: public; Owner: alfresco
--

SELECT pg_catalog.setval('alf_prop_value_seq', 28, true);


--
-- Data for Name: alf_qname; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY alf_qname (id, version, ns_id, local_name) FROM stdin;
1	0	1	store_root
2	0	1	aspect_root
3	0	1	container
4	0	1	children
5	0	2	user
6	0	2	enabled
7	0	2	accountLocked
8	0	2	credentialsExpire
9	0	2	username
10	0	2	password
11	0	2	accountExpires
12	0	1	descriptor
13	0	1	versionMajor
14	0	1	versionBuild
15	0	1	versionRevision
16	0	1	name
17	0	1	versionLabel
18	0	1	versionSchema
19	0	1	versionMinor
20	0	1	versionProperties
21	0	3	All
22	0	4	versionStoreRoot
23	0	5	versionStoreRoot
24	0	6	folder
25	0	6	auditable
26	0	6	name
27	0	6	description
28	0	6	title
29	0	7	icon
30	0	6	titled
31	0	7	uifacets
32	0	6	cmobject
33	0	6	contains
34	0	1	base
35	0	6	person
36	0	6	sizeCurrent
37	0	6	userName
38	0	6	email
39	0	6	homeFolderProvider
40	0	6	owner
41	0	6	lastName
42	0	6	organizationId
43	0	6	firstName
44	0	6	ownable
45	0	6	homeFolder
46	0	6	category_root
47	0	6	category
48	0	6	categories
49	0	6	subcategories
50	0	6	mlRoot
51	0	6	content
52	0	7	editInline
53	0	7	inlineeditable
54	0	6	author
55	0	6	source
56	0	6	templatable
57	0	6	template
58	0	8	rules
59	0	6	systemfolder
60	0	8	ruleFolder
61	0	8	rule
62	0	8	applyToChildren
63	0	8	disabled
64	0	8	executeAsynchronously
65	0	8	ruleType
66	0	9	compositeaction
67	0	8	action
68	0	9	executeAsynchronously
69	0	9	actionTitle
70	0	9	definitionName
71	0	9	actionDescription
72	0	9	actioncondition
73	0	9	conditions
74	0	9	invert
75	0	9	actionparameter
76	0	9	parameters
77	0	9	parameterValue
78	0	9	parameterName
79	0	9	action
80	0	9	actions
81	0	10	sites
82	0	1	clientVisibilityMask
83	0	1	cascadeHidden
84	0	1	cascadeIndexControl
85	0	1	hidden
86	0	6	isContentIndexed
87	0	6	isIndexed
88	0	6	indexControl
89	0	6	authorityContainer
90	0	6	authorityName
91	0	6	zone
92	0	6	inZone
93	0	6	member
94	0	1	cascadeCRC
95	0	1	cascadeUpdate
96	0	1	cascadeTx
97	0	11	transferGroup
98	0	9	executionFailureMessage
99	0	9	executionEndDate
100	0	9	executionStartDate
101	0	9	executionActionStatus
102	0	9	actionFolder
103	0	12	Environment
104	0	13	smartFolderTemplate
105	0	1	licenseMode
106	0	1	versionEdition
107	0	10	site
108	0	10	siteVisibility
109	0	10	sitePreset
110	0	1	unmovable
111	0	1	undeletable
112	0	6	tagscope
113	0	6	authorityDisplayName
114	0	2	salt
115	0	6	jobtitle
116	0	6	location
117	0	6	mobile
118	0	6	skype
119	0	6	companyaddress1
120	0	6	telephone
121	0	6	sizeQuota
122	0	6	instantmsg
123	0	6	companypostcode
124	0	6	googleusername
125	0	6	companyaddress3
126	0	6	companytelephone
127	0	6	companyemail
128	0	6	companyaddress2
129	0	6	organization
130	0	6	companyfax
131	0	6	userStatus
132	0	6	emailFeedId
133	0	6	userStatusTime
134	0	6	personDisabled
135	0	6	preferences
136	0	6	preferenceValues
137	0	6	persondescription
138	0	6	preferenceImage
139	0	6	lastThumbnailModification
140	0	6	thumbnailModification
141	0	15	renditioned
142	0	6	thumbnail
143	0	15	rendition
144	0	6	contentPropertyName
145	0	6	thumbnailName
146	0	15	hiddenRendition
147	0	6	avatar
148	0	1	temporary
149	0	1	deleted
150	0	1	originalId
151	0	6	tagScopeSummary
152	0	6	tagScopeCache
153	0	10	componentId
154	0	10	siteContainer
155	0	6	taggable
156	0	6	autoVersionOnUpdateProps
157	0	6	likesRatingSchemeTotal
158	0	6	versionLabel
159	0	6	autoVersion
160	0	6	initialVersion
161	0	6	likesRatingSchemeCount
162	0	6	versionable
163	0	6	likesRatingSchemeRollups
164	0	6	rateable
165	0	5	versionHistory
166	0	5	versionedNodeId
167	0	5	version
168	0	5	frozenNodeRef
169	0	5	versionDescription
170	0	5	versionLabel
171	0	5	frozenNodeDbId
172	0	6	versionType
173	0	5	frozenCreator
174	0	5	frozenCreated
175	0	5	frozenModifier
176	0	5	frozenModified
177	0	5	frozenAccessed
178	0	5	rootVersion
179	0	16	software
180	0	16	focalLength
181	0	16	yResolution
182	0	16	resolutionUnit
183	0	16	dateTimeOriginal
184	0	16	orientation
185	0	16	pixelYDimension
186	0	16	model
187	0	16	xResolution
188	0	16	flash
189	0	16	fNumber
190	0	16	isoSpeedRatings
191	0	16	manufacturer
192	0	16	pixelXDimension
193	0	16	exposureTime
194	0	16	exif
195	0	17	discussable
196	0	17	forum
197	0	17	discussion
198	0	17	topic
199	0	17	post
200	0	18	link
201	0	18	description
202	0	18	title
203	0	18	url
204	0	19	dataList
205	0	19	dataListItemType
206	0	19	issue
207	0	19	issueStatus
208	0	19	issuePriority
209	0	19	issueComments
210	0	19	issueDueDate
211	0	19	issueID
212	0	6	attachable
213	0	19	todoList
214	0	19	todoStatus
215	0	19	todoPriority
216	0	19	todoNotes
217	0	19	todoTitle
218	0	19	todoDueDate
219	0	6	published
220	0	6	syndication
221	0	6	referencing
222	0	6	updated
223	0	1	clientControlled
224	0	6	references
225	0	19	attachments
226	0	6	attachments
227	0	1	incomplete
228	0	20	installedVersion
229	0	20	currentVersion
230	0	21	facets
231	0	21	facetOrder
232	0	5	metadata-versionType
\.


--
-- Name: alf_qname_seq; Type: SEQUENCE SET; Schema: public; Owner: alfresco
--

SELECT pg_catalog.setval('alf_qname_seq', 232, true);


--
-- Data for Name: alf_server; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY alf_server (id, version, ip_address) FROM stdin;
1	1	10.128.0.3
\.


--
-- Name: alf_server_seq; Type: SEQUENCE SET; Schema: public; Owner: alfresco
--

SELECT pg_catalog.setval('alf_server_seq', 1, true);


--
-- Data for Name: alf_store; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY alf_store (id, version, protocol, identifier, root_node_id) FROM stdin;
1	1	user	alfrescoUserStore	1
2	1	system	system	5
3	1	workspace	lightWeightVersionStore	9
4	1	workspace	version2Store	10
5	1	archive	SpacesStore	11
6	1	workspace	SpacesStore	12
\.


--
-- Name: alf_store_seq; Type: SEQUENCE SET; Schema: public; Owner: alfresco
--

SELECT pg_catalog.setval('alf_store_seq', 6, true);


--
-- Data for Name: alf_subscriptions; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY alf_subscriptions (user_node_id, node_id) FROM stdin;
\.


--
-- Data for Name: alf_tenant; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY alf_tenant (tenant_domain, version, enabled, tenant_name, content_root, db_url) FROM stdin;
\.


--
-- Data for Name: alf_transaction; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY alf_transaction (id, version, server_id, change_txn_id, commit_time_ms) FROM stdin;
1	1	1	3c3c4dea-5a0f-4b8f-8217-8245a7148cbd	1642631447014
2	1	1	61bc252a-c2e5-49f5-817d-e0fb1d83db30	1642631447373
3	1	1	59dcd200-4202-46e9-b1b7-2cf839165823	1642631447498
4	1	1	e8e5a0b3-05b7-45bc-a096-c8e19f4c1291	1642631447561
5	1	1	f1b18a5f-d489-4556-b40d-c35cc8aa90eb	1642631447592
6	1	1	f14a1cee-a9ef-4276-814b-f9571294854f	1642631459680
7	1	1	fa371aae-c17e-490b-8dfd-70736485107c	1642631464093
8	1	1	39d5ec2f-36f3-493b-8cf1-03c58a5f20a3	1642631469826
9	1	1	ce49f1b8-1e75-4132-9882-866fc6183fe6	1642631469857
10	1	1	559bd633-e9b0-401b-92df-85d514746a50	1642631476453
11	1	1	6088c2ad-ea31-40e5-afd3-86d8184aba07	1642631476484
12	1	1	2aa3e7c7-1a2d-487b-8878-b5620dedd4db	1642631476732
13	1	1	21e2e1d8-ee56-4f31-a320-e54c225c1e6b	1642631480701
14	1	1	084bf06f-dbd8-42f8-83ac-720d0f275756	1642631480706
15	1	1	d4b1aef9-91d2-4517-b020-b780ac7e1208	1642631481934
16	1	1	24133099-a021-44d6-8135-2ea4f4498f7b	1642631481951
17	1	1	6565dd5c-82d2-4d9c-9366-f727ece33294	1642631674515
18	1	1	cc5ca13b-d3d9-4a57-af38-8a449131e469	1642631674848
19	1	1	89c47c95-e0ab-4751-bb81-741a5e5215f7	1642631854235
20	1	1	6505ef1c-7d10-427d-92b2-901c49d89500	1642631854715
21	1	1	0c791a54-e6fa-4447-8088-58c40e72263c	1642631854824
22	1	1	e92648c5-9071-4cee-a0be-946b03c6e544	1642631855565
23	1	1	6734f74f-4441-4268-93ff-d4f55761e653	1642631867275
24	1	1	d0c34ec6-6cde-4e47-9d4a-fdebf3628d2a	1642631867295
25	1	1	59c0e7ee-5122-4ece-84e4-86decbea00d7	1642631925924
26	1	1	fa0e7ed5-c45d-4d41-8576-cd16943b9b6f	1642631927025
27	1	1	f5817a21-a5e3-4fb9-b4f2-ddbb12d5c3ee	1642632446794
28	1	1	1d7a562e-ef13-4b9f-b150-dc6d89192048	1642632446810
29	1	1	fc61ef38-494b-438e-8e3c-6a97cf03d033	1642632460515
30	1	1	00e2413e-28f7-4ca6-afab-464b3c868c64	1642632460551
31	1	1	141cb5ef-4f80-443a-8b19-95aeb7803419	1642632464381
32	1	1	569d16b0-849a-41ee-8721-cebb43da7308	1642632464456
33	1	1	080a934e-e899-402d-98d3-8046fa133a57	1642632470010
34	1	1	146c60a9-630b-47a1-8a75-4ab2316a380f	1642632470047
35	1	1	4b75c3af-ae5e-4d5b-91bc-1230a00d8a85	1642632470361
36	1	1	c2203b5f-53f4-45a6-a1ae-8dd30aa8942b	1642632470528
37	1	1	ee782210-4aa6-4e47-8a35-0c456031acfe	1642632470804
\.


--
-- Name: alf_transaction_seq; Type: SEQUENCE SET; Schema: public; Owner: alfresco
--

SELECT pg_catalog.setval('alf_transaction_seq', 37, true);


--
-- Data for Name: alf_usage_delta; Type: TABLE DATA; Schema: public; Owner: alfresco
--

COPY alf_usage_delta (id, version, node_id, delta_size) FROM stdin;
\.


--
-- Name: alf_usage_delta_seq; Type: SEQUENCE SET; Schema: public; Owner: alfresco
--

SELECT pg_catalog.setval('alf_usage_delta_seq', 1, false);


--
-- Name: act_evt_log_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY act_evt_log
    ADD CONSTRAINT act_evt_log_pkey PRIMARY KEY (log_nr_);


--
-- Name: act_ge_bytearray_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY act_ge_bytearray
    ADD CONSTRAINT act_ge_bytearray_pkey PRIMARY KEY (id_);


--
-- Name: act_ge_property_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY act_ge_property
    ADD CONSTRAINT act_ge_property_pkey PRIMARY KEY (name_);


--
-- Name: act_hi_actinst_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY act_hi_actinst
    ADD CONSTRAINT act_hi_actinst_pkey PRIMARY KEY (id_);


--
-- Name: act_hi_attachment_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY act_hi_attachment
    ADD CONSTRAINT act_hi_attachment_pkey PRIMARY KEY (id_);


--
-- Name: act_hi_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY act_hi_comment
    ADD CONSTRAINT act_hi_comment_pkey PRIMARY KEY (id_);


--
-- Name: act_hi_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY act_hi_detail
    ADD CONSTRAINT act_hi_detail_pkey PRIMARY KEY (id_);


--
-- Name: act_hi_identitylink_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY act_hi_identitylink
    ADD CONSTRAINT act_hi_identitylink_pkey PRIMARY KEY (id_);


--
-- Name: act_hi_procinst_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY act_hi_procinst
    ADD CONSTRAINT act_hi_procinst_pkey PRIMARY KEY (id_);


--
-- Name: act_hi_procinst_proc_inst_id__key; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY act_hi_procinst
    ADD CONSTRAINT act_hi_procinst_proc_inst_id__key UNIQUE (proc_inst_id_);


--
-- Name: act_hi_taskinst_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY act_hi_taskinst
    ADD CONSTRAINT act_hi_taskinst_pkey PRIMARY KEY (id_);


--
-- Name: act_hi_varinst_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY act_hi_varinst
    ADD CONSTRAINT act_hi_varinst_pkey PRIMARY KEY (id_);


--
-- Name: act_id_group_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY act_id_group
    ADD CONSTRAINT act_id_group_pkey PRIMARY KEY (id_);


--
-- Name: act_id_info_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY act_id_info
    ADD CONSTRAINT act_id_info_pkey PRIMARY KEY (id_);


--
-- Name: act_id_membership_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY act_id_membership
    ADD CONSTRAINT act_id_membership_pkey PRIMARY KEY (user_id_, group_id_);


--
-- Name: act_id_user_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY act_id_user
    ADD CONSTRAINT act_id_user_pkey PRIMARY KEY (id_);


--
-- Name: act_procdef_info_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY act_procdef_info
    ADD CONSTRAINT act_procdef_info_pkey PRIMARY KEY (id_);


--
-- Name: act_re_deployment_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY act_re_deployment
    ADD CONSTRAINT act_re_deployment_pkey PRIMARY KEY (id_);


--
-- Name: act_re_model_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY act_re_model
    ADD CONSTRAINT act_re_model_pkey PRIMARY KEY (id_);


--
-- Name: act_re_procdef_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY act_re_procdef
    ADD CONSTRAINT act_re_procdef_pkey PRIMARY KEY (id_);


--
-- Name: act_ru_event_subscr_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY act_ru_event_subscr
    ADD CONSTRAINT act_ru_event_subscr_pkey PRIMARY KEY (id_);


--
-- Name: act_ru_execution_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY act_ru_execution
    ADD CONSTRAINT act_ru_execution_pkey PRIMARY KEY (id_);


--
-- Name: act_ru_identitylink_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY act_ru_identitylink
    ADD CONSTRAINT act_ru_identitylink_pkey PRIMARY KEY (id_);


--
-- Name: act_ru_job_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY act_ru_job
    ADD CONSTRAINT act_ru_job_pkey PRIMARY KEY (id_);


--
-- Name: act_ru_task_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY act_ru_task
    ADD CONSTRAINT act_ru_task_pkey PRIMARY KEY (id_);


--
-- Name: act_ru_variable_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY act_ru_variable
    ADD CONSTRAINT act_ru_variable_pkey PRIMARY KEY (id_);


--
-- Name: act_uniq_info_procdef; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY act_procdef_info
    ADD CONSTRAINT act_uniq_info_procdef UNIQUE (proc_def_id_);


--
-- Name: act_uniq_procdef; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY act_re_procdef
    ADD CONSTRAINT act_uniq_procdef UNIQUE (key_, version_, tenant_id_);


--
-- Name: alf_access_control_entry_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY alf_access_control_entry
    ADD CONSTRAINT alf_access_control_entry_pkey PRIMARY KEY (id);


--
-- Name: alf_access_control_list_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY alf_access_control_list
    ADD CONSTRAINT alf_access_control_list_pkey PRIMARY KEY (id);


--
-- Name: alf_ace_context_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY alf_ace_context
    ADD CONSTRAINT alf_ace_context_pkey PRIMARY KEY (id);


--
-- Name: alf_acl_change_set_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY alf_acl_change_set
    ADD CONSTRAINT alf_acl_change_set_pkey PRIMARY KEY (id);


--
-- Name: alf_acl_member_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY alf_acl_member
    ADD CONSTRAINT alf_acl_member_pkey PRIMARY KEY (id);


--
-- Name: alf_activity_feed_control_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY alf_activity_feed_control
    ADD CONSTRAINT alf_activity_feed_control_pkey PRIMARY KEY (id);


--
-- Name: alf_activity_feed_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY alf_activity_feed
    ADD CONSTRAINT alf_activity_feed_pkey PRIMARY KEY (id);


--
-- Name: alf_activity_post_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY alf_activity_post
    ADD CONSTRAINT alf_activity_post_pkey PRIMARY KEY (sequence_id);


--
-- Name: alf_applied_patch_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY alf_applied_patch
    ADD CONSTRAINT alf_applied_patch_pkey PRIMARY KEY (id);


--
-- Name: alf_audit_app_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY alf_audit_app
    ADD CONSTRAINT alf_audit_app_pkey PRIMARY KEY (id);


--
-- Name: alf_audit_entry_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY alf_audit_entry
    ADD CONSTRAINT alf_audit_entry_pkey PRIMARY KEY (id);


--
-- Name: alf_audit_model_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY alf_audit_model
    ADD CONSTRAINT alf_audit_model_pkey PRIMARY KEY (id);


--
-- Name: alf_auth_status_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY alf_auth_status
    ADD CONSTRAINT alf_auth_status_pkey PRIMARY KEY (id);


--
-- Name: alf_authority_alias_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY alf_authority_alias
    ADD CONSTRAINT alf_authority_alias_pkey PRIMARY KEY (id);


--
-- Name: alf_authority_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY alf_authority
    ADD CONSTRAINT alf_authority_pkey PRIMARY KEY (id);


--
-- Name: alf_child_assoc_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY alf_child_assoc
    ADD CONSTRAINT alf_child_assoc_pkey PRIMARY KEY (id);


--
-- Name: alf_content_data_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY alf_content_data
    ADD CONSTRAINT alf_content_data_pkey PRIMARY KEY (id);


--
-- Name: alf_content_url_encryption_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY alf_content_url_encryption
    ADD CONSTRAINT alf_content_url_encryption_pkey PRIMARY KEY (id);


--
-- Name: alf_content_url_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY alf_content_url
    ADD CONSTRAINT alf_content_url_pkey PRIMARY KEY (id);


--
-- Name: alf_encoding_encoding_str_key; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY alf_encoding
    ADD CONSTRAINT alf_encoding_encoding_str_key UNIQUE (encoding_str);


--
-- Name: alf_encoding_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY alf_encoding
    ADD CONSTRAINT alf_encoding_pkey PRIMARY KEY (id);


--
-- Name: alf_locale_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY alf_locale
    ADD CONSTRAINT alf_locale_pkey PRIMARY KEY (id);


--
-- Name: alf_lock_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY alf_lock
    ADD CONSTRAINT alf_lock_pkey PRIMARY KEY (id);


--
-- Name: alf_lock_resource_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY alf_lock_resource
    ADD CONSTRAINT alf_lock_resource_pkey PRIMARY KEY (id);


--
-- Name: alf_mimetype_mimetype_str_key; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY alf_mimetype
    ADD CONSTRAINT alf_mimetype_mimetype_str_key UNIQUE (mimetype_str);


--
-- Name: alf_mimetype_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY alf_mimetype
    ADD CONSTRAINT alf_mimetype_pkey PRIMARY KEY (id);


--
-- Name: alf_namespace_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY alf_namespace
    ADD CONSTRAINT alf_namespace_pkey PRIMARY KEY (id);


--
-- Name: alf_node_aspects_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY alf_node_aspects
    ADD CONSTRAINT alf_node_aspects_pkey PRIMARY KEY (node_id, qname_id);


--
-- Name: alf_node_assoc_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY alf_node_assoc
    ADD CONSTRAINT alf_node_assoc_pkey PRIMARY KEY (id);


--
-- Name: alf_node_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY alf_node
    ADD CONSTRAINT alf_node_pkey PRIMARY KEY (id);


--
-- Name: alf_node_properties_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY alf_node_properties
    ADD CONSTRAINT alf_node_properties_pkey PRIMARY KEY (node_id, qname_id, list_index, locale_id);


--
-- Name: alf_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY alf_permission
    ADD CONSTRAINT alf_permission_pkey PRIMARY KEY (id);


--
-- Name: alf_prop_class_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY alf_prop_class
    ADD CONSTRAINT alf_prop_class_pkey PRIMARY KEY (id);


--
-- Name: alf_prop_date_value_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY alf_prop_date_value
    ADD CONSTRAINT alf_prop_date_value_pkey PRIMARY KEY (date_value);


--
-- Name: alf_prop_double_value_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY alf_prop_double_value
    ADD CONSTRAINT alf_prop_double_value_pkey PRIMARY KEY (id);


--
-- Name: alf_prop_link_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY alf_prop_link
    ADD CONSTRAINT alf_prop_link_pkey PRIMARY KEY (root_prop_id, contained_in, prop_index);


--
-- Name: alf_prop_root_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY alf_prop_root
    ADD CONSTRAINT alf_prop_root_pkey PRIMARY KEY (id);


--
-- Name: alf_prop_serializable_value_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY alf_prop_serializable_value
    ADD CONSTRAINT alf_prop_serializable_value_pkey PRIMARY KEY (id);


--
-- Name: alf_prop_string_value_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY alf_prop_string_value
    ADD CONSTRAINT alf_prop_string_value_pkey PRIMARY KEY (id);


--
-- Name: alf_prop_unique_ctx_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY alf_prop_unique_ctx
    ADD CONSTRAINT alf_prop_unique_ctx_pkey PRIMARY KEY (id);


--
-- Name: alf_prop_value_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY alf_prop_value
    ADD CONSTRAINT alf_prop_value_pkey PRIMARY KEY (id);


--
-- Name: alf_qname_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY alf_qname
    ADD CONSTRAINT alf_qname_pkey PRIMARY KEY (id);


--
-- Name: alf_server_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY alf_server
    ADD CONSTRAINT alf_server_pkey PRIMARY KEY (id);


--
-- Name: alf_store_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY alf_store
    ADD CONSTRAINT alf_store_pkey PRIMARY KEY (id);


--
-- Name: alf_subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY alf_subscriptions
    ADD CONSTRAINT alf_subscriptions_pkey PRIMARY KEY (user_node_id, node_id);


--
-- Name: alf_tenant_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY alf_tenant
    ADD CONSTRAINT alf_tenant_pkey PRIMARY KEY (tenant_domain);


--
-- Name: alf_transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY alf_transaction
    ADD CONSTRAINT alf_transaction_pkey PRIMARY KEY (id);


--
-- Name: alf_usage_delta_pkey; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY alf_usage_delta
    ADD CONSTRAINT alf_usage_delta_pkey PRIMARY KEY (id);


--
-- Name: idx_alf_aud_app_an; Type: CONSTRAINT; Schema: public; Owner: alfresco; Tablespace: 
--

ALTER TABLE ONLY alf_audit_app
    ADD CONSTRAINT idx_alf_aud_app_an UNIQUE (app_name_id);


--
-- Name: acl_id; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE UNIQUE INDEX acl_id ON alf_access_control_list USING btree (acl_id, latest, acl_version);


--
-- Name: aclm_acl_id; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE UNIQUE INDEX aclm_acl_id ON alf_acl_member USING btree (acl_id, ace_id, pos);


--
-- Name: act_idx_athrz_procedef; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX act_idx_athrz_procedef ON act_ru_identitylink USING btree (proc_def_id_);


--
-- Name: act_idx_bytear_depl; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX act_idx_bytear_depl ON act_ge_bytearray USING btree (deployment_id_);


--
-- Name: act_idx_event_subscr; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX act_idx_event_subscr ON act_ru_event_subscr USING btree (execution_id_);


--
-- Name: act_idx_event_subscr_config_; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX act_idx_event_subscr_config_ ON act_ru_event_subscr USING btree (configuration_);


--
-- Name: act_idx_exe_parent; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX act_idx_exe_parent ON act_ru_execution USING btree (parent_id_);


--
-- Name: act_idx_exe_procdef; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX act_idx_exe_procdef ON act_ru_execution USING btree (proc_def_id_);


--
-- Name: act_idx_exe_procinst; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX act_idx_exe_procinst ON act_ru_execution USING btree (proc_inst_id_);


--
-- Name: act_idx_exe_super; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX act_idx_exe_super ON act_ru_execution USING btree (super_exec_);


--
-- Name: act_idx_exec_buskey; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX act_idx_exec_buskey ON act_ru_execution USING btree (business_key_);


--
-- Name: act_idx_hi_act_inst_end; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX act_idx_hi_act_inst_end ON act_hi_actinst USING btree (end_time_);


--
-- Name: act_idx_hi_act_inst_exec; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX act_idx_hi_act_inst_exec ON act_hi_actinst USING btree (execution_id_, act_id_);


--
-- Name: act_idx_hi_act_inst_procinst; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX act_idx_hi_act_inst_procinst ON act_hi_actinst USING btree (proc_inst_id_, act_id_);


--
-- Name: act_idx_hi_act_inst_start; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX act_idx_hi_act_inst_start ON act_hi_actinst USING btree (start_time_);


--
-- Name: act_idx_hi_detail_act_inst; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX act_idx_hi_detail_act_inst ON act_hi_detail USING btree (act_inst_id_);


--
-- Name: act_idx_hi_detail_name; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX act_idx_hi_detail_name ON act_hi_detail USING btree (name_);


--
-- Name: act_idx_hi_detail_proc_inst; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX act_idx_hi_detail_proc_inst ON act_hi_detail USING btree (proc_inst_id_);


--
-- Name: act_idx_hi_detail_task_id; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX act_idx_hi_detail_task_id ON act_hi_detail USING btree (task_id_);


--
-- Name: act_idx_hi_detail_time; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX act_idx_hi_detail_time ON act_hi_detail USING btree (time_);


--
-- Name: act_idx_hi_ident_lnk_procinst; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX act_idx_hi_ident_lnk_procinst ON act_hi_identitylink USING btree (proc_inst_id_);


--
-- Name: act_idx_hi_ident_lnk_task; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX act_idx_hi_ident_lnk_task ON act_hi_identitylink USING btree (task_id_);


--
-- Name: act_idx_hi_ident_lnk_user; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX act_idx_hi_ident_lnk_user ON act_hi_identitylink USING btree (user_id_);


--
-- Name: act_idx_hi_pro_i_buskey; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX act_idx_hi_pro_i_buskey ON act_hi_procinst USING btree (business_key_);


--
-- Name: act_idx_hi_pro_inst_end; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX act_idx_hi_pro_inst_end ON act_hi_procinst USING btree (end_time_);


--
-- Name: act_idx_hi_procvar_name_type; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX act_idx_hi_procvar_name_type ON act_hi_varinst USING btree (name_, var_type_);


--
-- Name: act_idx_hi_procvar_proc_inst; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX act_idx_hi_procvar_proc_inst ON act_hi_varinst USING btree (proc_inst_id_);


--
-- Name: act_idx_hi_procvar_task_id; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX act_idx_hi_procvar_task_id ON act_hi_varinst USING btree (task_id_);


--
-- Name: act_idx_hi_task_inst_procinst; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX act_idx_hi_task_inst_procinst ON act_hi_taskinst USING btree (proc_inst_id_);


--
-- Name: act_idx_ident_lnk_group; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX act_idx_ident_lnk_group ON act_ru_identitylink USING btree (group_id_);


--
-- Name: act_idx_ident_lnk_user; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX act_idx_ident_lnk_user ON act_ru_identitylink USING btree (user_id_);


--
-- Name: act_idx_idl_procinst; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX act_idx_idl_procinst ON act_ru_identitylink USING btree (proc_inst_id_);


--
-- Name: act_idx_job_exception; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX act_idx_job_exception ON act_ru_job USING btree (exception_stack_id_);


--
-- Name: act_idx_memb_group; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX act_idx_memb_group ON act_id_membership USING btree (group_id_);


--
-- Name: act_idx_memb_user; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX act_idx_memb_user ON act_id_membership USING btree (user_id_);


--
-- Name: act_idx_model_deployment; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX act_idx_model_deployment ON act_re_model USING btree (deployment_id_);


--
-- Name: act_idx_model_source; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX act_idx_model_source ON act_re_model USING btree (editor_source_value_id_);


--
-- Name: act_idx_model_source_extra; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX act_idx_model_source_extra ON act_re_model USING btree (editor_source_extra_value_id_);


--
-- Name: act_idx_procdef_info_json; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX act_idx_procdef_info_json ON act_procdef_info USING btree (info_json_id_);


--
-- Name: act_idx_procdef_info_proc; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX act_idx_procdef_info_proc ON act_procdef_info USING btree (proc_def_id_);


--
-- Name: act_idx_task_create; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX act_idx_task_create ON act_ru_task USING btree (create_time_);


--
-- Name: act_idx_task_exec; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX act_idx_task_exec ON act_ru_task USING btree (execution_id_);


--
-- Name: act_idx_task_procdef; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX act_idx_task_procdef ON act_ru_task USING btree (proc_def_id_);


--
-- Name: act_idx_task_procinst; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX act_idx_task_procinst ON act_ru_task USING btree (proc_inst_id_);


--
-- Name: act_idx_tskass_task; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX act_idx_tskass_task ON act_ru_identitylink USING btree (task_id_);


--
-- Name: act_idx_var_bytearray; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX act_idx_var_bytearray ON act_ru_variable USING btree (bytearray_id_);


--
-- Name: act_idx_var_exe; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX act_idx_var_exe ON act_ru_variable USING btree (execution_id_);


--
-- Name: act_idx_var_procinst; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX act_idx_var_procinst ON act_ru_variable USING btree (proc_inst_id_);


--
-- Name: act_idx_variable_task_id; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX act_idx_variable_task_id ON act_ru_variable USING btree (task_id_);


--
-- Name: auth_id; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE UNIQUE INDEX auth_id ON alf_authority_alias USING btree (auth_id, alias_id);


--
-- Name: authority; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE UNIQUE INDEX authority ON alf_authority USING btree (authority, crc);


--
-- Name: feed_feeduserid_idx; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX feed_feeduserid_idx ON alf_activity_feed USING btree (feed_user_id);


--
-- Name: feed_postdate_idx; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX feed_postdate_idx ON alf_activity_feed USING btree (post_date);


--
-- Name: feed_postuserid_idx; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX feed_postuserid_idx ON alf_activity_feed USING btree (post_user_id);


--
-- Name: feed_sitenetwork_idx; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX feed_sitenetwork_idx ON alf_activity_feed USING btree (site_network);


--
-- Name: feedctrl_feeduserid_idx; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX feedctrl_feeduserid_idx ON alf_activity_feed_control USING btree (feed_user_id);


--
-- Name: fk_alf_ace_auth; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX fk_alf_ace_auth ON alf_access_control_entry USING btree (authority_id);


--
-- Name: fk_alf_ace_ctx; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX fk_alf_ace_ctx ON alf_access_control_entry USING btree (context_id);


--
-- Name: fk_alf_ace_perm; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX fk_alf_ace_perm ON alf_access_control_entry USING btree (permission_id);


--
-- Name: fk_alf_acl_acs; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX fk_alf_acl_acs ON alf_access_control_list USING btree (acl_change_set);


--
-- Name: fk_alf_aclm_ace; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX fk_alf_aclm_ace ON alf_acl_member USING btree (ace_id);


--
-- Name: fk_alf_aclm_acl; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX fk_alf_aclm_acl ON alf_acl_member USING btree (acl_id);


--
-- Name: fk_alf_aud_app_dis; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX fk_alf_aud_app_dis ON alf_audit_app USING btree (disabled_paths_id);


--
-- Name: fk_alf_aud_app_mod; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX fk_alf_aud_app_mod ON alf_audit_app USING btree (audit_model_id);


--
-- Name: fk_alf_aud_ent_app; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX fk_alf_aud_ent_app ON alf_audit_entry USING btree (audit_app_id);


--
-- Name: fk_alf_aud_ent_pro; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX fk_alf_aud_ent_pro ON alf_audit_entry USING btree (audit_values_id);


--
-- Name: fk_alf_aud_ent_use; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX fk_alf_aud_ent_use ON alf_audit_entry USING btree (audit_user_id);


--
-- Name: fk_alf_aud_mod_cd; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX fk_alf_aud_mod_cd ON alf_audit_model USING btree (content_data_id);


--
-- Name: fk_alf_autha_ali; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX fk_alf_autha_ali ON alf_authority_alias USING btree (alias_id);


--
-- Name: fk_alf_autha_aut; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX fk_alf_autha_aut ON alf_authority_alias USING btree (auth_id);


--
-- Name: fk_alf_cass_cnode; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX fk_alf_cass_cnode ON alf_child_assoc USING btree (child_node_id);


--
-- Name: fk_alf_cass_qnns; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX fk_alf_cass_qnns ON alf_child_assoc USING btree (qname_ns_id);


--
-- Name: fk_alf_cass_tqn; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX fk_alf_cass_tqn ON alf_child_assoc USING btree (type_qname_id);


--
-- Name: fk_alf_cont_enc; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX fk_alf_cont_enc ON alf_content_data USING btree (content_encoding_id);


--
-- Name: fk_alf_cont_loc; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX fk_alf_cont_loc ON alf_content_data USING btree (content_locale_id);


--
-- Name: fk_alf_cont_mim; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX fk_alf_cont_mim ON alf_content_data USING btree (content_mimetype_id);


--
-- Name: fk_alf_cont_url; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX fk_alf_cont_url ON alf_content_data USING btree (content_url_id);


--
-- Name: fk_alf_lock_excl; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX fk_alf_lock_excl ON alf_lock USING btree (excl_resource_id);


--
-- Name: fk_alf_nasp_n; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX fk_alf_nasp_n ON alf_node_aspects USING btree (node_id);


--
-- Name: fk_alf_nasp_qn; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX fk_alf_nasp_qn ON alf_node_aspects USING btree (qname_id);


--
-- Name: fk_alf_nass_snode; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX fk_alf_nass_snode ON alf_node_assoc USING btree (source_node_id, type_qname_id, assoc_index);


--
-- Name: fk_alf_nass_tnode; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX fk_alf_nass_tnode ON alf_node_assoc USING btree (target_node_id, type_qname_id);


--
-- Name: fk_alf_nass_tqn; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX fk_alf_nass_tqn ON alf_node_assoc USING btree (type_qname_id);


--
-- Name: fk_alf_node_acl; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX fk_alf_node_acl ON alf_node USING btree (acl_id);


--
-- Name: fk_alf_node_loc; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX fk_alf_node_loc ON alf_node USING btree (locale_id);


--
-- Name: fk_alf_node_store; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX fk_alf_node_store ON alf_node USING btree (store_id);


--
-- Name: fk_alf_nprop_loc; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX fk_alf_nprop_loc ON alf_node_properties USING btree (locale_id);


--
-- Name: fk_alf_nprop_n; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX fk_alf_nprop_n ON alf_node_properties USING btree (node_id);


--
-- Name: fk_alf_nprop_qn; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX fk_alf_nprop_qn ON alf_node_properties USING btree (qname_id);


--
-- Name: fk_alf_perm_tqn; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX fk_alf_perm_tqn ON alf_permission USING btree (type_qname_id);


--
-- Name: fk_alf_propln_key; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX fk_alf_propln_key ON alf_prop_link USING btree (key_prop_id);


--
-- Name: fk_alf_propln_val; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX fk_alf_propln_val ON alf_prop_link USING btree (value_prop_id);


--
-- Name: fk_alf_propuctx_p1; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX fk_alf_propuctx_p1 ON alf_prop_unique_ctx USING btree (prop1_id);


--
-- Name: fk_alf_propuctx_v2; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX fk_alf_propuctx_v2 ON alf_prop_unique_ctx USING btree (value2_prop_id);


--
-- Name: fk_alf_propuctx_v3; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX fk_alf_propuctx_v3 ON alf_prop_unique_ctx USING btree (value3_prop_id);


--
-- Name: fk_alf_store_root; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX fk_alf_store_root ON alf_store USING btree (root_node_id);


--
-- Name: fk_alf_sub_node; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX fk_alf_sub_node ON alf_subscriptions USING btree (node_id);


--
-- Name: fk_alf_txn_svr; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX fk_alf_txn_svr ON alf_transaction USING btree (server_id);


--
-- Name: fk_alf_usaged_n; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX fk_alf_usaged_n ON alf_usage_delta USING btree (node_id);


--
-- Name: idx_alf_acl_inh; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX idx_alf_acl_inh ON alf_access_control_list USING btree (inherits, inherits_from);


--
-- Name: idx_alf_acs_ctms; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX idx_alf_acs_ctms ON alf_acl_change_set USING btree (commit_time_ms);


--
-- Name: idx_alf_aud_ent_tm; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX idx_alf_aud_ent_tm ON alf_audit_entry USING btree (audit_time);


--
-- Name: idx_alf_aud_mod_cr; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE UNIQUE INDEX idx_alf_aud_mod_cr ON alf_audit_model USING btree (content_crc);


--
-- Name: idx_alf_auth_action; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX idx_alf_auth_action ON alf_auth_status USING btree (authaction);


--
-- Name: idx_alf_auth_aut; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX idx_alf_auth_aut ON alf_authority USING btree (authority);


--
-- Name: idx_alf_auth_deleted; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX idx_alf_auth_deleted ON alf_auth_status USING btree (deleted);


--
-- Name: idx_alf_auth_usr_stat; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE UNIQUE INDEX idx_alf_auth_usr_stat ON alf_auth_status USING btree (username, authorized);


--
-- Name: idx_alf_cass_pnode; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX idx_alf_cass_pnode ON alf_child_assoc USING btree (parent_node_id, assoc_index, id);


--
-- Name: idx_alf_cass_pri; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX idx_alf_cass_pri ON alf_child_assoc USING btree (parent_node_id, is_primary, child_node_id);


--
-- Name: idx_alf_cass_qncrc; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX idx_alf_cass_qncrc ON alf_child_assoc USING btree (qname_crc, type_qname_id, parent_node_id);


--
-- Name: idx_alf_cont_enc_mka; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX idx_alf_cont_enc_mka ON alf_content_url_encryption USING btree (master_key_alias);


--
-- Name: idx_alf_cont_enc_url; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE UNIQUE INDEX idx_alf_cont_enc_url ON alf_content_url_encryption USING btree (content_url_id);


--
-- Name: idx_alf_conturl_cr; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE UNIQUE INDEX idx_alf_conturl_cr ON alf_content_url USING btree (content_url_short, content_url_crc);


--
-- Name: idx_alf_conturl_ot; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX idx_alf_conturl_ot ON alf_content_url USING btree (orphan_time);


--
-- Name: idx_alf_conturl_sz; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX idx_alf_conturl_sz ON alf_content_url USING btree (content_size, id);


--
-- Name: idx_alf_lock_key; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE UNIQUE INDEX idx_alf_lock_key ON alf_lock USING btree (shared_resource_id, excl_resource_id);


--
-- Name: idx_alf_lockr_key; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE UNIQUE INDEX idx_alf_lockr_key ON alf_lock_resource USING btree (qname_ns_id, qname_localname);


--
-- Name: idx_alf_node_cor; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX idx_alf_node_cor ON alf_node USING btree (audit_creator, store_id, type_qname_id, id);


--
-- Name: idx_alf_node_crd; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX idx_alf_node_crd ON alf_node USING btree (audit_created, store_id, type_qname_id, id);


--
-- Name: idx_alf_node_mdq; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX idx_alf_node_mdq ON alf_node USING btree (store_id, type_qname_id, id);


--
-- Name: idx_alf_node_mod; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX idx_alf_node_mod ON alf_node USING btree (audit_modified, store_id, type_qname_id, id);


--
-- Name: idx_alf_node_mor; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX idx_alf_node_mor ON alf_node USING btree (audit_modifier, store_id, type_qname_id, id);


--
-- Name: idx_alf_node_tqn; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX idx_alf_node_tqn ON alf_node USING btree (type_qname_id, store_id, id);


--
-- Name: idx_alf_node_txn_type; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX idx_alf_node_txn_type ON alf_node USING btree (transaction_id, type_qname_id);


--
-- Name: idx_alf_nprop_b; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX idx_alf_nprop_b ON alf_node_properties USING btree (qname_id, boolean_value, node_id);


--
-- Name: idx_alf_nprop_d; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX idx_alf_nprop_d ON alf_node_properties USING btree (qname_id, double_value, node_id);


--
-- Name: idx_alf_nprop_f; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX idx_alf_nprop_f ON alf_node_properties USING btree (qname_id, float_value, node_id);


--
-- Name: idx_alf_nprop_l; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX idx_alf_nprop_l ON alf_node_properties USING btree (qname_id, long_value, node_id);


--
-- Name: idx_alf_nprop_s; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX idx_alf_nprop_s ON alf_node_properties USING btree (qname_id, string_value, node_id);


--
-- Name: idx_alf_propc_clas; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX idx_alf_propc_clas ON alf_prop_class USING btree (java_class_name);


--
-- Name: idx_alf_propc_crc; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE UNIQUE INDEX idx_alf_propc_crc ON alf_prop_class USING btree (java_class_name_crc, java_class_name_short);


--
-- Name: idx_alf_propd_val; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE UNIQUE INDEX idx_alf_propd_val ON alf_prop_double_value USING btree (double_value);


--
-- Name: idx_alf_propdt_dt; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX idx_alf_propdt_dt ON alf_prop_date_value USING btree (full_year, month_of_year, day_of_month);


--
-- Name: idx_alf_propln_for; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX idx_alf_propln_for ON alf_prop_link USING btree (root_prop_id, key_prop_id, value_prop_id);


--
-- Name: idx_alf_props_crc; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE UNIQUE INDEX idx_alf_props_crc ON alf_prop_string_value USING btree (string_end_lower, string_crc);


--
-- Name: idx_alf_props_str; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX idx_alf_props_str ON alf_prop_string_value USING btree (string_value);


--
-- Name: idx_alf_propuctx; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE UNIQUE INDEX idx_alf_propuctx ON alf_prop_unique_ctx USING btree (value1_prop_id, value2_prop_id, value3_prop_id);


--
-- Name: idx_alf_propv_act; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE UNIQUE INDEX idx_alf_propv_act ON alf_prop_value USING btree (actual_type_id, long_value);


--
-- Name: idx_alf_propv_per; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX idx_alf_propv_per ON alf_prop_value USING btree (persisted_type, long_value);


--
-- Name: idx_alf_txn_ctms; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX idx_alf_txn_ctms ON alf_transaction USING btree (commit_time_ms, id);


--
-- Name: ip_address; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE UNIQUE INDEX ip_address ON alf_server USING btree (ip_address);


--
-- Name: locale_str; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE UNIQUE INDEX locale_str ON alf_locale USING btree (locale_str);


--
-- Name: ns_id; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE UNIQUE INDEX ns_id ON alf_qname USING btree (ns_id, local_name);


--
-- Name: parent_node_id; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE UNIQUE INDEX parent_node_id ON alf_child_assoc USING btree (parent_node_id, type_qname_id, child_node_name_crc, child_node_name);


--
-- Name: permission_id; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE UNIQUE INDEX permission_id ON alf_access_control_entry USING btree (permission_id, authority_id, allowed, applies);


--
-- Name: post_jobtasknode_idx; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX post_jobtasknode_idx ON alf_activity_post USING btree (job_task_node);


--
-- Name: post_status_idx; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE INDEX post_status_idx ON alf_activity_post USING btree (status);


--
-- Name: protocol; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE UNIQUE INDEX protocol ON alf_store USING btree (protocol, identifier);


--
-- Name: source_node_id; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE UNIQUE INDEX source_node_id ON alf_node_assoc USING btree (source_node_id, target_node_id, type_qname_id);


--
-- Name: store_id; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE UNIQUE INDEX store_id ON alf_node USING btree (store_id, uuid);


--
-- Name: type_qname_id; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE UNIQUE INDEX type_qname_id ON alf_permission USING btree (type_qname_id, name);


--
-- Name: uri; Type: INDEX; Schema: public; Owner: alfresco; Tablespace: 
--

CREATE UNIQUE INDEX uri ON alf_namespace USING btree (uri);


--
-- Name: act_fk_athrz_procedef; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY act_ru_identitylink
    ADD CONSTRAINT act_fk_athrz_procedef FOREIGN KEY (proc_def_id_) REFERENCES act_re_procdef(id_);


--
-- Name: act_fk_bytearr_depl; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY act_ge_bytearray
    ADD CONSTRAINT act_fk_bytearr_depl FOREIGN KEY (deployment_id_) REFERENCES act_re_deployment(id_);


--
-- Name: act_fk_event_exec; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY act_ru_event_subscr
    ADD CONSTRAINT act_fk_event_exec FOREIGN KEY (execution_id_) REFERENCES act_ru_execution(id_);


--
-- Name: act_fk_exe_parent; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY act_ru_execution
    ADD CONSTRAINT act_fk_exe_parent FOREIGN KEY (parent_id_) REFERENCES act_ru_execution(id_);


--
-- Name: act_fk_exe_procdef; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY act_ru_execution
    ADD CONSTRAINT act_fk_exe_procdef FOREIGN KEY (proc_def_id_) REFERENCES act_re_procdef(id_);


--
-- Name: act_fk_exe_procinst; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY act_ru_execution
    ADD CONSTRAINT act_fk_exe_procinst FOREIGN KEY (proc_inst_id_) REFERENCES act_ru_execution(id_);


--
-- Name: act_fk_exe_super; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY act_ru_execution
    ADD CONSTRAINT act_fk_exe_super FOREIGN KEY (super_exec_) REFERENCES act_ru_execution(id_);


--
-- Name: act_fk_idl_procinst; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY act_ru_identitylink
    ADD CONSTRAINT act_fk_idl_procinst FOREIGN KEY (proc_inst_id_) REFERENCES act_ru_execution(id_);


--
-- Name: act_fk_info_json_ba; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY act_procdef_info
    ADD CONSTRAINT act_fk_info_json_ba FOREIGN KEY (info_json_id_) REFERENCES act_ge_bytearray(id_);


--
-- Name: act_fk_info_procdef; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY act_procdef_info
    ADD CONSTRAINT act_fk_info_procdef FOREIGN KEY (proc_def_id_) REFERENCES act_re_procdef(id_);


--
-- Name: act_fk_job_exception; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY act_ru_job
    ADD CONSTRAINT act_fk_job_exception FOREIGN KEY (exception_stack_id_) REFERENCES act_ge_bytearray(id_);


--
-- Name: act_fk_memb_group; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY act_id_membership
    ADD CONSTRAINT act_fk_memb_group FOREIGN KEY (group_id_) REFERENCES act_id_group(id_);


--
-- Name: act_fk_memb_user; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY act_id_membership
    ADD CONSTRAINT act_fk_memb_user FOREIGN KEY (user_id_) REFERENCES act_id_user(id_);


--
-- Name: act_fk_model_deployment; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY act_re_model
    ADD CONSTRAINT act_fk_model_deployment FOREIGN KEY (deployment_id_) REFERENCES act_re_deployment(id_);


--
-- Name: act_fk_model_source; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY act_re_model
    ADD CONSTRAINT act_fk_model_source FOREIGN KEY (editor_source_value_id_) REFERENCES act_ge_bytearray(id_);


--
-- Name: act_fk_model_source_extra; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY act_re_model
    ADD CONSTRAINT act_fk_model_source_extra FOREIGN KEY (editor_source_extra_value_id_) REFERENCES act_ge_bytearray(id_);


--
-- Name: act_fk_task_exe; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY act_ru_task
    ADD CONSTRAINT act_fk_task_exe FOREIGN KEY (execution_id_) REFERENCES act_ru_execution(id_);


--
-- Name: act_fk_task_procdef; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY act_ru_task
    ADD CONSTRAINT act_fk_task_procdef FOREIGN KEY (proc_def_id_) REFERENCES act_re_procdef(id_);


--
-- Name: act_fk_task_procinst; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY act_ru_task
    ADD CONSTRAINT act_fk_task_procinst FOREIGN KEY (proc_inst_id_) REFERENCES act_ru_execution(id_);


--
-- Name: act_fk_tskass_task; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY act_ru_identitylink
    ADD CONSTRAINT act_fk_tskass_task FOREIGN KEY (task_id_) REFERENCES act_ru_task(id_);


--
-- Name: act_fk_var_bytearray; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY act_ru_variable
    ADD CONSTRAINT act_fk_var_bytearray FOREIGN KEY (bytearray_id_) REFERENCES act_ge_bytearray(id_);


--
-- Name: act_fk_var_exe; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY act_ru_variable
    ADD CONSTRAINT act_fk_var_exe FOREIGN KEY (execution_id_) REFERENCES act_ru_execution(id_);


--
-- Name: act_fk_var_procinst; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY act_ru_variable
    ADD CONSTRAINT act_fk_var_procinst FOREIGN KEY (proc_inst_id_) REFERENCES act_ru_execution(id_);


--
-- Name: fk_alf_ace_auth; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY alf_access_control_entry
    ADD CONSTRAINT fk_alf_ace_auth FOREIGN KEY (authority_id) REFERENCES alf_authority(id);


--
-- Name: fk_alf_ace_ctx; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY alf_access_control_entry
    ADD CONSTRAINT fk_alf_ace_ctx FOREIGN KEY (context_id) REFERENCES alf_ace_context(id);


--
-- Name: fk_alf_ace_perm; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY alf_access_control_entry
    ADD CONSTRAINT fk_alf_ace_perm FOREIGN KEY (permission_id) REFERENCES alf_permission(id);


--
-- Name: fk_alf_acl_acs; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY alf_access_control_list
    ADD CONSTRAINT fk_alf_acl_acs FOREIGN KEY (acl_change_set) REFERENCES alf_acl_change_set(id);


--
-- Name: fk_alf_aclm_ace; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY alf_acl_member
    ADD CONSTRAINT fk_alf_aclm_ace FOREIGN KEY (ace_id) REFERENCES alf_access_control_entry(id);


--
-- Name: fk_alf_aclm_acl; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY alf_acl_member
    ADD CONSTRAINT fk_alf_aclm_acl FOREIGN KEY (acl_id) REFERENCES alf_access_control_list(id);


--
-- Name: fk_alf_aud_app_an; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY alf_audit_app
    ADD CONSTRAINT fk_alf_aud_app_an FOREIGN KEY (app_name_id) REFERENCES alf_prop_value(id);


--
-- Name: fk_alf_aud_app_dis; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY alf_audit_app
    ADD CONSTRAINT fk_alf_aud_app_dis FOREIGN KEY (disabled_paths_id) REFERENCES alf_prop_root(id);


--
-- Name: fk_alf_aud_app_mod; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY alf_audit_app
    ADD CONSTRAINT fk_alf_aud_app_mod FOREIGN KEY (audit_model_id) REFERENCES alf_audit_model(id) ON DELETE CASCADE;


--
-- Name: fk_alf_aud_ent_app; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY alf_audit_entry
    ADD CONSTRAINT fk_alf_aud_ent_app FOREIGN KEY (audit_app_id) REFERENCES alf_audit_app(id) ON DELETE CASCADE;


--
-- Name: fk_alf_aud_ent_pro; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY alf_audit_entry
    ADD CONSTRAINT fk_alf_aud_ent_pro FOREIGN KEY (audit_values_id) REFERENCES alf_prop_root(id);


--
-- Name: fk_alf_aud_ent_use; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY alf_audit_entry
    ADD CONSTRAINT fk_alf_aud_ent_use FOREIGN KEY (audit_user_id) REFERENCES alf_prop_value(id);


--
-- Name: fk_alf_aud_mod_cd; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY alf_audit_model
    ADD CONSTRAINT fk_alf_aud_mod_cd FOREIGN KEY (content_data_id) REFERENCES alf_content_data(id);


--
-- Name: fk_alf_autha_ali; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY alf_authority_alias
    ADD CONSTRAINT fk_alf_autha_ali FOREIGN KEY (alias_id) REFERENCES alf_authority(id);


--
-- Name: fk_alf_autha_aut; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY alf_authority_alias
    ADD CONSTRAINT fk_alf_autha_aut FOREIGN KEY (auth_id) REFERENCES alf_authority(id);


--
-- Name: fk_alf_cass_cnode; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY alf_child_assoc
    ADD CONSTRAINT fk_alf_cass_cnode FOREIGN KEY (child_node_id) REFERENCES alf_node(id);


--
-- Name: fk_alf_cass_pnode; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY alf_child_assoc
    ADD CONSTRAINT fk_alf_cass_pnode FOREIGN KEY (parent_node_id) REFERENCES alf_node(id);


--
-- Name: fk_alf_cass_qnns; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY alf_child_assoc
    ADD CONSTRAINT fk_alf_cass_qnns FOREIGN KEY (qname_ns_id) REFERENCES alf_namespace(id);


--
-- Name: fk_alf_cass_tqn; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY alf_child_assoc
    ADD CONSTRAINT fk_alf_cass_tqn FOREIGN KEY (type_qname_id) REFERENCES alf_qname(id);


--
-- Name: fk_alf_cont_enc; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY alf_content_data
    ADD CONSTRAINT fk_alf_cont_enc FOREIGN KEY (content_encoding_id) REFERENCES alf_encoding(id);


--
-- Name: fk_alf_cont_enc_url; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY alf_content_url_encryption
    ADD CONSTRAINT fk_alf_cont_enc_url FOREIGN KEY (content_url_id) REFERENCES alf_content_url(id) ON DELETE CASCADE;


--
-- Name: fk_alf_cont_loc; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY alf_content_data
    ADD CONSTRAINT fk_alf_cont_loc FOREIGN KEY (content_locale_id) REFERENCES alf_locale(id);


--
-- Name: fk_alf_cont_mim; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY alf_content_data
    ADD CONSTRAINT fk_alf_cont_mim FOREIGN KEY (content_mimetype_id) REFERENCES alf_mimetype(id);


--
-- Name: fk_alf_cont_url; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY alf_content_data
    ADD CONSTRAINT fk_alf_cont_url FOREIGN KEY (content_url_id) REFERENCES alf_content_url(id);


--
-- Name: fk_alf_lock_excl; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY alf_lock
    ADD CONSTRAINT fk_alf_lock_excl FOREIGN KEY (excl_resource_id) REFERENCES alf_lock_resource(id);


--
-- Name: fk_alf_lock_shared; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY alf_lock
    ADD CONSTRAINT fk_alf_lock_shared FOREIGN KEY (shared_resource_id) REFERENCES alf_lock_resource(id);


--
-- Name: fk_alf_lockr_ns; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY alf_lock_resource
    ADD CONSTRAINT fk_alf_lockr_ns FOREIGN KEY (qname_ns_id) REFERENCES alf_namespace(id);


--
-- Name: fk_alf_nasp_n; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY alf_node_aspects
    ADD CONSTRAINT fk_alf_nasp_n FOREIGN KEY (node_id) REFERENCES alf_node(id);


--
-- Name: fk_alf_nasp_qn; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY alf_node_aspects
    ADD CONSTRAINT fk_alf_nasp_qn FOREIGN KEY (qname_id) REFERENCES alf_qname(id);


--
-- Name: fk_alf_nass_snode; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY alf_node_assoc
    ADD CONSTRAINT fk_alf_nass_snode FOREIGN KEY (source_node_id) REFERENCES alf_node(id);


--
-- Name: fk_alf_nass_tnode; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY alf_node_assoc
    ADD CONSTRAINT fk_alf_nass_tnode FOREIGN KEY (target_node_id) REFERENCES alf_node(id);


--
-- Name: fk_alf_nass_tqn; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY alf_node_assoc
    ADD CONSTRAINT fk_alf_nass_tqn FOREIGN KEY (type_qname_id) REFERENCES alf_qname(id);


--
-- Name: fk_alf_node_acl; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY alf_node
    ADD CONSTRAINT fk_alf_node_acl FOREIGN KEY (acl_id) REFERENCES alf_access_control_list(id);


--
-- Name: fk_alf_node_loc; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY alf_node
    ADD CONSTRAINT fk_alf_node_loc FOREIGN KEY (locale_id) REFERENCES alf_locale(id);


--
-- Name: fk_alf_node_store; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY alf_node
    ADD CONSTRAINT fk_alf_node_store FOREIGN KEY (store_id) REFERENCES alf_store(id);


--
-- Name: fk_alf_node_tqn; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY alf_node
    ADD CONSTRAINT fk_alf_node_tqn FOREIGN KEY (type_qname_id) REFERENCES alf_qname(id);


--
-- Name: fk_alf_node_txn; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY alf_node
    ADD CONSTRAINT fk_alf_node_txn FOREIGN KEY (transaction_id) REFERENCES alf_transaction(id);


--
-- Name: fk_alf_nprop_loc; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY alf_node_properties
    ADD CONSTRAINT fk_alf_nprop_loc FOREIGN KEY (locale_id) REFERENCES alf_locale(id);


--
-- Name: fk_alf_nprop_n; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY alf_node_properties
    ADD CONSTRAINT fk_alf_nprop_n FOREIGN KEY (node_id) REFERENCES alf_node(id);


--
-- Name: fk_alf_nprop_qn; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY alf_node_properties
    ADD CONSTRAINT fk_alf_nprop_qn FOREIGN KEY (qname_id) REFERENCES alf_qname(id);


--
-- Name: fk_alf_perm_tqn; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY alf_permission
    ADD CONSTRAINT fk_alf_perm_tqn FOREIGN KEY (type_qname_id) REFERENCES alf_qname(id);


--
-- Name: fk_alf_propln_key; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY alf_prop_link
    ADD CONSTRAINT fk_alf_propln_key FOREIGN KEY (key_prop_id) REFERENCES alf_prop_value(id) ON DELETE CASCADE;


--
-- Name: fk_alf_propln_root; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY alf_prop_link
    ADD CONSTRAINT fk_alf_propln_root FOREIGN KEY (root_prop_id) REFERENCES alf_prop_root(id) ON DELETE CASCADE;


--
-- Name: fk_alf_propln_val; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY alf_prop_link
    ADD CONSTRAINT fk_alf_propln_val FOREIGN KEY (value_prop_id) REFERENCES alf_prop_value(id) ON DELETE CASCADE;


--
-- Name: fk_alf_propuctx_p1; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY alf_prop_unique_ctx
    ADD CONSTRAINT fk_alf_propuctx_p1 FOREIGN KEY (prop1_id) REFERENCES alf_prop_root(id);


--
-- Name: fk_alf_propuctx_v1; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY alf_prop_unique_ctx
    ADD CONSTRAINT fk_alf_propuctx_v1 FOREIGN KEY (value1_prop_id) REFERENCES alf_prop_value(id) ON DELETE CASCADE;


--
-- Name: fk_alf_propuctx_v2; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY alf_prop_unique_ctx
    ADD CONSTRAINT fk_alf_propuctx_v2 FOREIGN KEY (value2_prop_id) REFERENCES alf_prop_value(id) ON DELETE CASCADE;


--
-- Name: fk_alf_propuctx_v3; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY alf_prop_unique_ctx
    ADD CONSTRAINT fk_alf_propuctx_v3 FOREIGN KEY (value3_prop_id) REFERENCES alf_prop_value(id) ON DELETE CASCADE;


--
-- Name: fk_alf_qname_ns; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY alf_qname
    ADD CONSTRAINT fk_alf_qname_ns FOREIGN KEY (ns_id) REFERENCES alf_namespace(id);


--
-- Name: fk_alf_store_root; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY alf_store
    ADD CONSTRAINT fk_alf_store_root FOREIGN KEY (root_node_id) REFERENCES alf_node(id);


--
-- Name: fk_alf_sub_node; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY alf_subscriptions
    ADD CONSTRAINT fk_alf_sub_node FOREIGN KEY (node_id) REFERENCES alf_node(id) ON DELETE CASCADE;


--
-- Name: fk_alf_sub_user; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY alf_subscriptions
    ADD CONSTRAINT fk_alf_sub_user FOREIGN KEY (user_node_id) REFERENCES alf_node(id) ON DELETE CASCADE;


--
-- Name: fk_alf_txn_svr; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY alf_transaction
    ADD CONSTRAINT fk_alf_txn_svr FOREIGN KEY (server_id) REFERENCES alf_server(id);


--
-- Name: fk_alf_usaged_n; Type: FK CONSTRAINT; Schema: public; Owner: alfresco
--

ALTER TABLE ONLY alf_usage_delta
    ADD CONSTRAINT fk_alf_usaged_n FOREIGN KEY (node_id) REFERENCES alf_node(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: SYSTEM
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM "SYSTEM";
GRANT ALL ON SCHEMA public TO "SYSTEM";
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

