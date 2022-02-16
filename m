Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C2B4B7CF7
	for <lists+freedreno@lfdr.de>; Wed, 16 Feb 2022 02:57:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E3FD10E5EA;
	Wed, 16 Feb 2022 01:57:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07FAB10E5EA
 for <freedreno@lists.freedesktop.org>; Wed, 16 Feb 2022 01:57:43 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id 13so946389oiz.12
 for <freedreno@lists.freedesktop.org>; Tue, 15 Feb 2022 17:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=ZTvRSyO/qxdBQNSGL9ioAIGzVWwq5zlmxJWFNV0Wr20=;
 b=HWkZ5vwx6mfNm7n1oEfjdUBxUESzSpCu2CsLux7GU2KdSWXNU0jeYezuanMY6f2y5e
 hNS9w8SCmFlzTS9/iiJ23crC0cHF4VhHNHS30ToDRmvV+RcIDsiiRzh7uMf9dZw8re9L
 3E6EtMbGrKz+ChwbcCrxsB+Hw04fAQJsbMAGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=ZTvRSyO/qxdBQNSGL9ioAIGzVWwq5zlmxJWFNV0Wr20=;
 b=WS8h3dwi87bMfndnM2L90FudQmlKNtv03T1iAiJsKPT6Jhvv4l1aydZKRJ2JWKAchd
 QnUtuDHm6sXCBza78Oe/e2p2i7VdxCjC7iL4DlfFADObWjMvLohtzCN7KvDiKdDOmoSB
 5JuWjFQUE8Gn4PTz8CSKHcvi5wMjb1M7AXrGAQtnF/iXEFeEHDRBaSfhCQOnE57XG200
 J0vRVI++UPAfprJPUFh5XT3+Hnh3DAcbYt52feCqUqzwPobC4KF2FyOwAdv8U2NWLdvj
 oWI7lg/GdLkG+QhmXYcxqVHvZ51DXQdzde8WXItdW0g9QEtjchbEWz5gIsAdVuxZs2x3
 U2Hw==
X-Gm-Message-State: AOAM531Uv4pzRtn5/N/dCJUk+2GOn/d/poCwC2XHzQNBiU90gEpjoAfu
 Ympa/mXLtRNZrQsC1E8+p3Mag1HUzJMFCio1Jxl0CQ==
X-Google-Smtp-Source: ABdhPJzj73iDJin5F5rq+gKYnmF1uPigCaFPDoFUn1UpFRxX1o20jaMBpJ1kNDnX+e6MAm8LSl2NEdmpMhg/9cC7XAM=
X-Received: by 2002:a05:6808:b2f:b0:2cf:9af3:1687 with SMTP id
 t15-20020a0568080b2f00b002cf9af31687mr295838oij.112.1644976663351; Tue, 15
 Feb 2022 17:57:43 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Feb 2022 17:57:42 -0800
MIME-Version: 1.0
In-Reply-To: <20220215141643.3444941-5-dmitry.baryshkov@linaro.org>
References: <20220215141643.3444941-1-dmitry.baryshkov@linaro.org>
 <20220215141643.3444941-5-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 15 Feb 2022 17:57:42 -0800
Message-ID: <CAE-0n51V=dDCU8QDmLigJMOevYKO0v6JwoTEB0ghpHM7OobubA@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 4/8] drm/msm/dpu: drop bus_scaling_client
 field
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-02-15 06:16:39)
> We do not use MSM bus client, so drop bus_scaling_client field from
> dpu_encoder_virt.
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
