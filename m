Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 290F5686770
	for <lists+freedreno@lfdr.de>; Wed,  1 Feb 2023 14:49:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0FBE10E149;
	Wed,  1 Feb 2023 13:49:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CB7910E0CC
 for <freedreno@lists.freedesktop.org>; Wed,  1 Feb 2023 13:49:52 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id lu11so14263885ejb.3
 for <freedreno@lists.freedesktop.org>; Wed, 01 Feb 2023 05:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ACzUjtExd1GIrXZr1vO/BegTBXZjaP/+ZCi6MVW3dcE=;
 b=XqDxeyaONwSMSPBNLF2wQqvVaptIMfUXKIL+odbcSjOEZWz8roz/UWW0pxxPb3rcZr
 XFDmxM9TAigHeKTHQNxt3sps1g+kXk+XspyzHQ5nM5bVtha7xLYeGTaNdb6wdqMkBygt
 WSEV1c7E4T0OUWeGWS+B6KE7T7kIMhklClCadFuGuBww3apkEKZPesqOgZ9QRbiHKG/s
 RhLPhfcLZUjCzjYqLQHasEL3rbrwMn3G0UFhkARdB2BfN7ojuinil2MH8DDWf2Qw7UB2
 ZZJQivmgEIaA59HQPwDukXmfcC2PdEJW/QS3cJCIN/QIrsmdmoW50R6C9Sw/k3AukrL8
 +d3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ACzUjtExd1GIrXZr1vO/BegTBXZjaP/+ZCi6MVW3dcE=;
 b=l+gniCAuP61onein15xeA41PBncuUvXK7pnGguyAvyeykYlegzYHdCbux1KShn0SHe
 bbgcnHtXhG/nv3uv0mG9E2ZHHPGr/BOhvk9c7wP2fnqlP/iXtnr0cjqOMQ/KKqZI2sDe
 l6Qb0pz7ZPumKpW3PMyVBzbdFJlFuLmW/XEHqF6lOw2OvNC077rE0iWsxnepL1U9o9bM
 h644eQHLX+/dpcf4I8vuOCTqs8lQd8xau5bpWGkUuL2ZSa5saJeLEk9M0Ss210zhNHOD
 63wIbcjbucXlIBnn1a6v04fWUGC0gV5bgGG24qk6HOS/VDSuZW85rxBPA0UcevaY3V9w
 gL4Q==
X-Gm-Message-State: AO0yUKWzdXBwAF6jXYAMy4x4nMjS4W5X0XW7ygAdSkYmKjxWwGMojd4l
 w9Amt5TFbKKFM6TO5T2gE5IrqQ==
X-Google-Smtp-Source: AK7set8R0ihVH9gQLKTpTgxDtC0l0P5jQ5GnLv1eb/VCHQJYaBQmNmb6DhTSWztbpqMBqXz4Dg9UCA==
X-Received: by 2002:a17:906:2b0d:b0:877:a9d2:e5e9 with SMTP id
 a13-20020a1709062b0d00b00877a9d2e5e9mr2588659ejg.42.1675259391045; 
 Wed, 01 Feb 2023 05:49:51 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 gt15-20020a170906f20f00b0088bd62b1cbbsm2858318ejb.192.2023.02.01.05.49.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Feb 2023 05:49:49 -0800 (PST)
Message-ID: <05344ca0-3847-ea55-1e61-04aacc58995c@linaro.org>
Date: Wed, 1 Feb 2023 15:49:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Kalyan Thota <quic_kalyant@quicinc.com>
References: <1675092092-26412-1-git-send-email-quic_kalyant@quicinc.com>
 <1675092092-26412-3-git-send-email-quic_kalyant@quicinc.com>
 <20230201111604.htgczy6yvdkywhvl@SoMainline.org>
 <20230201112631.mgwuboehrwdefqnd@SoMainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230201112631.mgwuboehrwdefqnd@SoMainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [v1 2/3] drm/msm/disp/dpu1: add dspps into
 reservation if there is a ctm request
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
Cc: robdclark@chromium.org, devicetree@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, swboyd@chromium.org, freedreno@lists.freedesktop.org,
 quic_vpolimer@quicinc.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 01/02/2023 13:26, Marijn Suijten wrote:
> On 2023-02-01 12:16:05, Marijn Suijten wrote:
> <snip>
>>> +	if (dpu_kms->catalog->dspp &&
>>> +	    crtc_state->ctm && (dpu_kms->catalog->dspp_count >= topology.num_lm))
>>
>> Multiline-if-clause is typically indented with two tabs, not a half tab
>> (4 spaces).
> 
> Hmm, Dmitry requested indent-to-opening-parenthesis in v1 instead; and
> the majority of dpu1 uses the worst version of all: indent with a single
> tab so that the contents line up with the code block below.  Dmitry,
> I'll leave final say to you (and fix it up in my own DPU series
> accordingly too).

Well,

:set cino=(0

> 
> - Marijn

-- 
With best wishes
Dmitry

