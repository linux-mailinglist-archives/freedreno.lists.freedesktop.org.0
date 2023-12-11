Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 316E280D34E
	for <lists+freedreno@lfdr.de>; Mon, 11 Dec 2023 18:10:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED5A510E4BD;
	Mon, 11 Dec 2023 17:10:28 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6690F10E4BD
 for <freedreno@lists.freedesktop.org>; Mon, 11 Dec 2023 17:10:26 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-286867cac72so2920682a91.2
 for <freedreno@lists.freedesktop.org>; Mon, 11 Dec 2023 09:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702314626; x=1702919426; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/6gM179AhgbJYgtngtZQEEEqDaJNXVBNn+YvWsmBBJo=;
 b=VpeLC6R+YkS8AG5OxUGEx/qGLaoglwUoxuTrbnap0mwoWRhUQ0dg4jQ6OM5A/NI9oc
 UW28RrbcAF1GCbgJjw1Zm6Zu8ickFuDQ8HwAOeGRxf7vrps2psKLtqbRItt7Z39mm0l7
 ef08oFHdqHnU/Nr+Znpswld+WIOsdSUzYPFo/eVWKdVoaIU9DpF6A5bj6VAMQtVEJAtz
 90pB1SIjUHGRJszGg3YPOnplVdlFkiSyiBwkYYIudkgq4Zih29+3NQLUFl+g519LLYPb
 zkSBs7Z4WZd9l7n3s9S2JhKluTu9xk1K0jbjS75z5kbN5qaMq1Hpdjgn12H8FCAhDXE/
 tCGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702314626; x=1702919426;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/6gM179AhgbJYgtngtZQEEEqDaJNXVBNn+YvWsmBBJo=;
 b=oBMtNSfC2StUDxQnRLf6sr+jOfl57D7e8NIpqUbwgukq0If7n5j8ACeO/dmFHTzk3H
 Sj3xIkOt1O0GcWTB3sG+bNQq+ei4+8h0nfz8A0pi7kJRa2b1zNZfb9DqDM/sSvtydB8B
 wHwr7bNHVWeMZTF6hTeIovw1BBXra3SU8Yvlt34gY/diiWtpqClqISNonGf+mhnq0lwQ
 1N5QiwzjWh6/hXHDtftX1Nzhvj7G6e2Y28Hs2JdZWsdK8th6CPjZtZu4/sO9BpZcdL/I
 IUq2CY6znoqPEFYC6e7xObRgm//4Otw9glRaksZlhHEmYpfIYPMk+V4T349EekyOgnon
 nORQ==
X-Gm-Message-State: AOJu0YzbiWVMpjNbpBbiGWjd5KhcVwdA/FpEA+Ykdy+UooeKqfG/+mY8
 KyB0Zua8e/ddWTSGQC/BDY89g2OBQXXfsEiue9H90DtGru9c9fTvieAVLeRF
X-Google-Smtp-Source: AGHT+IERgX/N6WxJ2f7s+W1y4IPQCtA9N5Au3g8U83QTHBFu4iTUR8qZCwcvhWlqECUYpewXIMLbccd5Gia20X1e5XU=
X-Received: by 2002:a81:dd08:0:b0:5d7:1940:b373 with SMTP id
 e8-20020a81dd08000000b005d71940b373mr3793149ywn.63.1702308088859; Mon, 11 Dec
 2023 07:21:28 -0800 (PST)
MIME-Version: 1.0
References: <20231211145440.3647001-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20231211145440.3647001-1-dmitry.baryshkov@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 11 Dec 2023 17:21:17 +0200
Message-ID: <CAA8EJppn9=jwPL5WhK4Cr5Z=OKG6gVicoYq_x5YJ3eakKmyZUQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: remove extra drm_encoder_cleanup from the
 error path
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Content-Type: text/plain; charset="UTF-8"
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
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, 11 Dec 2023 at 16:54, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> The drmm handler will perform drm_encoder_cleanup() for us. Moreover if
> we call drm_encoder_cleanup() manually, the drmm_encoder_alloc_release()
> will spawn warnings at drivers/gpu/drm/drm_encoder.c:214. Drop these
> extra drm_encoder_cleanup() calls.
>
> Fixes: cd42c56d9c0b ("drm/msm/dpu: use drmm-managed allocation for dpu_encoder_virt")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reported-by: Konrad Dybcio <konrad.dybcio@linaro.org>


-- 
With best wishes
Dmitry
