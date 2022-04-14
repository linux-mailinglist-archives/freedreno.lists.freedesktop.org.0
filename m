Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D41F5018FD
	for <lists+freedreno@lfdr.de>; Thu, 14 Apr 2022 18:47:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB75E10E01F;
	Thu, 14 Apr 2022 16:47:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02AE110E01F
 for <freedreno@lists.freedesktop.org>; Thu, 14 Apr 2022 16:47:32 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id bj36so902211ljb.13
 for <freedreno@lists.freedesktop.org>; Thu, 14 Apr 2022 09:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zX+0Rp8KeI1bu36+dWYbiIQtitTDuR4Sdzxg17DTCMM=;
 b=N693k4tshoimUMR7PJSOzCwUrqo6jmdbynTTZ5/gGXiI4BUH5YFaTyhChlD1qYPwIv
 Kh7ugHtuZ2uky5ruCQ6mniUIioKbVQxsbZ/Rnh06noLFOOH9Mi+acFsRtex2XGvkaG4R
 Q3VlTKcErFU8W0iVIIxODoppOuI9yIftPOgPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zX+0Rp8KeI1bu36+dWYbiIQtitTDuR4Sdzxg17DTCMM=;
 b=gWMegrpDetzSiWclISgLfXzf3EtY9JPuMJ7/XhyXfQxXW4sm38bUVTFtVbmBCYvFsD
 7c7YJX07dk2wCDad8hJdVLH/VkzAlvyAlaJkTppC+1DBNp2whJZeUX6R097GeCbh6K9z
 f3oYMHvdmLxnQv/2lSfer6unKKV816JjhlNF4Yy+kKoMSenMguZYwqg85vjMvpxemXou
 iPBCog7SgTXiiVeFmci38oE4bvLArv3SQP1ELoDXug+mEc5viDyrMrGpF3Di72AAJ14J
 It7hplFVz1p0PR9VvuBnoJ0M6E2i6K5Or72DBZLDZn1aCnzc2Tycms7dU9J3UJfyNmGL
 fUXg==
X-Gm-Message-State: AOAM531isbJTXt9s9rjD377pD3KYDDnG1WLiyMgMGv56KlfPEg7R9CH8
 PE2qOrqvYQPjjTtAE80S5ryFvHG6C5SVUN10U0g=
X-Google-Smtp-Source: ABdhPJwep8Cb1ZYImeaeNhpN2eP8nVJX271zaJRXhvq/WRCBRW779TQCKQhwllpbI3QnbdLbgW+amg==
X-Received: by 2002:a2e:9c03:0:b0:24a:fe64:2c12 with SMTP id
 s3-20020a2e9c03000000b0024afe642c12mr2066865lji.101.1649954850866; 
 Thu, 14 Apr 2022 09:47:30 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com.
 [209.85.167.47]) by smtp.gmail.com with ESMTPSA id
 i8-20020a196d08000000b0046d09ac99e0sm47676lfc.107.2022.04.14.09.47.30
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Apr 2022 09:47:30 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id w19so10086469lfu.11
 for <freedreno@lists.freedesktop.org>; Thu, 14 Apr 2022 09:47:30 -0700 (PDT)
X-Received: by 2002:a5d:47cf:0:b0:207:ac31:c2ce with SMTP id
 o15-20020a5d47cf000000b00207ac31c2cemr2734623wrc.422.1649954428907; Thu, 14
 Apr 2022 09:40:28 -0700 (PDT)
MIME-Version: 1.0
References: <1649938766-6768-1-git-send-email-quic_sbillaka@quicinc.com>
In-Reply-To: <1649938766-6768-1-git-send-email-quic_sbillaka@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 14 Apr 2022 09:40:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Ui6BAsnTaJ2_TMh1Tnjtaw7FR92aWoUysS+UT=c0qB3Q@mail.gmail.com>
Message-ID: <CAD=FV=Ui6BAsnTaJ2_TMh1Tnjtaw7FR92aWoUysS+UT=c0qB3Q@mail.gmail.com>
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v7 0/4] Add support for the eDP panel over
 aux_bus
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
 <devicetree@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 quic_vproddut <quic_vproddut@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Steev Klimaszewski <steev@kali.org>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Thu, Apr 14, 2022 at 5:19 AM Sankeerth Billakanti
<quic_sbillaka@quicinc.com> wrote:
>
> This series adds support for generic eDP panel over aux_bus.
>
> These changes are dependent on the following series:
> https://patchwork.kernel.org/project/linux-arm-msm/list/?series=613654&state=*

You're basically depending on the last two patches of that series.
What's the plan there? In patchwork they're marked as "Not
Applicable". If they're good to go, maybe we should land them? If not,
maybe you should include them (with Dmitry as the author, of course)
at the beginning of your series?


> Sankeerth Billakanti (4):
>   drm/msm/dp: Add eDP support via aux_bus
>   drm/msm/dp: Support only IRQ_HPD and REPLUG interrupts for eDP
>   drm/msm/dp: wait for hpd high before aux transaction
>   Support the eDP modes given by panel

One of these things is not like the others. One of these things just
doesn't belong. Can you spot which patch is missing the prefix by
looking at the subject line of all 4 patches? ;-)
