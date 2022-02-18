Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4229F4BBDC2
	for <lists+freedreno@lfdr.de>; Fri, 18 Feb 2022 17:46:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D93F10EE3C;
	Fri, 18 Feb 2022 16:46:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F77710EE3C
 for <freedreno@lists.freedesktop.org>; Fri, 18 Feb 2022 16:46:10 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id a42so5105238ljq.13
 for <freedreno@lists.freedesktop.org>; Fri, 18 Feb 2022 08:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=BoIYnMjL8gJwdF/bzCI8rR1UJqefH9/MYqh8v9Nayvo=;
 b=O6XFaAKIgaqGoZ/Y74CCudZnLB0E+6HDF/n+HkeZfuqLUBoeGYmxpf4/VkW9ZBSiDh
 c4PfR8mfzZLLrxtDaiL1gTWUg8XTs4joQmlXI9tcTsTwCkIBkrXZI4/ziPbAMRVT3N+f
 dIhj9G8hg2+Al0isg7KYppYvPwD/oo/jMMPhL0BZdoSsCz3wYA0aQFE1H33+0qtFg0Pg
 DlybY8bJa/KbXBh8ppK0suX24Mz/oLdFSfQCnKh2yWDOapEroTwat4VCe38F3o9zfslv
 om7re2RXMkbwLqYuLdbRkXa15kjveft40uY3NiAYzrro2WObuMfr2dOUqHw5Z+8V1+0B
 zicg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BoIYnMjL8gJwdF/bzCI8rR1UJqefH9/MYqh8v9Nayvo=;
 b=G/bg7bkdBHoY/eqCBTZBuZDtWquupiN1QjvlOghx0OMJUPGFN5wEwAtpBEjEszyvez
 PmWa8NxKfMNBMHevBSOyTd1Vtyqw/TVo2vW4YFGdqREEz5YQrho1v1ReDRpjHSwQ8hhC
 s/OwAIqgxdIMS0Q5o/pUlkJiVWJPZFoJJRjv/s3oYfEUOTtTuj7qxDKhvqJb5Wgoz6+N
 fiEWNL8LtfIMlPDif5aI4+yAoltzEgQYVhMBXjcPjwzojVuXfQoJ1Zyix3TIPRlO91Qy
 TUpUnViWUwH82oCAM9hq2w3HppJcxI3ADPNkZBRU4kXxspRgI3dMCRO1uwEL5NawetZY
 nTSA==
X-Gm-Message-State: AOAM533/KEYdDJ0QG7FWmwsz8MZn5gOKdvslcaW/a/7W2ELwvGZEk87E
 H1HOPgvgbedYzQPm9jvnHPom8g==
X-Google-Smtp-Source: ABdhPJwBH4MvSdmHLlkS1VMdQqcxyXk3soGbZt8vdIZZiablDAdGajyatE3o+Ktu6zHPDHZAut0vcQ==
X-Received: by 2002:a2e:b816:0:b0:23c:5d59:1837 with SMTP id
 u22-20020a2eb816000000b0023c5d591837mr6053831ljo.211.1645202768622; 
 Fri, 18 Feb 2022 08:46:08 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id e22sm371863ljb.17.2022.02.18.08.46.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Feb 2022 08:46:08 -0800 (PST)
Message-ID: <b854f7ab-6606-9305-ea3e-6ba728c60584@linaro.org>
Date: Fri, 18 Feb 2022 19:46:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Pavel Dubrova <pashadubrova@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Zhen Lei <thunder.leizhen@huawei.com>, Bernard <bernard@vivo.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20211222105513.44860-1-marijn.suijten@somainline.org>
 <84bd598c-b1b7-984e-9fa1-94ad28087ef0@linaro.org>
 <20220202094850.2asbry44vyh5xw2p@SoMainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220202094850.2asbry44vyh5xw2p@SoMainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: Bind pingpong block to intf on
 active ctls in cmd encoder
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

