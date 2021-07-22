Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DED3D2D7F
	for <lists+freedreno@lfdr.de>; Thu, 22 Jul 2021 22:16:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A8196ED07;
	Thu, 22 Jul 2021 20:16:28 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E36F36ECAF
 for <freedreno@lists.freedesktop.org>; Thu, 22 Jul 2021 20:16:26 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 61-20020a9d0d430000b02903eabfc221a9so41300oti.0
 for <freedreno@lists.freedesktop.org>; Thu, 22 Jul 2021 13:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=xXB6CY1/hyqIZ/vyf1haNoHbt4KWUoYy6vvZAmH1D+w=;
 b=oFGsQ0TKjSPUvmDJ+Ww7NKCOnlaH9mPPhQ8V1uT5yAbwlHkzi7XKHOwbKCdjsDCiFx
 yq1IJgMOZiLe6uDTqRaVUXxdZCoQJu8ag7Ir6ZFU8nUwgn7Znd4ZLaNh5xPaNp+azumy
 J/HSCBwivCGfPaDdx08xhc/6xnh7lVWGgPxdw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=xXB6CY1/hyqIZ/vyf1haNoHbt4KWUoYy6vvZAmH1D+w=;
 b=h4hsYu9tQFEjczpsRvc8tuQSjmtvwrBhe0x/BJivjvqJ2APt0OTFZfEo85A96+KH6H
 HkY1A0Emc+iTl8/8qPZdQBZP0jzV1pBXqu3DqYYXhLSdrtE4euJf9lAWROmKw9eV2clb
 p9G0kkqJlypgSn3qqbkM820EoukM3Shx+xPWmUiuzjCdDlX7SJdKKLd/7TWDzvU+EGHd
 6WZNyf9XIltOhBKa0r/iHiYNiGfpSmDS5cVYHibsazmElbS/+KvwnkpnaR1SR9NlBl0D
 oTH4U4plbkEihRjSxYMeI8He+T01DxOyiSYcKrvIBUCAFtf/InWY7ZKl0VqHY9t+yXnu
 WWAA==
X-Gm-Message-State: AOAM5333bngVP9rXArkscniVkrNwO6mDYE9qPRtuwpR1ljrc2kvS5PEx
 dBpueEQgC4h2VKhPD+DNvJgRizCEepzDaDyRYlWa0w==
X-Google-Smtp-Source: ABdhPJx9tD8Po38Bpw7rs+mj+04e7lSnkyOtBucxpHE2LeWBu5SLBnaseuHcQzXabjdCy3cHqU3feQ+K8Kq30uLlLb0=
X-Received: by 2002:a9d:650e:: with SMTP id i14mr984428otl.233.1626984986325; 
 Thu, 22 Jul 2021 13:16:26 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Jul 2021 20:16:25 +0000
MIME-Version: 1.0
In-Reply-To: <20210722024227.3313096-6-bjorn.andersson@linaro.org>
References: <20210722024227.3313096-1-bjorn.andersson@linaro.org>
 <20210722024227.3313096-6-bjorn.andersson@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 22 Jul 2021 20:16:25 +0000
Message-ID: <CAE-0n51ftru=ap2PvKiXDTVoQGA1drzU-C29b_KXTN=r=uC78w@mail.gmail.com>
To: Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Rob Clark <robdclark@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Subject: Re: [Freedreno] [PATCH 5/5] drm/msm/dp: Allow sub-regions to be
 specified in DT
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <khsieh@codeaurora.org>, Tanmay Shah <tanmay@codeaurora.org>,
 freedreno@lists.freedesktop.org, Chandan Uddaraju <chandanu@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Bjorn Andersson (2021-07-21 19:42:27)
> Not all platforms has P0 at an offset of 0x1000 from the base address,
> so add support for specifying each sub-region in DT. The code falls back
> to the predefined offsets in the case that only a single reg is
> specified, in order to support existing DT.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
