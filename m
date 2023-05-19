Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC57709C4A
	for <lists+freedreno@lfdr.de>; Fri, 19 May 2023 18:21:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15CF610E04A;
	Fri, 19 May 2023 16:21:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 146B210E04A
 for <freedreno@lists.freedesktop.org>; Fri, 19 May 2023 16:21:29 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34JEhUgS028820
 for <freedreno@lists.freedesktop.org>; Fri, 19 May 2023 16:21:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=kGh64p6bqWVe0YD6kvV7eCtZ3yfJpgxF/fU+0jOBjGs=;
 b=coX5+bsMdaUBIapf+u4ezIfMfilJ1HLMqSQnExzMxKjCsEKSmp/6CGngeopdIB7n9v9/
 0NdYkcD+IwQogNJ3VNXbisy/vgDowPgSRpInoqxr8T8oOWiRanm8Kt98HzNDEX1bqyhM
 hReQ4fi0hfKjwdfvQK9RAlokVtw+OmdeOI3qop2U0+sS2u2Zw2M5tMZKj2+ly9jXr2aK
 tDdPRzNY6QaZmlkiVETqCYYIMSZ+phPd1WtXEuKL80B4KNBgTyKXi+8sZtHrMDM3e2er
 ntfYAM/ivHhfM5W/kSJW6X36zpCOfkvKfKxRCZ5Iw1qMSuPviRXrEzthwvm/KFyJQuZi 9Q== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qp4ccs6y2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 19 May 2023 16:21:29 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34JGLSxp022072
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 19 May 2023 16:21:28 GMT
Received: from [10.110.69.155] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 19 May
 2023 09:21:28 -0700
Message-ID: <62f0cdb9-af80-4ff4-0621-21a041ee2f16@quicinc.com>
Date: Fri, 19 May 2023 09:21:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: <freedreno@lists.freedesktop.org>
References: <1684360919-28458-1-git-send-email-quic_khsieh@quicinc.com>
 <1684360919-28458-7-git-send-email-quic_khsieh@quicinc.com>
 <evkla3rkf4tge6gln4lgtulj7q5gt6vef3i2yqupc5lj2oszfx@7ttyxzlmvet5>
 <8e9feb23-a5f0-7cd8-ebff-8e9097ff0ca1@quicinc.com>
 <b2fcc9f5-ca11-ab87-e40b-9c6d2662325b@linaro.org>
 <ku27atp4yqkpmz7g4ttylvzd43jmu4cwcs76nqgzramgxetjna@bu76f4c73724>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <ku27atp4yqkpmz7g4ttylvzd43jmu4cwcs76nqgzramgxetjna@bu76f4c73724>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: fjw0O8CedXnomqkaQCc317kJ_K7DuMtU
X-Proofpoint-ORIG-GUID: fjw0O8CedXnomqkaQCc317kJ_K7DuMtU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-19_11,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 impostorscore=0 spamscore=0 bulkscore=0
 phishscore=0 mlxlogscore=679 suspectscore=0 malwarescore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305190139
