Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54036721426
	for <lists+freedreno@lfdr.de>; Sun,  4 Jun 2023 04:39:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F09FF10E0D7;
	Sun,  4 Jun 2023 02:39:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B149510E099
 for <freedreno@lists.freedesktop.org>; Sun,  4 Jun 2023 02:39:17 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4f3bb61f860so4589448e87.3
 for <freedreno@lists.freedesktop.org>; Sat, 03 Jun 2023 19:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685846353; x=1688438353;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oMukeZsIPK9VY+jN6lO5nE+HniRt3DWSTDLIp8k6jQc=;
 b=jtROz0fXdfiIHIOYlEGo1RqI57Xt9Eh7ZYyQddwsfunow3aWsMu+/HxczEcLuRPp4Z
 dKNJIgsMVM+VI9k3As1NYL/xM04D0fuv5WSC60Osribmnui3GsuILV5nN7UdslLRJOr4
 GTgyMtPEEn9aI5eHz3iisjsZ2bfqOL6povcl77pSnghRPbZVb4BoDtq/QDjEmBNZmgU2
 Atsa6su2/AssHHBu/bWGpBELJ1aj3i046yFYYR6rwNaF/4Lt6eBARlYFG0VqxSjOciIT
 yRbwGjO6oWfFV+za0yY6Wfz7P7JcI7raZvcOfx4x8MZ/FdPqu+kJOZpK46YhRY8rZ3TX
 u2qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685846353; x=1688438353;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oMukeZsIPK9VY+jN6lO5nE+HniRt3DWSTDLIp8k6jQc=;
 b=AWnPgB/+eW6Ujj7TF3N8gH3CIf0gY7rXgtS1k/CPZUe0IOiHcaxNNoW8KE/buUKEnV
 7zhjRMt7196nWW1mh94S8Qk+k15ZvA14DTM+MdE3aXQCjp+FNKHqW6dKGgklnh9PjDNO
 kIXyEerd0i/EaXP/ir+JWBNlgQms+QJZV1qPyCTzKAcPTt4ujrwiNfr9Pqi/33LgtEAf
 r5hdkPngjc+ynkXeQKtPjezO2rM+H6ZKYw2OR4ecQBFIeMG2C3ewG1duyiRunxB2oVuZ
 kW03mAAAY9cnndMOjbCJ4aihAApt7tR58LOgZIbQTphanVyp83gg1kYFrmp+4fVuPwsG
 QQCQ==
X-Gm-Message-State: AC+VfDyB4ue1qHeS2iPY991+rvjZ4amI+eZbjX+YcgtGiDYsv+6jD0AZ
 mlC7TcF13aoyhqmcvlHogGJO+g==
X-Google-Smtp-Source: ACHHUZ5D9QfTFJ7LYIjyZ34kZ1xnm+FM48ToTGYMYOaQS6D5GlphlJ2LfDuS/Lo1Qo+BuGyfh75rVw==
X-Received: by 2002:a2e:6a18:0:b0:2b1:af36:93d9 with SMTP id
 f24-20020a2e6a18000000b002b1af3693d9mr1987200ljc.26.1685846353479; 
 Sat, 03 Jun 2023 19:39:13 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 d9-20020ac244c9000000b004f24db9248dsm210750lfm.141.2023.06.03.19.39.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Jun 2023 19:39:12 -0700 (PDT)
Message-ID: <b038052c-c8e2-9aa1-2b80-792563d219ba@linaro.org>
Date: Sun, 4 Jun 2023 05:39:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20230308-msm8226-mdp-v3-0-b6284145d67a@z3ntu.xyz>
 <20230308-msm8226-mdp-v3-6-b6284145d67a@z3ntu.xyz>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230308-msm8226-mdp-v3-6-b6284145d67a@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v3 6/7] drm/msm/dsi: Add phy configuration
 for MSM8226
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 01/06/2023 20:00, Luca Weiss wrote:
> MSM8226 uses a modified PLL lock sequence compared to MSM8974, which is
> based on the function dsi_pll_enable_seq_m in the msm-3.10 kernel.
> 
> Worth noting that the msm-3.10 downstream kernel also will try other
> sequences in case this one doesn't work, but during testing it has shown
> that the _m sequence succeeds first time also:
> 
>    .pll_enable_seqs[0] = dsi_pll_enable_seq_m,
>    .pll_enable_seqs[1] = dsi_pll_enable_seq_m,
>    .pll_enable_seqs[2] = dsi_pll_enable_seq_d,
>    .pll_enable_seqs[3] = dsi_pll_enable_seq_d,
>    .pll_enable_seqs[4] = dsi_pll_enable_seq_f1,
>    .pll_enable_seqs[5] = dsi_pll_enable_seq_c,
>    .pll_enable_seqs[6] = dsi_pll_enable_seq_e,
> 
> We may need to expand this in the future.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.c      |  2 +
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.h      |  3 +-
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c | 97 ++++++++++++++++++++++++++++++
>   3 files changed, 101 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

