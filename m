Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC17736B00
	for <lists+freedreno@lfdr.de>; Tue, 20 Jun 2023 13:31:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A15710E2D7;
	Tue, 20 Jun 2023 11:31:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB0F210E2D1
 for <freedreno@lists.freedesktop.org>; Tue, 20 Jun 2023 11:31:27 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2b45bc83f26so61841291fa.0
 for <freedreno@lists.freedesktop.org>; Tue, 20 Jun 2023 04:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687260686; x=1689852686;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aDxfzPG3BOxW5AFNg/aSVyS5B9aGxRt1nkVYihPn0Yk=;
 b=alSM/vxuP5uN9v6SwhS5TFMKdBopDKbO3YrENG2boz69kNFuVTkxJmgrgMyKX6AqYn
 TqEvAdj6fvuv30MQV1AtRpj+NLOlxoyTRJ2hOurw6s/t+K20slUa2JOz+1dXKwrktOA5
 NJLxwkbxJM89h5OpDNxGFwxIp40L2O7N9oUZgM2PUXcvZU/cMYLMeQE51w1vzZlL+pxu
 7tzq1Hx8cvThuknum4dHF7U+mT/8Bm/T3T1ihoLY0m5XTf5P7Q1doznIyqi9IsBm3Tx8
 yrC4N85q0y1TgPJdF7dJzO32DZaGd+vppwn4IKlcRUxB7qRyxq/qV4JxdgBostsFrqFT
 pS/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687260686; x=1689852686;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aDxfzPG3BOxW5AFNg/aSVyS5B9aGxRt1nkVYihPn0Yk=;
 b=iggPyDhljVtd4AGdTvoP1+MGLdslEFR6gEzonhaOrCXm3gLMePZbvAK6qTSysltljH
 phjj1+TG3lYyZwt0iLNx6rgYsDIpu7B/ZZqhrucUnu2ttMIG0Gn49CEitk6p/Idg0aDb
 mDf9jZ1YE8weWfrztQfM1eRKDHiMY7xd4geAtR25XKnUaBnMhUXPI6ugBxdNgZW/Mk48
 OcgZaZg7Dge7caAPZTEs85uE2S9VUQNFc1QjKmSv5oUjgg6G+2MX4Zo2OVSOojbT+zaG
 80p+YBsWUdsWDvF+gbhmz7UzS2zzXgthqDIlIFrVZH/tsXEzIexIghduA/xxSDl/zu1r
 tw8A==
X-Gm-Message-State: AC+VfDzf/OwVDBI6wYVy+y8MnR9JLSE5lSV/MzSGppVOuH43RF8CIVpt
 YPidoISiMETfwIC3VFJHiMoiVQ==
X-Google-Smtp-Source: ACHHUZ6xomCvd2KYakW73nLYx83P6kpxBuij4YdQMdaTB3qN00lUD7E05+jTxmGiqxd+Q5W8DEEKlQ==
X-Received: by 2002:a2e:914b:0:b0:2b4:7256:f9c3 with SMTP id
 q11-20020a2e914b000000b002b47256f9c3mr4268284ljg.13.1687260685992; 
 Tue, 20 Jun 2023 04:31:25 -0700 (PDT)
Received: from [192.168.1.101] (abxj193.neoplus.adsl.tpnet.pl. [83.9.3.193])
 by smtp.gmail.com with ESMTPSA id
 t11-20020a2e780b000000b002a8bc9918d4sm373583ljc.97.2023.06.20.04.31.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jun 2023 04:31:25 -0700 (PDT)
Message-ID: <fc2e34f1-749f-22df-5af6-40da91f26c45@linaro.org>
Date: Tue, 20 Jun 2023 13:31:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230620000846.946925-1-dmitry.baryshkov@linaro.org>
 <20230620000846.946925-7-dmitry.baryshkov@linaro.org>
 <bc192a59-f8a1-2786-670c-cd56737dfdba@linaro.org>
 <CAA8EJpo6KVnQO-K8ftyaSe+xyN6-RC_QNXfx5v890=S10jExNQ@mail.gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAA8EJpo6KVnQO-K8ftyaSe+xyN6-RC_QNXfx5v890=S10jExNQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 6/8] drm/msm/dpu: use dpu_perf_cfg in DPU
 core_perf code
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
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 20.06.2023 13:18, Dmitry Baryshkov wrote:
> On 20/06/2023 13:55, Konrad Dybcio wrote:
>> On 20.06.2023 02:08, Dmitry Baryshkov wrote:
>>> Simplify dpu_core_perf code by using only dpu_perf_cfg instead of using
>>> full-featured catalog data.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>> Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>
>> Check below.
>>
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 52 ++++++++-----------
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  8 +--
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  2 +-
>>>   3 files changed, 27 insertions(+), 35 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
>>> index 773e641eab28..78a7e3ea27a4 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
>>> @@ -19,11 +19,11 @@
>>>
>>>   /**
>>>    * _dpu_core_perf_calc_bw() - to calculate BW per crtc
>>> - * @kms:  pointer to the dpu_kms
>>> + * @perf_cfg: performance configuration
>>>    * @crtc: pointer to a crtc
>>>    * Return: returns aggregated BW for all planes in crtc.
>>>    */
>>> -static u64 _dpu_core_perf_calc_bw(struct dpu_kms *kms,
>>> +static u64 _dpu_core_perf_calc_bw(const struct dpu_perf_cfg *perf_cfg,
>>>              struct drm_crtc *crtc)
>>>   {
>>>      struct drm_plane *plane;
>>> @@ -39,7 +39,7 @@ static u64 _dpu_core_perf_calc_bw(struct dpu_kms *kms,
>>>              crtc_plane_bw += pstate->plane_fetch_bw;
>>>      }
>>>
>>> -    bw_factor = kms->catalog->perf->bw_inefficiency_factor;
>>> +    bw_factor = perf_cfg->bw_inefficiency_factor;
>> It's set to 120 for all SoCs.. and it sounds very much like some kind of a
>> hack.
>>
>> The 105 on the other inefficiency factor is easy to spot:
>>
>> (1024/1000)^2 = 1.048576 =~= 1.05 = 105%
>>
>> It comes from a MiB-MB-MHz conversion that Qcom splattered all over
>> downstream as due to ancient tragical design decisions in msmbus
>> (which leak to the downstream interconnect a bit):
> 
> This doesn't describe, why msm8226 and msm8974 had qcom,mdss-clk-factor
> of 5/4. And 8084 got 1.05 as usual. I can only suppose that MDSS 1.0
> (8974 v1) and 1.1 (8226) had some internal inefficiency / issues.
> 
> Also, this 1.05 is a clock inefficiency, so it should not be related
> to msm bus client code.
Right. Maybe Abhinav could shed some light on this.

Konrad
> 
>>
>> The logic needs to get some input that corresponds to a clock rate
>> of a bus clock (19.2, 200, 300 Mhz etc.) but the APIs expect a Kbps
>> value. So at one point they invented a MHZ_TO_MBPS macro which did this
>> conversion the other way around and probably had to account for it.
>>
>> I think they tried to make it make more sense, but it ended up being
>> even more spaghetti :/
>>
>> Not yet sure how it's done on RPMh icc, but with SMD RPM, passing e.g.
>>
>> opp-peak-kBps = <(200 * 8 * 1000)>; # 200 MHz * 8-wide * KHz-to-MHz
>>
>> results in a "correct" end rate.
>>
>> Konrad
>>>      if (bw_factor) {
>>>              crtc_plane_bw *= bw_factor;
>>>              do_div(crtc_plane_bw, 100);
> 
> 
> --
> With best wishes
> Dmitry
