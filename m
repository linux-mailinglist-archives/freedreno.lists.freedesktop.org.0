Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7F068FC28
	for <lists+freedreno@lfdr.de>; Thu,  9 Feb 2023 01:49:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EB0010E8CE;
	Thu,  9 Feb 2023 00:49:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A928810E8CE
 for <freedreno@lists.freedesktop.org>; Thu,  9 Feb 2023 00:49:24 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id ud5so1970295ejc.4
 for <freedreno@lists.freedesktop.org>; Wed, 08 Feb 2023 16:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1RglaXm5N69kUVYCKarAX7JE9iVuLrRcQ2ThI9YqYuU=;
 b=K3AF6YF0YLOOZUeZjDylZ6kNv9/b5IS0jeuibcHAftckIqrLt80BbCvYCenzFj7K2b
 /bHkJWJ9kzDMj1u/0FSdGpYKrueMsI26vtEFKENSybaOsyRw7mfThZAbnzHLPT0hktq6
 iKcjVq1YZyQpKrwu7nUHZNllsnIlPhQslDmRBh7PitBPLneIxjGncefUepzW7/9YUwx+
 nJgD01f7Ylo0IU2+0Yu0WSSFRyM1tFVoGGnoVrIBaJseGD7VUkTrD3cZ/P9wo8DcrxtO
 oZ5XFP+Tq/QjayukEXlDBbsjwaEHTzbW912cB5l+rmo1WODv897NLYGUInt9x+vEH5qd
 p6cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1RglaXm5N69kUVYCKarAX7JE9iVuLrRcQ2ThI9YqYuU=;
 b=GS2B7C6M8xKX+EWAKVDvlRurDhBaeysr2pKXgouhBHmdKj343j/XbSRJhr0wnTXNqq
 cIVcAoJfsNhSooDupKaMz7TDVB52ZaPll+LkRY7aJWc/mtHifE9IhhBL1cZSObBlpI/a
 nFcg2IMHCSvbT0q1XGVq197q3+DPRrkKd5Yqhff2e06G1mV/ccIHz4wDFOeSr6cJDNYY
 SCxjUNvdBMhONv71YexJQWByz3VKso4/lb0VqnvecwLuiX6P/NRTuCC5/6u9sHGmvUo9
 h75Z/oirM26y2DlLmy0qf+xR0laQtCwufGddavvWO5uKvlieLDMEu10ZG074SNVetFU2
 x/eQ==
X-Gm-Message-State: AO0yUKU6zWoRUnObs4zNC+DqSbg/xi2a7zIjGyxvYEC6Xt2eIUeQXaLl
 XsPX8eHR1FJm4someZ9U6jRv/Q==
X-Google-Smtp-Source: AK7set9Gg6FLBA8hjE15mRFDIXLSGDANHXY+Pz6749GMLjYJW6OH5JFNLzVKPyaOMa7PoIz02xhISA==
X-Received: by 2002:a17:906:1d13:b0:88f:8ae1:8bca with SMTP id
 n19-20020a1709061d1300b0088f8ae18bcamr10007205ejh.62.1675903763185; 
 Wed, 08 Feb 2023 16:49:23 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 m10-20020a170906580a00b0086f4b8f9e42sm156639ejq.65.2023.02.08.16.49.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 16:49:22 -0800 (PST)
