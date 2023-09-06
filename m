Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CF47945EB
	for <lists+freedreno@lfdr.de>; Thu,  7 Sep 2023 00:04:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C841810E72A;
	Wed,  6 Sep 2023 22:04:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1F9210E72A
 for <freedreno@lists.freedesktop.org>; Wed,  6 Sep 2023 22:04:35 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-50078e52537so436848e87.1
 for <freedreno@lists.freedesktop.org>; Wed, 06 Sep 2023 15:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694037874; x=1694642674;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=s4j0fXDx0veW0oHGlyRxz1wFWfTQnf1+IJzl7yxdqZI=;
 b=aeV0TsomNK46cUFzjt+a2WUYZkAEYcDCBA8fRu+7Y1ikSIMBOmsHxAUj1JwZx6RQhZ
 kHndrc3yVV8CBffnf29ByvXOo6JyFlwYQ3gptoOQoIYiuhNnbIkiweLkLFz3FdPPRDoP
 iCCqEthsGXSFuEOnV9K+SJLy3Akt2fv6Gixes=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694037874; x=1694642674;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s4j0fXDx0veW0oHGlyRxz1wFWfTQnf1+IJzl7yxdqZI=;
 b=SeE3SWkC5DexiB6atJtqLJ4SsCeoYcmd6Ju4Ii1I8VS2f462G1h7BkpreDiYB16Opw
 IzqFQwZcpNHgS/4kcJStzX54cq3ord3bm6ZY1Ff9tX3D3zERLzucx/+JVN8VUggV5tT1
 oGusYGyRcszWacXqLbR4Uk2sS0Rhgp1RpTBQeKRRn6bMrdk5ueWJN2pfZlx6Yh/WtTuq
 M/72EcWKxK0YBEhVOg4gXsM3qQRkfoEgEXn7N/Qiz503f6pzG6on1MpvZ970lXnGAV5c
 4iKcqy+3MtyNJMj65Ze14NwlZBaed/wn9ZMf+5h1B00Au7CbwwE/k3K690BY7FTf/dr8
 kbSA==
X-Gm-Message-State: AOJu0Yw4STfnjQVym+s3jlirPnme9lucxHrjDKXUEbpNn7nMA5+PXQ9M
 R4eAlGai1X2rzEQ7uXXry953DGlBziB6trALUjPFJQ==
X-Google-Smtp-Source: AGHT+IHogaYquQ/PSAv/DYcZmNikDOVlv8huAQHfNnOBb8UD02P+ah517cBedi3ixoKQSI3JIRzAa2e4TiStFXwOIxA=
X-Received: by 2002:ac2:5f8b:0:b0:500:ac10:1641 with SMTP id
 r11-20020ac25f8b000000b00500ac101641mr2914398lfe.46.1694037873986; Wed, 06
 Sep 2023 15:04:33 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 6 Sep 2023 17:04:33 -0500
MIME-Version: 1.0
In-Reply-To: <20230904020454.2945667-8-dmitry.baryshkov@linaro.org>
References: <20230904020454.2945667-1-dmitry.baryshkov@linaro.org>
 <20230904020454.2945667-8-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 6 Sep 2023 17:04:33 -0500
Message-ID: <CAE-0n51WNOZashWbEYQ0hUu1SnrS2m1-Y2Aq1S0mfkzm2p8uig@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3 7/8] drm/msm/dpu: drop useless check from
 dpu_encoder_phys_cmd_te_rd_ptr_irq()
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

Quoting Dmitry Baryshkov (2023-09-03 19:04:53)
> The dpu_encoder_phys_cmd_te_rd_ptr_irq() function uses neither hw_intf
> nor hw_pp data, so we can drop the corresponding check.
>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
