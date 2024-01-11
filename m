Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E799582B40A
	for <lists+freedreno@lfdr.de>; Thu, 11 Jan 2024 18:27:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1E6610E913;
	Thu, 11 Jan 2024 17:27:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6897510E913
 for <freedreno@lists.freedesktop.org>; Thu, 11 Jan 2024 17:27:37 +0000 (UTC)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-5f68e2e1749so47437747b3.2
 for <freedreno@lists.freedesktop.org>; Thu, 11 Jan 2024 09:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704994056; x=1705598856; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zwX+Q8u87YRBeqp+9doFk/KRGXo5yTvV0ztJoK1gxhA=;
 b=kWNe2nRyaXY+o5T6psRrla8WGSHUHpKS98lWh032Yu89+BPd9hveQJ7474yOMI3Hoi
 ZXsMH7w8UwNbFfb7gOKkp07+28tYmcFfVeF0WoZrCEEmm3dEq6BCfnKT8t9vr+BDGsCL
 Cit+w2zO2KwCVAx2K5g5UnBqqaRcZ4VV1xwKKSzzm5F/VT9WCPLODkh4ZzfjarGt5+zJ
 q9woPZdNk96UfCi5R89xBkstL47HODD/KftjnLdFkh4TNXVPcDtcCrYID6V/DnyTS8hy
 9/gKrsgwFIXA8CS3jFYH90Hx1S4l+fwvevpWtVniCoT0d6GYEpJfNIOoL5b3Itn9dZBP
 l9cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704994056; x=1705598856;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zwX+Q8u87YRBeqp+9doFk/KRGXo5yTvV0ztJoK1gxhA=;
 b=Rur0xkMBtO+iTukxM8Ae5hdDosGIYuqDDovTZVEXVTrsuVV+cJH199oTcpb/KoFVvO
 hO1mNyAxtvk7p7UgSCb/WiH0wlYbIIjwfKwI1AY/OtP5ctLX2rP+6ln7vEswOHx2lQaQ
 qcTL2a0AKWaQjHy2pAJvzC1ccEycyvsJARswabE3488arsasrorvXG7BHgABtPRRsO/+
 u/gejduJ1BL6r3106QdWouu7kkPIA4zH7WZCVCvsWBovvAxYi/BK3Y75DH/BOYFYfe/9
 immLGosMqx5j284pHk+0VP1rga+5C2mviz7+dE7NJjkm9uJO4N1BWprhggxoZ1sttGG/
 UFBw==
X-Gm-Message-State: AOJu0YxE2boAlZzWfY8uyF2n0mcnfA9gi0Px1ta21zSeHGZ+xE1sJdIo
 tmPbJWRX/BAUwIR7LObgGJ8QwOQYGni3By/8e1PeLooJkvGYww==
X-Google-Smtp-Source: AGHT+IFXacy54wlB2/avVyvlqWPg2me5MG2fUSxjyMqNRuv2t5PPokTTThra3Y7tS7jvxnp1hqWagKKX50vYF3/UjZg=
X-Received: by 2002:a81:bc12:0:b0:5e7:5cd8:92b2 with SMTP id
 a18-20020a81bc12000000b005e75cd892b2mr114924ywi.69.1704994056560; Thu, 11 Jan
 2024 09:27:36 -0800 (PST)
MIME-Version: 1.0
References: <1704993255-12753-1-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1704993255-12753-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 11 Jan 2024 19:27:25 +0200
Message-ID: <CAA8EJprHVbPv8ULK3mRPXGOFbuCQ6sw+r68uhdfCe8=E5=YkAw@mail.gmail.com>
Subject: Re: [PATCH v1] drm/msm/dp: remove mdss_dp_test_bit_depth_to_bpc()
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 linux-kernel@vger.kernel.org, quic_abhinavk@quicinc.com, airlied@gmail.com,
 andersson@kernel.org, robdclark@gmail.com, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, vkoul@kernel.org, agross@kernel.org, daniel@ffwll.ch,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com, swboyd@chromium.org,
 sean@poorly.run, linux-arm-msm@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 11 Jan 2024 at 19:14, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> mdss_dp_test_bit_depth_to_bpc() can be replace by
> mdss_dp_test_bit_depth_to_bpp() / 3. Hence remove it.
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_debug.c |  2 +-
>  drivers/gpu/drm/msm/dp/dp_link.h  | 23 -----------------------
>  2 files changed, 1 insertion(+), 24 deletions(-)

Thank you!

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
