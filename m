Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D7458490E
	for <lists+freedreno@lfdr.de>; Fri, 29 Jul 2022 02:26:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4482511A523;
	Fri, 29 Jul 2022 00:26:07 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E3AD1127A6
 for <freedreno@lists.freedesktop.org>; Fri, 29 Jul 2022 00:26:06 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id p5so4043266edi.12
 for <freedreno@lists.freedesktop.org>; Thu, 28 Jul 2022 17:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=DEDxzOgHTQRQ+rvv/SEM8DOqN9V3eUaGY5hH+UtkIUE=;
 b=XgGvjKM+Hr42e4KmwAK3a1argfHnnskNbRdLej5zKrxwQdZsp8y8yMpZaRkfb6IxQr
 C8PRTgOCkSzXDctTwt3AbbUt42+nPjnl1Ik5fW1fT+au0znVnOZDXvJpfPbucVm4Bv+n
 ty8qUI1gfDrvRlxRV1sm3ItakjLTxp6xy+YLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=DEDxzOgHTQRQ+rvv/SEM8DOqN9V3eUaGY5hH+UtkIUE=;
 b=t49eb+4vOjUqjfbb8attwgjZ83bWMKwQEW+WJennl9mmD8SjgtM7sjavFSSL7Op/CO
 6iYtdaI51UTVfMKPgAKn5mYTVigZYJZbcmwA07uPY09CuLAxwaU/E9YMgd/wfLWRIrA3
 oPlgXLs5V+EvvGydL2GrlFkvtQiHDoQPflf8t1R1gqKlG0Rv2qojAL7MSqcui2zg/giL
 Y7owSo4hZLy/eJ2d+mv8CUfrE3gvf9zzI6c5vcDFh0x5Ko/BIlNcRxkSWgCKjD4TIVVJ
 KIVff9sk3E1oGz/iYlxCWW9hQ8ehq5kwriUI/EnO63irdocsYdHyW/qr0cePNF6lvVk6
 OY0g==
X-Gm-Message-State: AJIora/qVesG0sKVCntSWCDQhd7wA2HZqSeJcir8qQI0oAPliIHE3LFc
 Uo3HKiFmTfN0e5CxwjwmalsskLxj8Zt7ew1If2s=
X-Google-Smtp-Source: AGRyM1vidIW3M3zoblSFcJ2Xe3iDRHG8se3IkuQZR+03A2rCRQp6plvw0WGoSMo3sMq9SAI9S093eQ==
X-Received: by 2002:a05:6402:5202:b0:43a:a238:61c with SMTP id
 s2-20020a056402520200b0043aa238061cmr1317553edd.186.1659054364506; 
 Thu, 28 Jul 2022 17:26:04 -0700 (PDT)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com.
 [209.85.128.44]) by smtp.gmail.com with ESMTPSA id
 ku19-20020a170907789300b006f3ef214e27sm972585ejc.141.2022.07.28.17.26.04
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jul 2022 17:26:04 -0700 (PDT)
Received: by mail-wm1-f44.google.com with SMTP id n185so1791668wmn.4
 for <freedreno@lists.freedesktop.org>; Thu, 28 Jul 2022 17:26:04 -0700 (PDT)
X-Received: by 2002:a05:600c:2e48:b0:3a3:1ce3:3036 with SMTP id
 q8-20020a05600c2e4800b003a31ce33036mr1007498wmf.188.1659053924819; Thu, 28
 Jul 2022 17:18:44 -0700 (PDT)
MIME-Version: 1.0
References: <1657544224-10680-1-git-send-email-quic_vpolimer@quicinc.com>
 <1657544224-10680-4-git-send-email-quic_vpolimer@quicinc.com>
In-Reply-To: <1657544224-10680-4-git-send-email-quic_vpolimer@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 28 Jul 2022 17:18:31 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UXKHrp63wosBdXDBKKcierbgfUOT-W1QF2N23No+MJBw@mail.gmail.com>
Message-ID: <CAD=FV=UXKHrp63wosBdXDBKKcierbgfUOT-W1QF2N23No+MJBw@mail.gmail.com>
To: Vinod Polimera <quic_vpolimer@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v6 03/10] drm/msm/dp: use atomic callbacks
 for DP bridge ops
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
> Use atomic variants for DP bridge callback functions so that
> the atomic state can be accessed in the interface drivers.
> The atomic state will help the driver find out if the display
> is in self refresh state.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c |  9 ++++++---
>  drivers/gpu/drm/msm/dp/dp_drm.c     | 17 ++++++++++-------
>  drivers/gpu/drm/msm/dp/dp_drm.h     |  9 ++++++---
>  3 files changed, 22 insertions(+), 13 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
