Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 053CC7D89FB
	for <lists+freedreno@lfdr.de>; Thu, 26 Oct 2023 23:03:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5481A10E8AF;
	Thu, 26 Oct 2023 21:03:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76ECC10E8AC
 for <freedreno@lists.freedesktop.org>; Thu, 26 Oct 2023 21:03:38 +0000 (UTC)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-5a7c7262d5eso10780227b3.1
 for <freedreno@lists.freedesktop.org>; Thu, 26 Oct 2023 14:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698354217; x=1698959017; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Zs0BNJRXsqWeQVO5EP1NdVB6zhate3LzWauL+0ezX08=;
 b=mxgBAvERvpYe+e1nOirxXz/36VV0AbBBMU1IdbyfoYqP/YUb3NXxhgWTcCQ/UaGCLQ
 Zo6uYQfugxti+e03BjZq0lu78BJee6OAGfn/52i6IeJ0KjnoqJny/6hn9CRzraWSd/uY
 mSg+bDg5MRAE/kq4R7nd8QuhNtTIS4I3bAo1VtVpr5wV9C4Pp+4IJqIthJap0vHNcrTr
 q62b4/m9K1gMhXG72lKdn3mZUHsiVhGBUmjbgt7KgZLd/w1kDuWnJxZfiE+j9V5iXb1n
 WBtn2MitaHlWodKawq+6rkVp8LZJ8bqnFA1zWkLs6QkAUvhqzVWwHAT/8q007eKYn+jF
 bEEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698354217; x=1698959017;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Zs0BNJRXsqWeQVO5EP1NdVB6zhate3LzWauL+0ezX08=;
 b=ZYe1z09j3r5YvZGxICWTcTjE/kKUoPcmLyffRGwP+vobNbA6yB1nFx0tGo/fAT9g9B
 7ZzkVDo8ED6HNAMO/5nFWlLYlmeeTSXmS/smoWGNkQ6nnzE3jmZvHvbxLcmE+RszhKC5
 T9XP8mIZFweeLcbjeMVRNUE2v4m2sHZVBfWVWyji+P09t2thYX/Nt/o9iVop9QBPW/ar
 MhnW/V/x+cH1L7UOuEZNNzZb0vArO1R821Ppw+zqhdhr0/25jWyKNo6CZejpv8cHZ6ia
 th1h0wTEGFcCwkqPbmjyfVV6Mgk7QJZKmG1LAOue/E3m6Ct3Uci3IrI9HwVNBDoBMM6D
 H8Iw==
X-Gm-Message-State: AOJu0YzWoiY998W68bUv8We5eWRzxCGzh6vXWisSkoAKC24WGq2FR9MZ
 eK6cXhNViy4ch3rHhF1J/Uf7EVLAy4na8QJpwNfx7A==
X-Google-Smtp-Source: AGHT+IGIsaJR47ax6gzi+WxPKaKzmFJWDCzTOh00EWTxuEonpZFhqFrNTeIAYKVTU0ES42JDfdCmgRnw1PCX7ZDNeZ8=
X-Received: by 2002:a81:d209:0:b0:5ad:47ba:fa43 with SMTP id
 x9-20020a81d209000000b005ad47bafa43mr666424ywi.35.1698354217574; Thu, 26 Oct
 2023 14:03:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230928111630.1217419-1-dmitry.baryshkov@linaro.org>
 <20230928111630.1217419-16-dmitry.baryshkov@linaro.org>
 <b779b911-dff3-420c-9bf9-5b7bef24337c@linaro.org>
In-Reply-To: <b779b911-dff3-420c-9bf9-5b7bef24337c@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 27 Oct 2023 00:03:26 +0300
Message-ID: <CAA8EJppFi6jJ=PKCdwBqM8hXdgp41XTY=QZkdiHkPPJ9KdTfTA@mail.gmail.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3 15/15] drm/msm/hdmi: drop old HDMI PHY
 code
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, 27 Oct 2023 at 00:00, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 9/28/23 13:16, Dmitry Baryshkov wrote:
> > Drop source files used by old HDMI PHY and HDMI PLL drivers.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/hdmi/hdmi_phy.c      | 216 -------
> >   drivers/gpu/drm/msm/hdmi/hdmi_phy_8960.c |  51 --
> >   drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c | 765 -----------------------
> >   drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c | 141 -----
> >   drivers/gpu/drm/msm/hdmi/hdmi_phy_8x74.c |  44 --
> >   drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c | 458 --------------
> >   6 files changed, 1675 deletions(-)
> >   delete mode 100644 drivers/gpu/drm/msm/hdmi/hdmi_phy.c
> >   delete mode 100644 drivers/gpu/drm/msm/hdmi/hdmi_phy_8960.c
> >   delete mode 100644 drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
> Uh-oh, is the 8996 HDMI phy accounted for somwhere else?

Yes, it is the QMP PHY now.


-- 
With best wishes
Dmitry