Subject: Re: [Freedreno] [PATCH v10 6/8] drm/msm/dpu: separate DSC flush
 update out of interface
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On 5/19/2023 5:04 AM, Marijn Suijten wrote:
> On 2023-05-19 01:40:19, Dmitry Baryshkov wrote:
>> On 19/05/2023 01:09, Kuogee Hsieh wrote:
>>> On 5/17/2023 3:31 PM, Marijn Suijten wrote:
>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>>>>> @@ -139,6 +139,11 @@ static inline void
>>>>> dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
>>>>>                    CTL_DSPP_n_FLUSH(dspp - DSPP_0),
>>>>>                    ctx->pending_dspp_flush_mask[dspp - DSPP_0]);
>>>>>            }
>>>>> +
>>>>> +    if (ctx->pending_flush_mask & BIT(DSC_IDX))
>>>>> +        DPU_REG_WRITE(&ctx->hw, CTL_DSC_FLUSH,
>>>>> +                  ctx->pending_dsc_flush_mask);
>>>> Again, when do we reset this mask to 0?  (v8 review)
>>> can not find it.
>>>
>>> let me add a separate  patch to fix this.
>> The pending_dsc_flush_mask was added in this patch, so the reset should
>> be a part of this patch too.
> Yes, same patch.
yes, i keep pending_dsc_flush_mask = 0; at this patch at V11
>
> Related question I asked in v8: only the global pending_flush_mask and
> pending_dspp_flush_mask are reset in dpu_hw_ctl_clear_pending_flush().
> Shall I send a patch to clear the other missing ones (e.g. merge_3d etc)
> as well?
at v11, I had add separate  patch to clear missing ones.
>>>>> +
>>>>>        DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, ctx->pending_flush_mask);
>>>>>    }
>>>>> @@ -285,6 +290,13 @@ static void
>>>>> dpu_hw_ctl_update_pending_flush_merge_3d_v1(struct dpu_hw_ctl *ctx,
>>>>>        ctx->pending_flush_mask |= BIT(MERGE_3D_IDX);
>>>>>    }
>>>>> +static void dpu_hw_ctl_update_pending_flush_dsc_v1(struct dpu_hw_ctl
>>>>> *ctx,
>>>>> +                           enum dpu_dsc dsc_num)
>>>>> +{
>>>>> +    ctx->pending_dsc_flush_mask |= BIT(dsc_num - DSC_0);
>>>>> +    ctx->pending_flush_mask |= BIT(DSC_IDX);
>>>>> +}
>>>>> +
>>>>>    static void dpu_hw_ctl_update_pending_flush_dspp(struct dpu_hw_ctl
>>>>> *ctx,
>>>>>        enum dpu_dspp dspp, u32 dspp_sub_blk)
>>>>>    {
>>>>> @@ -502,9 +514,6 @@ static void dpu_hw_ctl_intf_cfg_v1(struct
>>>>> dpu_hw_ctl *ctx,
>>>>>        if ((test_bit(DPU_CTL_VM_CFG, &ctx->caps->features)))
>>>>>            mode_sel = CTL_DEFAULT_GROUP_ID  << 28;
>>>>> -    if (cfg->dsc)
>>>>> -        DPU_REG_WRITE(&ctx->hw, CTL_DSC_FLUSH, cfg->dsc);
>>>>> -
>>>>>        if (cfg->intf_mode_sel == DPU_CTL_MODE_SEL_CMD)
>>>>>            mode_sel |= BIT(17);
>>>>> @@ -524,10 +533,9 @@ static void dpu_hw_ctl_intf_cfg_v1(struct
>>>>> dpu_hw_ctl *ctx,
>>>>>        if (cfg->merge_3d)
>>>>>            DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE,
>>>>>                      BIT(cfg->merge_3d - MERGE_3D_0));
>>>>> -    if (cfg->dsc) {
>>>>> -        DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, DSC_IDX);
>>>> Again, this bugfix of now wrapping DSC_IDX in BIT() should go in a
>>>> separate Fixes: patch to have this semantic change documented.  (v8
>>>> review)
>>> That will be this patch. let me add Fixes at this patch
>> _separate_ patch.
> Separate patch, and documenting clearly what happens and why.  Kuogee, I
> can send this as well if it makes things more clear, since it doesn't
> seem (from the patch description) that anyone noticed the
> implication/bugfix in this change as a drive-by effect of porting
> sde_hw_ctl_update_bitmask_dsc_v1() from downstream.
>
> - Marijn

The problem is a create a separate patch to delete 
DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, DSC_IDX), then this patch will break 
dsc function.

So that I keep this within same patch.

please confirm you still want a separate patch to delete 
DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, DSC_IDX).

>
> <snip>
