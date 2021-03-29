Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3573F34D833
	for <lists+freedreno@lfdr.de>; Mon, 29 Mar 2021 21:29:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C39C36E506;
	Mon, 29 Mar 2021 19:29:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A57BE6E506
 for <freedreno@lists.freedesktop.org>; Mon, 29 Mar 2021 19:29:16 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id m7so10054560pgj.8
 for <freedreno@lists.freedesktop.org>; Mon, 29 Mar 2021 12:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=jeFzlMEdccDF7Qt+dm5jLoV1df3/X2IPz/2VrJ7mbME=;
 b=exFMnH8xjMUVUgVY66V5i8Xn2XL/uVytTE4/F2QC6Zkj1C4L9IMkrfDC9lUIeYVXnH
 3Q6Pd6FNYahec4OyqemEPfopKmlc/FDAuAMJnugE7Ep7/3vkDqyUwGa3cJHU6OoNz2kQ
 iw6itbkxz42n3XnWBr8lPI+OX2BrNamXfHL2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=jeFzlMEdccDF7Qt+dm5jLoV1df3/X2IPz/2VrJ7mbME=;
 b=Mhg/K4Xj+DVKxxoaEC6/w6HyZ1l0/PjoUIDaU2BTlQU0mz4hgZwmjToRG6VW16PZDe
 Ar0KOx5gqDOd3jVzhmpXsWtFosAjzLtuFWLxymXLZQJ7xmAQMzWuz7/ba1uB0zmzy3LA
 2c58dr91DIWy/rFHbliPT1H9LWAuLoIiyQBUPcsUeZXyJIOnRYSHuoT64lXRFicKkRfu
 XD3tO3iSYySTI14DqtMTP106sz6fy5JvTXmvpY5RjF2aTuOc0oLHCovSl0TeraImMMKa
 CZIQQJqdYUkL3iN+oYyAmpmmxVqGw1s94QHOIXpW4NOxfsDFZgp3jvg32RNBo9F1zdt+
 M9fA==
X-Gm-Message-State: AOAM531vL8LvMfXNoDIHen0XcSjLkoXirBPpt6tspWjwqFqtUfaMC08R
 ldevCGEDidGKS1N+s+Ov+kW3uA==
X-Google-Smtp-Source: ABdhPJzpjW4LArmS0MewXwBVMlVp8N5xROEOFLhzj8Opd36ePYrxamWZ2tpcFs23OIFdquryams5Iw==
X-Received: by 2002:a65:61a4:: with SMTP id i4mr25471889pgv.39.1617046156268; 
 Mon, 29 Mar 2021 12:29:16 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:4091:2b37:966b:1fca])
 by smtp.gmail.com with ESMTPSA id 205sm18073002pfc.201.2021.03.29.12.29.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 12:29:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20210329120051.3401567-5-dmitry.baryshkov@linaro.org>
References: <20210329120051.3401567-1-dmitry.baryshkov@linaro.org>
 <20210329120051.3401567-5-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <sean@poorly.run>
Date: Mon, 29 Mar 2021 12:29:14 -0700
Message-ID: <161704615451.3012082.15618069383141056363@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Subject: Re: [Freedreno] [PATCH v4 4/4] arm64: dts: qcom: sm8250: fix
 display nodes
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
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2021-03-29 05:00:51)
> From: Jonathan Marek <jonathan@marek.ca>
> 
>  - Use sm8250 compatibles instead of sdm845 compatibles
> 

Does it need the " - " prefix?

> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
