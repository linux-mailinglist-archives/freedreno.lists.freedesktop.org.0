Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F774B01CE
	for <lists+freedreno@lfdr.de>; Thu, 10 Feb 2022 02:09:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F45510E17A;
	Thu, 10 Feb 2022 01:09:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A21710E1B5
 for <freedreno@lists.freedesktop.org>; Thu, 10 Feb 2022 01:09:27 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id s24so4408380oic.6
 for <freedreno@lists.freedesktop.org>; Wed, 09 Feb 2022 17:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=q0gKDIsiyMqWkXyvkq/+svnrm1y23JpiuzMilVu9Ius=;
 b=DKDmTebOwujuEVOEYAIbmjmg3P3hB/e0sZkC2WNy3aKmoj6Fbhk1e+RB0DL1EvhaRd
 gYoPKtMaIn0q313Ix1AOmQcoQECjwv/dG9yk2Y74K6eoPmRTdg1BN0LEy0wfoxAAB2Ex
 Qnc8r2LK64QUAUngSXNpl7jBO9m3RU6Awim1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=q0gKDIsiyMqWkXyvkq/+svnrm1y23JpiuzMilVu9Ius=;
 b=dmCLhbrI58KTYFTAiPgOsIY2Xp0mHbZwBoOPfqQwMuz98DN0isptHaKgtEkozUbl/J
 17xpl2df53FpMRnCtc40q3/jHZw9wUcZV+oMe9J9K4rTkghWeu88O8EPaOep1Sa06heO
 9Iy3ZVUxJr/ArtD2vgbIefqbjpYEHiNcEJwYJJ99LuKNHOZfroZqAxfgALXcFeA6AvgQ
 ut560SKCfjlorg5fZ4jAVHs+g7YMUhOp2kIbI3nvs56aoVE7+WLaBi771BOaic9qKmb0
 xz+VhvqDbwgq8ums6axdjegVHGGv7gR7Wv9CYZf2LTMtd3IEwUqN3RxLxyaMA0LF010T
 56yQ==
X-Gm-Message-State: AOAM532jaWyWFGcNf/pFOusFgLVzOB0ptLIBFa8ABWgtL6Vy8q1EfShW
 JerYWnw5YhyptjdokjQ2OO7S9O8ozjzOB0llXYyPKQ==
X-Google-Smtp-Source: ABdhPJxWIGoi2bu5HsbIoqhVEA+uTuk5expb3ePJZiNpncXPqK6tZKEzccDytwMyydD4k+qybrXLdIbxmOnYj3gsf5g=
X-Received: by 2002:aca:df82:: with SMTP id w124mr46141oig.112.1644455366752; 
 Wed, 09 Feb 2022 17:09:26 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 9 Feb 2022 17:09:26 -0800
MIME-Version: 1.0
In-Reply-To: <1644396932-17932-2-git-send-email-quic_sbillaka@quicinc.com>
References: <1644396932-17932-1-git-send-email-quic_sbillaka@quicinc.com>
 <1644396932-17932-2-git-send-email-quic_sbillaka@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 9 Feb 2022 17:09:26 -0800
Message-ID: <CAE-0n52X2k-6pA8o8cciknEPjr3uR0J50-wVmO0fmeWgrLm=fw@mail.gmail.com>
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>, agross@kernel.org,
 airlied@linux.ie, 
 bjorn.andersson@linaro.org, daniel@ffwll.ch, devicetree@vger.kernel.org, 
 dianders@chromium.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, krzysztof.kozlowski@canonical.com, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 robdclark@gmail.com, robh+dt@kernel.org, sam@ravnborg.org, 
 seanpaul@chromium.org, thierry.reding@gmail.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3 1/4] dt-bindings: display: simple: Add
 sharp LQ140M1JW46 panel
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
Cc: quic_kalyant@quicinc.com, quic_vproddut@quicinc.com,
 quic_mkrishn@quicinc.com, quic_abhinavk@quicinc.com, quic_khsieh@quicinc.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Sankeerth Billakanti (2022-02-09 00:55:29)
> Add support for sharp LQ140M1JW46 display panel. It is a 14" eDP panel
> with 1920x1080 display resolution.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
