Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B39A35848F9
	for <lists+freedreno@lfdr.de>; Fri, 29 Jul 2022 02:18:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E52B10E69B;
	Fri, 29 Jul 2022 00:18:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F84910E60C
 for <freedreno@lists.freedesktop.org>; Fri, 29 Jul 2022 00:18:38 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id va17so5903584ejb.0
 for <freedreno@lists.freedesktop.org>; Thu, 28 Jul 2022 17:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=PyBgADkFmRZGD19YV3bJfXKekitzQhA7zmplwDjvl4A=;
 b=EBDfKbN161jfJ2QBSHpfJwdM19oVk8aVJ4xikkdC2kuXRN+8QRATaPmhq8E7nW+CwY
 0BgTL+iXQpYb3/SFbGQJMC8MumsErqG7MH3njWLFzrqPP1pRCjSDD9mvh9NlaP21SyHV
 gJmZF+TK74SlIlGljuDFIZFOnwtouZg04HSZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=PyBgADkFmRZGD19YV3bJfXKekitzQhA7zmplwDjvl4A=;
 b=hIX8KvTcf4rrnWZZgVX9av0+mNjzcqq0m8tfyya4U5+sfmGrNnhMp3Xk2PMKfNU7PD
 PrGmaSqn1sgqxV99BaT2aRVXTaqLI2MZ+SxhtYZiMwfbPJeO4q6ic0abUhxh+MLguWv7
 onBWPW/nhwnKmXMXcw4FpWpATghYjwQCKUWxJJr5t12jkbrwJvfSTCg6p6R2U3STPhKO
 8ckD9IWw9MNFF/auL6NExmIdtIGTQLAERiuNShzHYDjkQiSDSW7jKU2/Ecm99y4yEplJ
 y3BxyixQthLCOA4RbsLZ4dH9xHvdNzwgPy0YLi3bXidTAnK3+Le9LA61lYNnxU3rijJG
 H2ng==
X-Gm-Message-State: AJIora8UZ/EUJYHwHuqVc8GUUBlWeGA/NoftelyUQXqy+iqEPObXqpZC
 beqw1mKP9SDQtLW4s3DzUSo+TtNYbrx0AZsK
X-Google-Smtp-Source: AGRyM1uJ3ud+CSMohtaAwjPmp0ZOAnGjSF0aGht92Nc7d4lFd9ntVIs/sEAZlOka7UUllLHwKWbdBA==
X-Received: by 2002:a17:906:8501:b0:711:bf65:2a47 with SMTP id
 i1-20020a170906850100b00711bf652a47mr996835ejx.150.1659053916929; 
 Thu, 28 Jul 2022 17:18:36 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com.
 [209.85.221.47]) by smtp.gmail.com with ESMTPSA id
 vj16-20020a170907131000b006fec27575f1sm952148ejb.123.2022.07.28.17.18.33
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jul 2022 17:18:34 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id m13so199158wrq.6
 for <freedreno@lists.freedesktop.org>; Thu, 28 Jul 2022 17:18:33 -0700 (PDT)
X-Received: by 2002:a5d:6843:0:b0:21f:1114:fc54 with SMTP id
 o3-20020a5d6843000000b0021f1114fc54mr146662wrw.138.1659053913662; Thu, 28 Jul
 2022 17:18:33 -0700 (PDT)
MIME-Version: 1.0
References: <1657544224-10680-1-git-send-email-quic_vpolimer@quicinc.com>
 <1657544224-10680-3-git-send-email-quic_vpolimer@quicinc.com>
In-Reply-To: <1657544224-10680-3-git-send-email-quic_vpolimer@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 28 Jul 2022 17:18:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X2Ci6G5c4LNibKTWu5ZC962j8QeHpG2nn7uCCoRCuFdw@mail.gmail.com>
Message-ID: <CAD=FV=X2Ci6G5c4LNibKTWu5ZC962j8QeHpG2nn7uCCoRCuFdw@mail.gmail.com>
To: Vinod Polimera <quic_vpolimer@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v6 02/10] drm: add helper functions to
 retrieve old and new crtc
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
Cc: quic_kalyant <quic_kalyant@quicinc.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 quic_vproddut <quic_vproddut@quicinc.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Mon, Jul 11, 2022 at 5:57 AM Vinod Polimera
<quic_vpolimer@quicinc.com> wrote:
>
> Add new helper functions, drm_atomic_get_old_crtc_for_encoder
> and drm_atomic_get_new_crtc_for_encoder to retrieve the
> corresponding crtc for the encoder.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---
>  drivers/gpu/drm/drm_atomic.c | 60 ++++++++++++++++++++++++++++++++++++++++++++
>  include/drm/drm_atomic.h     |  7 ++++++
>  2 files changed, 67 insertions(+)

I don't have a lot of intuition about the code here since I haven't
messed much at this level, but what you have here looks right and
matches other similar helpers. I'm happy enough with:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
