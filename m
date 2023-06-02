Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 167C7720687
	for <lists+freedreno@lfdr.de>; Fri,  2 Jun 2023 17:51:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8CA210E209;
	Fri,  2 Jun 2023 15:51:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23A0D10E209
 for <freedreno@lists.freedesktop.org>; Fri,  2 Jun 2023 15:51:39 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 352Elml6012802
 for <freedreno@lists.freedesktop.org>; Fri, 2 Jun 2023 15:51:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=gkzRpPu46ZMtDsELq2warX7foZXNEp9ImauPBiS2rDk=;
 b=Im0WPdRp3P9TqYlUyg0c4BwzQz84I1R6H0CFd6oGK2eRuSMZmF52pklYXlGOzMteptWG
 os2qUDO4wYq2H4zsJfmdUQGsiF0b0FLiBvJUCoTSP0GGyxVafKiczybj8H6EhFLJV+Iq
 2qcVx4Dz49F9FJI62aIrc63pkD6jlK7ESXHaC5sMDHE4y7Z22lqonCv/VTj1nt4ksrwS
 i7GI4KZWbhnEaHskPjtPrVzARztF/AxAf+JCSqAu4LxDkCFncHEcduk+oM6ODpvre4cD
 C65OpCKbNJe0BVx/QrHnL3laB9U0qSpsHv6vaLmOsuq2QH4tzA2ISgbv8sfwUVnYKRNu Nw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qy2v11xa1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 02 Jun 2023 15:51:38 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 352FpbXo031386
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 2 Jun 2023 15:51:37 GMT
Received: from [10.110.100.27] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 2 Jun 2023
 08:51:36 -0700
Message-ID: <49155554-1efe-0d44-a43b-ff09182c647f@quicinc.com>
Date: Fri, 2 Jun 2023 08:51:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US
To: <freedreno@lists.freedesktop.org>
References: <1685657331-23280-1-git-send-email-quic_khsieh@quicinc.com>
 <1685657331-23280-2-git-send-email-quic_khsieh@quicinc.com>
 <4011108d-1c1a-c648-244f-5414e9465d80@linaro.org>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <4011108d-1c1a-c648-244f-5414e9465d80@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: AuUATACr6H2QfSGS-X12wS2j09vMrSYO
X-Proofpoint-GUID: AuUATACr6H2QfSGS-X12wS2j09vMrSYO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-02_11,2023-06-02_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 bulkscore=0 mlxlogscore=845
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306020120
Subject: Re: [Freedreno] [PATCH v2 1/2] drm/msm/dpu: retrieve DSI DSC struct
 at atomic_check()
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



>>       }
>>   +    index = dpu_enc->disp_info.h_tile_instance[0];
>> +        if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI)
>> +        dpu_enc->dsc = msm_dsi_get_dsc_config(priv->dsi[index]);
>
> As discussed previously, one should not write to non-state objects 
> from atomic_check. This chunk does.

yes, i did think about not to assign dsc here as we had discussed.

but the get_topology() below did need to know whether dsc is present or not.

otherwise, i have to create a local variable to pass into get_topology() 
function.

The dsc is assigned here but not yet be used.


>
> Not to mention that this will start exploding once you try adding DP 
> next to it.
>
> Please abstain from posting next revisions until the discussions on 
> the previous one are more or less finished. For now this is NAK.
>
> Not to mention that this patch doesn't pass checkpatch.pl.
>
>> +
>>       topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, 
>> crtc_state);
>>         /*
>> @@ -1034,7 +1038,7 @@ static void 
>> dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>>       struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
>>       int num_lm, num_ctl, num_pp, num_dsc;
>>       unsigned int dsc_mask = 0;
>> -    int i;
>> +    int index, i;
>>         if (!drm_enc) {
>>           DPU_ERROR("invalid encoder\n");
>> @@ -1055,6 +1059,10 @@ static void 
>> dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>>         trace_dpu_enc_mode_set(DRMID(drm_enc));
>>   +    index = dpu_enc->disp_info.h_tile_instance[0];
>> +        if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI)
>> +        dpu_enc->dsc = msm_dsi_get_dsc_config(priv->dsi[index]);
>
> Doesn't this seem 100% same as the previous chunk? Doesn't it plead to 
> be extracted to a helper function?
>
>> +
>>       /* Query resource that have been reserved in atomic check step. */
>>       num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
>>           drm_enc->base.id, DPU_HW_BLK_PINGPONG, hw_pp,
>> @@ -2121,8 +2129,10 @@ void dpu_encoder_helper_phys_cleanup(struct 
>> dpu_encoder_phys *phys_enc)
>>                       phys_enc->hw_pp->merge_3d->idx);
>>       }
>>   -    if (dpu_enc->dsc)
>> +    if (dpu_enc->dsc) {
>>           dpu_encoder_unprep_dsc(dpu_enc);
>> +        dpu_enc->dsc = NULL;
>> +    }
>>         intf_cfg.stream_sel = 0; /* Don't care value for video mode */
>>       intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
>