Message-ID: <b24b95bb-be85-2079-724b-712f5da3af8c@linaro.org>
Date: Thu, 9 Feb 2023 02:49:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
 <20230203182132.1307834-23-dmitry.baryshkov@linaro.org>
 <7132b394-2e6a-20c8-fa64-3da082060226@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <7132b394-2e6a-20c8-fa64-3da082060226@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v3 22/27] drm/msm/dpu: rework
 dpu_plane_sspp_atomic_update()
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 07/02/2023 02:22, Abhinav Kumar wrote:
> 
> 
> On 2/3/2023 10:21 AM, Dmitry Baryshkov wrote:
>> Split pipe-dependent code from dpu_plane_sspp_atomic_update() into the
> 
> sspp-dependent?
> 
>> separate function dpu_plane_sspp_update_pipe(). This is one of
>> preparational steps to add r_pipe support.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Just a couple of minor comments below but otherwise this split up lgtm
> 
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 113 ++++++++++++----------
>>   1 file changed, 63 insertions(+), 50 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> index 0986e740b978..f94e132733f3 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> @@ -404,12 +404,13 @@ static void _dpu_plane_set_qos_ctrl(struct 
>> drm_plane *plane,
>>    * _dpu_plane_set_ot_limit - set OT limit for the given plane
>>    * @plane:        Pointer to drm plane
>>    * @pipe:        Pointer to software pipe
>> - * @crtc:        Pointer to drm crtc
>>    * @pipe_cfg:        Pointer to pipe configuration
>> + * @frame_rate:        CRTC's frame rate
> 
> Can you please check the spacing here. There seems to be an extra tab 
> before the CRTC's frame rate
> 
>>    */
>>   static void _dpu_plane_set_ot_limit(struct drm_plane *plane,
>>           struct dpu_sw_pipe *pipe,
>> -        struct drm_crtc *crtc, struct dpu_hw_sspp_cfg *pipe_cfg)
>> +        struct dpu_hw_sspp_cfg *pipe_cfg,
>> +        int frame_rate)
>>   {
>>       struct dpu_plane *pdpu = to_dpu_plane(plane);
>>       struct dpu_vbif_set_ot_params ot_params;
>> @@ -421,7 +422,7 @@ static void _dpu_plane_set_ot_limit(struct 
>> drm_plane *plane,
>>       ot_params.width = drm_rect_width(&pipe_cfg->src_rect);
>>       ot_params.height = drm_rect_height(&pipe_cfg->src_rect);
>>       ot_params.is_wfd = !pdpu->is_rt_pipe;
>> -    ot_params.frame_rate = drm_mode_vrefresh(&crtc->mode);
>> +    ot_params.frame_rate = frame_rate;
>>       ot_params.vbif_idx = VBIF_RT;
>>       ot_params.clk_ctrl = pipe->sspp->cap->clk_ctrl;
>>       ot_params.rd = true;
>> @@ -457,26 +458,6 @@ static void _dpu_plane_set_qos_remap(struct 
>> drm_plane *plane,
>>       dpu_vbif_set_qos_remap(dpu_kms, &qos_params);
>>   }
>> -static void _dpu_plane_set_scanout(struct drm_plane *plane,
>> -        struct dpu_plane_state *pstate,
>> -        struct drm_framebuffer *fb)
>> -{
>> -    struct dpu_plane *pdpu = to_dpu_plane(plane);
>> -    struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
>> -    struct msm_gem_address_space *aspace = kms->base.aspace;
>> -    struct dpu_hw_fmt_layout layout;
>> -    int ret;
>> -
>> -    ret = dpu_format_populate_layout(aspace, fb, &layout);
>> -    if (ret)
>> -        DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
>> -    else if (pstate->pipe.sspp->ops.setup_sourceaddress) {
>> -        trace_dpu_plane_set_scanout(&pstate->pipe,
>> -                        &layout);
>> -        pstate->pipe.sspp->ops.setup_sourceaddress(&pstate->pipe, 
>> &layout);
>> -    }
>> -}
>> -
>>   static void _dpu_plane_setup_scaler3(struct dpu_hw_sspp *pipe_hw,
>>           uint32_t src_w, uint32_t src_h, uint32_t dst_w, uint32_t dst_h,
>>           struct dpu_hw_scaler3_cfg *scale_cfg,
>> @@ -1102,35 +1083,25 @@ void dpu_plane_set_error(struct drm_plane 
>> *plane, bool error)
>>       pdpu->is_error = error;
>>   }
>> -static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>> +static void dpu_plane_sspp_update_pipe(struct drm_plane *plane,
>> +                       struct dpu_sw_pipe *pipe,
>> +                       struct dpu_hw_sspp_cfg *pipe_cfg,
> 
> You can call this parameter sspp_cfg instead of pipe_cfg?

I think, I'll add a commit renaming dpu_hw_sspp_cfg to dpu_sw_pipe_cfg, 
it would be simmetrical to dpu_sw_pipe then.

-- 
With best wishes
Dmitry

