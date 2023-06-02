Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD49720AD1
	for <lists+freedreno@lfdr.de>; Fri,  2 Jun 2023 23:07:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DB2B10E64C;
	Fri,  2 Jun 2023 21:07:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5F2410E646
 for <freedreno@lists.freedesktop.org>; Fri,  2 Jun 2023 21:06:58 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4f3b5881734so3513826e87.0
 for <freedreno@lists.freedesktop.org>; Fri, 02 Jun 2023 14:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685740016; x=1688332016;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FZY6Tt5IZ5A+5zg8XVdaalYb7Rc3l0aJEXOzk1+13EI=;
 b=qF+bhnweMlxUE5tMsdJSEmsva6y1Acdv9/Pl2Xb+5vffPjKXfchND+T/BSX0waLc8f
 4JJ6qrgkZ/ESMJbeCQYSwrvzRbIkX3K+IOF8Tk2wit+I+YwlwLsiZsI/YItfbuAiOLwa
 oHSDg9S+IbcN1nt8OsPdfxS7JNqDEg+jqbdhVt1tfFt/5qvzIHswxAglhHRW476vfXtv
 SGUtJKH2fgwdS4qV2q0LfBHQnSs2fxeLbD5iA0+BdLPXevkGRVD4oN6M7Yed2mMRqonm
 A9PQT0W023ppy9NiEIkpK820sT8Q8YRjjwjDDogeuve2QkST/JeXwyTSYW+TGkT5Pnl2
 XeSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685740016; x=1688332016;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FZY6Tt5IZ5A+5zg8XVdaalYb7Rc3l0aJEXOzk1+13EI=;
 b=SqqPDolNXfWSq0P0QlSNSXkHMzwpqS2zqljYw2JSwf/BUvuLTurQOl4mHcXOH+wlKQ
 X44JtWwQoouSUWNvzUPyIwQQ4g+INJXB4bFyLSGYln7xGqwRGyLOclRQalJW8wnnlRuY
 81h2CV6sbzgvj/jj6m+Ym3fM8GOeYjWKfAPZx27jeTPI9/ztlSy7hKZJ2v8eW/l/08hT
 lQhCgumN1m9kYgPAifQPyE90FZLb/J0ne/b89dk49IDMAVUgJIyHGS0Quc1NRepRSmMV
 MBbEfQ48aSdStWSz7kMyMNqBfokOCXAtmp7JtwGiiS8CX/7JN+ui/hD2LFxRz93qFTOY
 Io+g==
X-Gm-Message-State: AC+VfDyH3DykxjkKRZTZjp7U9H9rPl8DKnB5XbKRiG2TyGQaxxiKSmOR
 7Q5alU4upQUYbZ4gX1JVOp4OlUk+EIbNHC4o4Sc=
X-Google-Smtp-Source: ACHHUZ42otg7uQiKzPc4sKqxsgEV0OBgAmca+U/kDI65CdNp3moBFvtzsI3SlVww5rV2YOCccrWCjg==
X-Received: by 2002:ac2:539c:0:b0:4f4:d383:4d6b with SMTP id
 g28-20020ac2539c000000b004f4d3834d6bmr2576794lfh.6.1685740016475; 
 Fri, 02 Jun 2023 14:06:56 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 u15-20020a056512094f00b004f24ee39661sm273833lft.137.2023.06.02.14.06.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Jun 2023 14:06:55 -0700 (PDT)
Message-ID: <8c40574e-ac0b-25ae-c7ed-cc24706f818a@linaro.org>
Date: Sat, 3 Jun 2023 00:06:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, freedreno@lists.freedesktop.org
References: <1685657331-23280-1-git-send-email-quic_khsieh@quicinc.com>
 <1685657331-23280-2-git-send-email-quic_khsieh@quicinc.com>
 <4011108d-1c1a-c648-244f-5414e9465d80@linaro.org>
 <49155554-1efe-0d44-a43b-ff09182c647f@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <49155554-1efe-0d44-a43b-ff09182c647f@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 02/06/2023 18:51, Kuogee Hsieh wrote:
> 
> 
>>>       }
>>>   +    index = dpu_enc->disp_info.h_tile_instance[0];
>>> +        if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI)
>>> +        dpu_enc->dsc = msm_dsi_get_dsc_config(priv->dsi[index]);
>>
>> As discussed previously, one should not write to non-state objects 
>> from atomic_check. This chunk does.
> 
> yes, i did think about not to assign dsc here as we had discussed.
> 
> but the get_topology() below did need to know whether dsc is present or 
> not.
> 
> otherwise, i have to create a local variable to pass into get_topology() 
> function.
> 
> The dsc is assigned here but not yet be used.

This is all not relevant. You should not assign dpu_enc->dsc here, full 
stop. I thought I have explained why.

> 
> 
>>
>> Not to mention that this will start exploding once you try adding DP 
>> next to it.
>>
>> Please abstain from posting next revisions until the discussions on 
>> the previous one are more or less finished. For now this is NAK.
>>
>> Not to mention that this patch doesn't pass checkpatch.pl.
>>
>>> +
>>>       topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, 
>>> crtc_state);
>>>         /*
>>> @@ -1034,7 +1038,7 @@ static void 
>>> dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>>>       struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
>>>       int num_lm, num_ctl, num_pp, num_dsc;
>>>       unsigned int dsc_mask = 0;
>>> -    int i;
>>> +    int index, i;
>>>         if (!drm_enc) {
>>>           DPU_ERROR("invalid encoder\n");
>>> @@ -1055,6 +1059,10 @@ static void 
>>> dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>>>         trace_dpu_enc_mode_set(DRMID(drm_enc));
>>>   +    index = dpu_enc->disp_info.h_tile_instance[0];
>>> +        if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI)
>>> +        dpu_enc->dsc = msm_dsi_get_dsc_config(priv->dsi[index]);
>>
>> Doesn't this seem 100% same as the previous chunk? Doesn't it plead to 
>> be extracted to a helper function?
>>
>>> +
>>>       /* Query resource that have been reserved in atomic check step. */
>>>       num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
>>>           drm_enc->base.id, DPU_HW_BLK_PINGPONG, hw_pp,
>>> @@ -2121,8 +2129,10 @@ void dpu_encoder_helper_phys_cleanup(struct 
>>> dpu_encoder_phys *phys_enc)
>>>                       phys_enc->hw_pp->merge_3d->idx);
>>>       }
>>>   -    if (dpu_enc->dsc)
>>> +    if (dpu_enc->dsc) {
>>>           dpu_encoder_unprep_dsc(dpu_enc);
>>> +        dpu_enc->dsc = NULL;
>>> +    }
>>>         intf_cfg.stream_sel = 0; /* Don't care value for video mode */
>>>       intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
>>

-- 
With best wishes
Dmitry

