Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A31C485C5D
	for <lists+freedreno@lfdr.de>; Thu,  6 Jan 2022 00:41:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC4DC10E43C;
	Wed,  5 Jan 2022 23:41:57 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45B3E10E48A
 for <freedreno@lists.freedesktop.org>; Wed,  5 Jan 2022 23:41:56 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 h5-20020a9d6a45000000b005908066fa64so294262otn.7
 for <freedreno@lists.freedesktop.org>; Wed, 05 Jan 2022 15:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=Hstj2R8ZmDxCXTF3eKwARX+HoUFN/nENk0GAyIL5MUk=;
 b=R1bNiB2DVLPtk0pC+nYr0JETj8iD7Na0JRRE7r3kga+8WkotyJaQPtwWSLJVQxO1f7
 8Uyo38opmG91aKbTd2xzMWir+ZtyLgYiSutKosW7rWM80bgdKx1sjxsIyoCmSBjha1kX
 mB3g6wq5D75vojqUUajcNA/TtGt++GHEsD/qc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=Hstj2R8ZmDxCXTF3eKwARX+HoUFN/nENk0GAyIL5MUk=;
 b=RceULTXxBKAkXDcFk/tP2gMwwJsO2N5A67tnSrXMJ+PzwRhb2eUnCKJ5UIEVT0qbMG
 cAZYmFlSelN3SXh5fbHDKPOBn9ujKzKYjMNX1tLvrEHPEra5xvPjenF8R5R367pj3OYJ
 tJBCh+yiq2RI1qDhcLrUD70K33XgiTLvtiqUT+D0XtMrJdt0Zq1aF4cSdjZ9Y7yt8h1v
 YoGcdNa2k4vnyKaiZwnMfjVDEObOLASNvRnghmS+ZWNPBodKaKs0xICV5RH8f2ZoNPl+
 TmshVeQShXRSEdxXuQr4iKgAZ1bUTn1d2YqiVZ8F0+kWqhmP9B6jLAn/DY52kFV6Su+L
 /snQ==
X-Gm-Message-State: AOAM530c+UqRXP2IA0uoMHv4STaUzVPo8+s2OD1DuJLAAdUTyGnK1tW/
 tvBAt7ji8apvucnF327x69E23lfrCeASAlIlZckWmg==
X-Google-Smtp-Source: ABdhPJyOYuLpjO8gx43wP3pSJEOgxI2mVBjPwuzV0elz1fKfcWpdtbXdmFtiv+OxpNlVj7M6KhNt8ts3ZTRl21NiPQE=
X-Received: by 2002:a9d:1a6:: with SMTP id e35mr482422ote.77.1641426115544;
 Wed, 05 Jan 2022 15:41:55 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 5 Jan 2022 15:41:55 -0800
MIME-Version: 1.0
In-Reply-To: <20220105232700.444170-1-dmitry.baryshkov@linaro.org>
References: <20220105232700.444170-1-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 5 Jan 2022 15:41:55 -0800
Message-ID: <CAE-0n52df=QXPkiQG5W1E51sOHb5kX0+J0qLpPN9NKV36TmN6w@mail.gmail.com>
To: Abhinav Kumar <abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 1/3] drm/msm: drop register logging
 support
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

Quoting Dmitry Baryshkov (2022-01-05 15:26:58)
> Register logging was used during early stages of msm driver development
> to compare upstream and downstream register traces. However the tool was
> never updated to work with mdp5 hardware. Later it was dropped
> completely when Rob imported freedreno tools into mesa. All this makes
> DRM_MSM_REGISTER_LOGGING irrelevant now, so it can be dropped.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