On 02/02/2022 12:48, Marijn Suijten wrote:
> On 2022-01-20 02:12:51, Dmitry Baryshkov wrote:
>> On 22/12/2021 13:55, Marijn Suijten wrote:
>>> As per the specification of DPU_CTL_ACTIVE_CFG the configuration of
>>> active blocks should be proactively specified, and the pingpong block is
>>> no different.
>>>
>>> The downstream display driver [1] confirms this by also calling
>>> bind_pingpong_blk on CTL_ACTIVE_CFG.  Note that this else-if is always
>>> entered, as setup_intf_cfg - unlike this mainline dpu driver that
>>> combines both behind the same function pointer - is left NULL in favour
>>> of using setup_intf_cfg_v1 when CTL_ACTIVE_CFG is set.
>>>
>>> This solves continuous timeouts on at least the Qualcomm sm6125 SoC:
>>>
>>>       [drm:dpu_encoder_frame_done_timeout:2091] [dpu error]enc31 frame done timeout
>>>       [drm:_dpu_encoder_phys_cmd_handle_ppdone_timeout.isra.0] *ERROR* id:31 pp:0 kickoff timeout 0 cnt 1 koff_cnt 1
>>>       [drm:dpu_encoder_phys_cmd_prepare_for_kickoff] *ERROR* failed wait_for_idle: id:31 ret:-110 pp:0
>>>
>>> In the same way this pingpong block should also be unbound followed by
>>> an interface flush when the encoder is disabled, according to the
>>> downstream display driver [2].
>>>
>>> [1]: https://source.codeaurora.org/quic/la/platform/vendor/opensource/display-drivers/tree/msm/sde/sde_encoder_phys_cmd.c?h=LA.UM.9.16.r1-08500-MANNAR.0#n167
>>> [2]: https://source.codeaurora.org/quic/la/platform/vendor/opensource/display-drivers/tree/msm/sde/sde_encoder.c?h=LA.UM.9.16.r1-08500-MANNAR.0#n2986
>>>
>>> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
>>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>
>>> ---
>>>    .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 21 +++++++++++++++++++
>>>    1 file changed, 21 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>>> index 8e433af7aea4..e0e08a874f07 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>>> @@ -71,6 +71,13 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
>>>    	intf_cfg.stream_sel = cmd_enc->stream_sel;
>>>    	intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
>>>    	ctl->ops.setup_intf_cfg(ctl, &intf_cfg);
>>> +
>>> +	/* setup which pp blk will connect to this intf */
>>> +	if (test_bit(DPU_CTL_ACTIVE_CFG, &ctl->caps->features) && phys_enc->hw_intf->ops.bind_pingpong_blk)
>>
>> Nit: here we bind all interfaces, but later we unbind only master. Is
>> this correct?
> 
> Not sure: it seems downstream only calls
> _sde/dpu_encoder_phys_cmd_update_intf_cfg when it is _not_ a ppsplit
> slave, which appears to be very similar to being the master (both check
> for ENC_ROLE_SLAVE but ppsplit also checks RM topology support for
> ppsplit).  Should we do this too before calling
> _dpu_encoder_phys_cmd_update_intf_cfg?

The PP split is a special topology using a single LM, but two PP (and 
two INTFs). The dpu driver doesn't provide support for it, so ppsplit is 
always false.


> 
> - Marijn
> 
>>> +		phys_enc->hw_intf->ops.bind_pingpong_blk(
>>> +				phys_enc->hw_intf,
>>> +				true,
>>> +				phys_enc->hw_pp->idx);
>>>    }
>>>    
>>>    static void dpu_encoder_phys_cmd_pp_tx_done_irq(void *arg, int irq_idx)
>>> @@ -507,6 +514,7 @@ static void dpu_encoder_phys_cmd_disable(struct dpu_encoder_phys *phys_enc)
>>>    {
>>>    	struct dpu_encoder_phys_cmd *cmd_enc =
>>>    		to_dpu_encoder_phys_cmd(phys_enc);
>>> +	struct dpu_hw_ctl *ctl;
>>>    
>>>    	if (!phys_enc->hw_pp) {
>>>    		DPU_ERROR("invalid encoder\n");
>>> @@ -523,6 +531,19 @@ static void dpu_encoder_phys_cmd_disable(struct dpu_encoder_phys *phys_enc)
>>>    
>>>    	if (phys_enc->hw_pp->ops.enable_tearcheck)
>>>    		phys_enc->hw_pp->ops.enable_tearcheck(phys_enc->hw_pp, false);
>>> +
>>> +	if (dpu_encoder_phys_cmd_is_master(phys_enc)) {

Please remove this condition. Just check for existence of bind_pingpong_blk.

>>> +		if (phys_enc->hw_intf->ops.bind_pingpong_blk) {
>>> +			phys_enc->hw_intf->ops.bind_pingpong_blk(
>>> +					phys_enc->hw_intf,
>>> +					false,
>>> +					phys_enc->hw_pp->idx);
>>> +
>>> +			ctl = phys_enc->hw_ctl;
>>> +			ctl->ops.update_pending_flush_intf(ctl, phys_enc->intf_idx);
>>> +		}
>>> +	}
>>> +
>>>    	phys_enc->enable_state = DPU_ENC_DISABLED;
>>>    }
>>>    
>>
>>
>> -- 
>> With best wishes
>> Dmitry


-- 
With best wishes
Dmitry
