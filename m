Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA0F533440
	for <lists+freedreno@lfdr.de>; Wed, 25 May 2022 02:21:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F167D10FAAD;
	Wed, 25 May 2022 00:21:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FACC10FA9F
 for <freedreno@lists.freedesktop.org>; Wed, 25 May 2022 00:21:08 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id f9so38603580ejc.0
 for <freedreno@lists.freedesktop.org>; Tue, 24 May 2022 17:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=po9Z+ZnC7Ru+UUqihsKbLp4miOkDQWGaTskPH6Fy5Dg=;
 b=DogEVOs1h9Ij4NbEnwQCFgHrnO+6c/aG33k1MdmT+QsVZDGJ5A1Xid8Y6NhT55/YZB
 wcIwCwdH49o+G8LNtX6oQ89Hi/v8+WA2AYdKpNkXEYzqSv3TpfNn42nSqr/xaiyJvA1P
 K9imYTOTjx9raNfGaw0DwbkGCwB+CKBzlOR6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=po9Z+ZnC7Ru+UUqihsKbLp4miOkDQWGaTskPH6Fy5Dg=;
 b=HJYAE1oVX217dmDit9aykFr2UphAcVUAzPXOnJZKWdo9wU+b3/D5KcCu6sPBVzSpw2
 lL6iz+S/71ZT2mAY08voR87vZO+VoVrYanAzFhaDsqlwKrmRS7qkE85Lp/y0r9XN/qut
 Doj0Kb/pzS4J/43NDKvvdGTqRQpubRDb2L2F/E9tQhWTsGL1qg0JNaF0eyI2EpV2nLUg
 VI3SghxCceaGSC1DeuKp0zH2v21Z2TeCFvcTxPUKvcr11KeFAYla9Midv6eT5bd7W1sC
 8qLkEuTnh13LdzT/8zH6Ki8mCxNyJdGk2cJprhxbIaJShfq/X0AFL/XT8uH5yx4ME0vX
 iuTw==
X-Gm-Message-State: AOAM532oGkNAc3CikWWoRr9sAIv4EaTqc8YZO1xrr8CABwMqZttb4Q2h
 9cy5fKocRRC86jLafp77UTQTDxEKO8YXd5zGa3U=
X-Google-Smtp-Source: ABdhPJwWNfVDJOe4S+CC5sC0iDIGMtyf74siGOob2SIgf5l3rZC69UyRSxxJdQKkmrzttCcYKvwvYg==
X-Received: by 2002:a17:907:960e:b0:6fe:78f6:705f with SMTP id
 gb14-20020a170907960e00b006fe78f6705fmr27769208ejc.711.1653438066748; 
 Tue, 24 May 2022 17:21:06 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com.
 [209.85.221.53]) by smtp.gmail.com with ESMTPSA id
 z18-20020a1709060bf200b006feed200464sm2275838ejg.131.2022.05.24.17.21.03
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 May 2022 17:21:04 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id e28so27287257wra.10
 for <freedreno@lists.freedesktop.org>; Tue, 24 May 2022 17:21:03 -0700 (PDT)
X-Received: by 2002:a5d:5009:0:b0:20d:846:f4da with SMTP id
 e9-20020a5d5009000000b0020d0846f4damr25355018wrt.301.1653438063415; Tue, 24
 May 2022 17:21:03 -0700 (PDT)
MIME-Version: 1.0
References: <1653082028-10211-1-git-send-email-quic_khsieh@quicinc.com>
 <1653082028-10211-2-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1653082028-10211-2-git-send-email-quic_khsieh@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 24 May 2022 17:20:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VRNAC3=VAZcw5H1jReGzdbTCbD83OqRcYztrzhPD3PAg@mail.gmail.com>
Message-ID: <CAD=FV=VRNAC3=VAZcw5H1jReGzdbTCbD83OqRcYztrzhPD3PAg@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v11 1/3] phy: qcom-edp: add
 regulator_set_load to edp phy
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 David Airlie <airlied@linux.ie>, freedreno <freedreno@lists.freedesktop.org>,
 Vinod Koul <vkoul@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Andy Gross <agross@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Fri, May 20, 2022 at 2:28 PM Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> This patch add regulator_set_load() before enable regulator at
> eDP phy driver.
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
