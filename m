Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C234CC966
	for <lists+freedreno@lfdr.de>; Thu,  3 Mar 2022 23:46:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCF1610E3AA;
	Thu,  3 Mar 2022 22:46:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F3D510E396
 for <freedreno@lists.freedesktop.org>; Thu,  3 Mar 2022 22:46:44 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 l25-20020a9d7a99000000b005af173a2875so5909592otn.2
 for <freedreno@lists.freedesktop.org>; Thu, 03 Mar 2022 14:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=lAmfMh3siUWAbgiKtdrl2arKgopAvWxLPSUY8pwP5vo=;
 b=HJhZCrhxO1Pyzl6t9wzDXnMPLJxc3cVtgvpSg8wZBkv23iDjLvHwLafhXztd8HFsmH
 MwzIOrj2PTcTDGurmzZolflvediekuyuBXl79QFwBlJmkEwv/P7RcX1HKtj3/1CNso9X
 YzK6BZNXHtfmv8lFtHrCzOGQ+MZsx4+erym4A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=lAmfMh3siUWAbgiKtdrl2arKgopAvWxLPSUY8pwP5vo=;
 b=XgQ4N4QAkcZQLqPvgMpgm2RrzXposU3gASQo9eY6vjAbNuE6TGz8Iq4m9EDFW1yzCy
 aLQChVorOVFQfJc4a+DDCi2eCJDVG8K+yU10XobMxCyETbzupoyfIgzkCEsLt+hrc4wY
 VN2zW5XXRCkGLvpQ8ThiiQ/j2FuNy0CwbFE8EzQDGMu5bh8+bycMF55oOm/IpSGM97Af
 IZ94St/wlBRqASGEJyGEtBg/NlK8jJxPJNUmzNs0weZDD75gUf4nKxNQGcdFIHvyfXMc
 j2V7EAqglXxVxNkJNPQuu3+QvfEClnFSXvue0QRGB1h55Vo3l1QRcFnGjTNbCa8EvCvO
 wXuA==
X-Gm-Message-State: AOAM533Giay9r32SNHgAx4A6JIVVJbc8zA8pJkd8psDU9uqmYZj6CSSj
 ILWkZw54JRzwrpGy22DA0x/8dlk3oQrf3m7+VOv0Kw==
X-Google-Smtp-Source: ABdhPJyNXFY30iI47VZgSxdtBNCRROM2D9HdHXLCfN3psV7sKNSNt6F40TbtroAvxxc4HUpyiSwvWzkxOd2O9Ee80u8=
X-Received: by 2002:a9d:22e9:0:b0:5ac:1754:342c with SMTP id
 y96-20020a9d22e9000000b005ac1754342cmr20092863ota.159.1646347603888; Thu, 03
 Mar 2022 14:46:43 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Mar 2022 14:46:43 -0800
MIME-Version: 1.0
In-Reply-To: <1644009445-17320-1-git-send-email-quic_abhinavk@quicinc.com>
References: <1644009445-17320-1-git-send-email-quic_abhinavk@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 3 Mar 2022 14:46:43 -0800
Message-ID: <CAE-0n53-9+t4ruY9hykzZmP4LXZzvQLjRWRtmY=Ksm-BVaT78w@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 00/12] Add writeback block support for DPU
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
Cc: linux-arm-msm@vger.kernel.org, robdclark@gmail.com, nganji@codeaurora.org,
 seanpaul@chromium.org, daniel@ffwll.ch, markyacoub@chromium.org,
 dmitry.baryshkov@linaro.org, quic_jesszhan@quicinc.com,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Abhinav Kumar (2022-02-04 13:17:13)
> This series adds support for writeback block on DPU. Writeback
> block is extremely useful to validate boards having no physical displays
> in addition to many other use-cases where we want to get the output
> of the display pipeline to examine whether issue is with the display
> pipeline or with the panel.

Is this series going to be resent?
