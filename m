Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4737945E8
	for <lists+freedreno@lfdr.de>; Thu,  7 Sep 2023 00:04:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 087D510E02C;
	Wed,  6 Sep 2023 22:04:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B054410E204
 for <freedreno@lists.freedesktop.org>; Wed,  6 Sep 2023 22:04:22 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-500cd6261fdso399164e87.3
 for <freedreno@lists.freedesktop.org>; Wed, 06 Sep 2023 15:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694037861; x=1694642661;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=hOxKwJOqWAb69rm6x/gQT98m4juYI2Q0oOscr22POkg=;
 b=Hg6jOYhniJ5W6Uupks+KKOzLfyFoNMhDMeu39rTaydFaG6YiWPjoWbaTcfx2vsg8tw
 wxKwNTneTjXfU842/PNjmCBU/bsUQzSZqYwbCTwjO5EXN+nhAQqeVbLMKi2s/4yubYg6
 tMSPV2mM8r66slrUUVq8v/1ZKknRIcXWWP1Kk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694037861; x=1694642661;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hOxKwJOqWAb69rm6x/gQT98m4juYI2Q0oOscr22POkg=;
 b=ahgY//cg+PvSudx8385TxVBSkpLdX2GPzpqBlRpKuX+4x3QNE2jdGFXcllLyaYP8wR
 GQeq+bG4S2f0UvcqbxVgabjjqZobv2ZFZDJPezXvJ76F5teaKkAdfoVVx4ijIWpP+Xcu
 PhTS8Rl4EUf58kRsJiJQb0FCD9w5uYyoum2yX4diooJ8ViNpf9dgx6FTTCW2seis15ON
 H8BbkmaGSV845T5XDhuk+ObEq1C1XxRkpJF3WXlR7VE5IT6ppo0OumWPgo1JN7QsvCVf
 BjuYjYW9z57BM1KDSI8eZ8pNz83dL/wxNvjOOEyXe1frJQ8ru61djy26cz62HRW/b2t5
 gffA==
X-Gm-Message-State: AOJu0YzfxE/TKVIPZ/GjEaxcbCSjp5vcnTsz/F6T1CT/moPKMSwZ1byy
 jBn5r7Ti68hli3LGCHFz19x4B6b7tuw7OLWElcdvTQ==
X-Google-Smtp-Source: AGHT+IFsds0W1nef7yYZh8sAvGm/Eh1+DoJ/z/zG1cykY5DoSMrR/hVmw5xZPpms3LSzxp1q4GyB0lRiQ3W3GTk7DvU=
X-Received: by 2002:ac2:5f52:0:b0:4fe:5133:1213 with SMTP id
 18-20020ac25f52000000b004fe51331213mr3072268lfz.12.1694037860795; Wed, 06 Sep
 2023 15:04:20 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 6 Sep 2023 17:04:20 -0500
MIME-Version: 1.0
In-Reply-To: <20230904020454.2945667-9-dmitry.baryshkov@linaro.org>
References: <20230904020454.2945667-1-dmitry.baryshkov@linaro.org>
 <20230904020454.2945667-9-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 6 Sep 2023 17:04:20 -0500
Message-ID: <CAE-0n538jr7DV2XHzjqBdQt1LcTeFXcGcALP0T7xSc4=-bzpWw@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3 8/8] drm/msm/dpu: move INTF tearing
 checks to dpu_encoder_phys_cmd_init
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2023-09-03 19:04:54)
> As the INTF is fixed at the encoder creation time, we can move the
> check whether INTF supports tearchck to dpu_encoder_phys_cmd_init().
> This function can return an error if INTF doesn't have required feature.
> Performing this check in dpu_encoder_phys_cmd_tearcheck_config() is less
> useful, as this function returns void.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
