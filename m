Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 089FA4B7D73
	for <lists+freedreno@lfdr.de>; Wed, 16 Feb 2022 03:23:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CD6910E609;
	Wed, 16 Feb 2022 02:23:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F6B310E609
 for <freedreno@lists.freedesktop.org>; Wed, 16 Feb 2022 02:23:40 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id i21so1053076oie.3
 for <freedreno@lists.freedesktop.org>; Tue, 15 Feb 2022 18:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=do3u6/z7zCvazn6dB/lB4uze72AW50adozCDD+3nWC0=;
 b=dep0T2pIMIu4ZF68LVowfSkCS8ZxQieF9CH5b7wOgc6Hbtao27n1EOb5gWMqPlEMfa
 JiEQvMfO6kYPEG7VAJpoKpE9tDR/A51kcdFDr1K9rHtgnUghJNtKQ8Yq9eBG76imN3Cb
 3/j8kY2ujmHBAmJxqCl+dko0CccdxK4Ygv8rk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=do3u6/z7zCvazn6dB/lB4uze72AW50adozCDD+3nWC0=;
 b=yDRa+aQ95v/h7Ii9VLx+EppzU2eSAd9DBuIlPfTNtQdpxGlZHGGIHHV3p6APl9M60q
 a1MY6VPX4Cw6JMtv7dLlDlJnkinVc4PzHpyyc7P7ZVzCy+fgXES3/kYsfeVpN1EDJ5P+
 7xdyaNd90XU6qvEgzIDhgACXXMUbVEuDS8J+f9Qr/2j1XL0cyWscKWjZKlC8W82pkEL2
 VUwu0dcHyqeylNnPgpphtYAhyuoAQUVWAU48+J3VzyaT2NyCUlhxRQidBe0fvczzcGEF
 Hf/TLSEAkLPPpYnsf/okDA4sE5wu+reRqKVrqtsYGm9n6J+CTsd4++p4RL6JeeGtJrUX
 MZnw==
X-Gm-Message-State: AOAM533WB1VOQiTRew5Gpw9Lm1+gkj77HUUcm3sdKMRKvcpoA2QCLK3Q
 VI0nN/3QCIfbQUDYuh1ptQtCpGlG4L/6MeAp/LZC9g==
X-Google-Smtp-Source: ABdhPJxTadsQFl0F265Dj7oAXJyj6RI9yKfL/VD6n7bVCUqdLXYuh0mXfZ6jUdzpa9lfmUtffEGDanBYPorC556NV2I=
X-Received: by 2002:aca:df44:0:b0:2ce:285f:cb99 with SMTP id
 w65-20020acadf44000000b002ce285fcb99mr2980915oig.40.1644978219565; Tue, 15
 Feb 2022 18:23:39 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Feb 2022 18:23:39 -0800
MIME-Version: 1.0
In-Reply-To: <20220201151056.2480055-7-dmitry.baryshkov@linaro.org>
References: <20220201151056.2480055-1-dmitry.baryshkov@linaro.org>
 <20220201151056.2480055-7-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 15 Feb 2022 18:23:39 -0800
Message-ID: <CAE-0n53sC=vfEtV=h9bDJgHoTi7z4fSLvqNmUDkBfWsXk1u_pA@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 6/6] drm/msm/dpu: pass irq to
 dpu_encoder_helper_wait_for_irq()
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

Quoting Dmitry Baryshkov (2022-02-01 07:10:56)
> Pass IRQ number directly rather than passing an index in the dpu_encoder's irq table.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
