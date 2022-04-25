Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF6150E9E7
	for <lists+freedreno@lfdr.de>; Mon, 25 Apr 2022 22:10:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3DCD10E0ED;
	Mon, 25 Apr 2022 20:10:31 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 122E210E0ED
 for <freedreno@lists.freedesktop.org>; Mon, 25 Apr 2022 20:10:31 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-e67799d278so13464760fac.11
 for <freedreno@lists.freedesktop.org>; Mon, 25 Apr 2022 13:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=K7sT4j1j79zUgHhHLdRo7ZuD61k8VXDTntHyuzX/BXA=;
 b=OUAaD5Us01krjFlnDs+151g4ok09UyRZuEIHUE1jPBEyR9mx/A7sAsmhjHf63EwNHq
 tIGiZUlZHdnlAbywcerGTsEzOjmesGLQUY9f6NI+BrVAm9kyrLaCHdJc504J1oJXK0wM
 YXgRd77RKxlXmiT+xTLg8ZVph4cRCjsfDql8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=K7sT4j1j79zUgHhHLdRo7ZuD61k8VXDTntHyuzX/BXA=;
 b=tDmw//UNHerwFT5cPcI9q8zG3ycM/ELx/uUUwy+1aTe959wT9bSBmxXp/M2EyTPpM3
 tATmOlrcfgqtigaojc+8BbGXB7vttN+Eejdq6CnxCymy1IYnVBkXnUY8NOxFm79bqk72
 Yatl2X1kpS6qvDZGythLDLKR7emhyFI2VQr+rnT2pHIykzjAaNJjBNYVXRIcEkwcTWki
 K5yAxQ67+wkP9EJ08WSjR6XyIBj/2BHpIUbqFhdz/TH3w/rjNE3EAInSExHmCAcmDWFg
 2ucpbdBxtMyt0r5JMn3vSWIoaEuECnCKq3iRBL70VbMzT6Pl5/A0N5J2m48rUflKsYSl
 QMnw==
X-Gm-Message-State: AOAM531LEqqNwKCMhkckdFTdtjYLooOKJpy/cPrDIsbm/QK4Q0KdtzEo
 Y6kBJg870OU/ihp9IgEV3d7c5Cq/XUA3AAy86YCkkg==
X-Google-Smtp-Source: ABdhPJwJ17fs8iCiZSEbXH7jLlKJyr/HpN9dSlTTmysq4gFTTyFY8Gf7w8AN4qbNPPUFTtheyeMgr9f/4ynX6qJHPkc=
X-Received: by 2002:a05:6870:558e:b0:e1:db7c:26aa with SMTP id
 n14-20020a056870558e00b000e1db7c26aamr8031779oao.63.1650917430300; Mon, 25
 Apr 2022 13:10:30 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 25 Apr 2022 13:10:29 -0700
MIME-Version: 1.0
In-Reply-To: <20220425090947.3498897-1-lv.ruyi@zte.com.cn>
References: <20220425090947.3498897-1-lv.ruyi@zte.com.cn>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 25 Apr 2022 13:10:29 -0700
Message-ID: <CAE-0n50fs1fFQcwMCq_x_UG8ZJKprjcYKwcy1+1ckD--XE28+g@mail.gmail.com>
To: cgel.zte@gmail.com, robdclark@gmail.com, sean@poorly.run
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: fix error check return value
 of irq_of_parse_and_map()
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
Cc: architt@codeaurora.org, linux-kernel@vger.kernel.org, ryadav@codeaurora.org,
 airlied@linux.ie, linux-arm-msm@vger.kernel.org, Lv Ruyi <lv.ruyi@zte.com.cn>,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, tiny.windzz@gmail.com, daniel@ffwll.ch,
 angelogioacchino.delregno@somainline.org, dmitry.baryshkov@linaro.org,
 jsanka@codeaurora.org, freedreno@lists.freedesktop.org,
 Zeal Robot <zealci@zte.com.cn>, skolluku@codeaurora.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting cgel.zte@gmail.com (2022-04-25 02:09:47)
> From: Lv Ruyi <lv.ruyi@zte.com.cn>
>
> The irq_of_parse_and_map() function returns 0 on failure, and does not
> return a negative value anyhow, so never enter this conditional branch.
>
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
> ---

Question still stands why we can't use platform device APIs.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
