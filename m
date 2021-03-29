Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B073B34D823
	for <lists+freedreno@lfdr.de>; Mon, 29 Mar 2021 21:28:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE6E66E509;
	Mon, 29 Mar 2021 19:28:39 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1D1C6E506
 for <freedreno@lists.freedesktop.org>; Mon, 29 Mar 2021 19:28:37 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id g10so4895614plt.8
 for <freedreno@lists.freedesktop.org>; Mon, 29 Mar 2021 12:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=+4cOVQ7+6L15zdo+E6zQB02I2bt0ll5FGJ5itLhgQnU=;
 b=ltyydm9yPLka+76TM3QCQVBtQlyeAGA4FTX4smC0ATrzMpkebPV1Qnh9VrUC5JwPQH
 yOqQT/iSfJLSXqmuvTk5tTefgGyR6LIEz/s7ddXqv6F5iiYaW5E1M9jXx3OQ50XbFN3c
 a5/bmx4GhNs4E0uKSUZTtTFKMaKVYirEqriFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=+4cOVQ7+6L15zdo+E6zQB02I2bt0ll5FGJ5itLhgQnU=;
 b=FT5Fi8TQz0VhRht4tKIz0BvB+LC4Xo2Sh4T6LTcsBpCR8NB+I7yRfIAvNmjRmbUfcQ
 WNtlcB/lbzLpE4iJpg8GuByqsEkvVTMvffe47bLAj329UZaMLrerfx/bs2NMikS8qs/o
 d+1vBo+8Nq+u20JOwDIzVWAT3NoCy+ZOk2OPJRCtECzgDE/DcU3J9/fEusWfXXSy+s20
 BDcK269Ch2hPs1h4TW9pd3pUPEnIpRPLGl2qC5W06wELquHrgs7j3zAFHJAlDcN3QGho
 O+nFd/DON2wFnDZA5YfRdo37srlc0BfYKeCQPDKGtjpK1CsVwDURLTZ77KOhHYV5guj4
 eH5Q==
X-Gm-Message-State: AOAM530ChBZ4gQzfa5cA/x48O5U/Dcg6coJRQXz8H8QaklUfyBdVcnJR
 jR1kT6W40OK/+puMAWbDiC8vXA==
X-Google-Smtp-Source: ABdhPJx/4WH6fT1bN3OEwPuIpi0aEf2C6F7i8hpe8iRyxUdnZJchCoJBOeBSK6mRVIgduqkaUwXMLA==
X-Received: by 2002:a17:902:7407:b029:e4:9b2c:528b with SMTP id
 g7-20020a1709027407b02900e49b2c528bmr30412589pll.6.1617046117481; 
 Mon, 29 Mar 2021 12:28:37 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:4091:2b37:966b:1fca])
 by smtp.gmail.com with ESMTPSA id y7sm295588pja.25.2021.03.29.12.28.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 12:28:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20210329120051.3401567-3-dmitry.baryshkov@linaro.org>
References: <20210329120051.3401567-1-dmitry.baryshkov@linaro.org>
 <20210329120051.3401567-3-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <sean@poorly.run>
Date: Mon, 29 Mar 2021 12:28:35 -0700
Message-ID: <161704611572.3012082.10802339085569147003@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Subject: Re: [Freedreno] [PATCH v4 2/4] dt-bindings: msm/disp: add
 compatibles for sm8150/sm8250 display
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
Cc: devicetree@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
 Rob Herring <robh@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2021-03-29 05:00:49)
> From: Jonathan Marek <jonathan@marek.ca>
> 
> The driver already has support for sm8150/sm8250, but the compatibles were
> never added.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> Acked-by: Rob Herring <robh@kernel.org>
> [DB: split dt-bindings into separate patch]
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

This will conflict with the yaml changes to this file that are also in
flight.
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
