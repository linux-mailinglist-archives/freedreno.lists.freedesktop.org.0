Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 670AA54FE93
	for <lists+freedreno@lfdr.de>; Fri, 17 Jun 2022 22:57:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB7E010E4A2;
	Fri, 17 Jun 2022 20:57:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A98210E4A2
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jun 2022 20:57:04 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 l9-20020a056830268900b006054381dd35so3939257otu.4
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jun 2022 13:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=vMRFR0GXyCuyzUO1zmdvO0SdG3g9jDS3szGGSmZwvdo=;
 b=EoWrsaIdWmfmOGr1BtwEg2WSZK+OU+lG3deDCXDzb74IKSuCLjUw48r/Au0ZdFbBld
 CtADV5mdsqtHPiJQnM6grFYj+RXcVZ25BiaOF+SeT3sWq4i0Z9auBAbHmX9HOV5Xn+AO
 W4/IHFd1Zk/BzdQQ1hCIwfywNaHuB2eYr/RVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=vMRFR0GXyCuyzUO1zmdvO0SdG3g9jDS3szGGSmZwvdo=;
 b=C4S2O6EOUzrhVCmr3ZTPVwQwYtXoGuXszphV95lAw5xxiFSKJXicuXprJbu5K3RX54
 Y2vbawVa+N90Bvs3M0vOzbqH/a81v6JBGbLnRd/NksaPlx1ZmOGdHeIt0EOBHXhr7Nb0
 cMmvpjXilyvAiU1S483OUKr3Fuchbl5GnqjY8OgJRvBQEJ+gORUtDP2CmlitKG+ghORo
 fhu+pikYxM0630VbHwBhi4e2fdCGLpKgcmLIzjmLCzBf2nIbc84TQmtnevBPxRFoESFw
 yIBBv1QL6bWSpiHjCFoskf8tXjdMinHPGNE4AO4gLQ8R66Q67a5h4KRC9QvF6YB2eboL
 k0qw==
X-Gm-Message-State: AJIora+KEyykW7hMheybL9xY+pG1xUjM4DT7uo0fuwy8D5LjixEoZ+zv
 U3AWSTmiUqTukf42gr7oIHoUH/q1zyw8ZHN79KdJGw==
X-Google-Smtp-Source: AGRyM1sfzKoW9WyzAhvY11tv9iFwse5ymjpHxzBQ0uh1UWvv6lmB401+6sUT+IuSWkFK2+PScwaSfV3+9PXqLXqk5Zw=
X-Received: by 2002:a9d:6484:0:b0:60b:eb0b:4054 with SMTP id
 g4-20020a9d6484000000b0060beb0b4054mr4760290otl.159.1655499423686; Fri, 17
 Jun 2022 13:57:03 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 17 Jun 2022 13:57:03 -0700
MIME-Version: 1.0
In-Reply-To: <20220617103608.605898-4-dmitry.baryshkov@linaro.org>
References: <20220617103608.605898-1-dmitry.baryshkov@linaro.org>
 <20220617103608.605898-4-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 17 Jun 2022 13:57:03 -0700
Message-ID: <CAE-0n50=Lbrs84oivqni0oBNk0KSY9yGvkYFXggekwVDQ80fyQ@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 3/3] arm64: dts: qcom: msm8996: add
 #clock-cells to the HDMI PHY node
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
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 linux-phy@lists.infradead.org, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-06-17 03:36:08)
> Add #clock-cells property to the HDMI PHY device node to let other nodes
> resolve the hdmipll clock.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
