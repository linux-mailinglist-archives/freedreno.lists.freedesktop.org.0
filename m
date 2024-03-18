Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9426A87F068
	for <lists+freedreno@lfdr.de>; Mon, 18 Mar 2024 20:26:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F5F710FE24;
	Mon, 18 Mar 2024 19:26:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="VabCl7Ib";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 611CA10FE0A
 for <freedreno@lists.freedesktop.org>; Mon, 18 Mar 2024 19:26:30 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2d49f7e5c2cso26643481fa.2
 for <freedreno@lists.freedesktop.org>; Mon, 18 Mar 2024 12:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1710789988; x=1711394788;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=xvwBqy02Lt//XY7TKf5p6Szodv2siVQMtlWkmKgSadE=;
 b=VabCl7IbsKnw8R1sT5EpIepwRphz8Vo6CqtGwXOtSdFcaBkfglMclbzg2oAZqp6O5A
 3oo39f+CI2GNqTExetKDd6buVuhxnF2UcwdEl+viP4Mr/X12Mr8gdCHAvZgxU99bY535
 R3swwGI0VCYBhCtQXAck2pGciP+zgQePkOC4I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710789988; x=1711394788;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xvwBqy02Lt//XY7TKf5p6Szodv2siVQMtlWkmKgSadE=;
 b=WFO+ZfISRwgv2y+sbeD5c29sV3lWZ5H/Xwy3r3+l0QVoMvtltEtDaN6kQjO0L3GuxV
 b44Tq552xT95Hsa//4Z10mBFf/U0r85T9dscg2nAy/7pgQuhi+pduEnkW5DLYBd0bzGr
 YbzSwrz09QEU8hhkJo0Ea7mCAeq1eswo3VRk1x5c3cJuw/xD/+aNkko1/u5h7pgm2VH/
 2RgkaAIka5eWOF9XP2aSw2QivrkukfNwKToz8cSBGUfBQFCZIXRNNh6qqH8ZKvafRO5r
 jRRsrZ6FG2uawwtpVfiN2U1sbVFxjUNVTSM06Uc1PD7rOvuqGFsC3HlCIvyRAqMN3V8S
 59hA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAEr0TO0TshqTICNnbY5lNmOxSa+xBZ4Ji9sEhEmYaSXlmdTeop8bIsvyLTGg2QGGUfKU91nlWU3hDgMRNw+xI8lppldnNSulevbJYkB18
X-Gm-Message-State: AOJu0YxEtjyJ85BzE29VOUHresf0wHmVpDIgRvcClNFOAHxzvAPxoyxT
 PY2CkGhQsb2UzqiyAqVim/VU11SkWG4IYNgwJzWmWuIxRqnSHvqglaiE1Uvm6VF7ROOhInREE+2
 yBLXGzWzzJ+VSVEg2xgDDcR423jFWP2R6iEGo
X-Google-Smtp-Source: AGHT+IFe4SIqBk2a4Gcqz06qiXmOLolMnAnmlf22UjLfTc3cWz8vho8vUCaBS8BcelwlfYICaPBpPRtqxlh+N67N26o=
X-Received: by 2002:a2e:7c19:0:b0:2d4:b061:d9f8 with SMTP id
 x25-20020a2e7c19000000b002d4b061d9f8mr1711566ljc.39.1710789988109; Mon, 18
 Mar 2024 12:26:28 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 18 Mar 2024 12:26:27 -0700
MIME-Version: 1.0
In-Reply-To: <20240315143621.v2.4.Ia5dd755f81d7cc9a4393c43f77b9be4ed2278ee3@changeid>
References: <20240315213717.1411017-1-dianders@chromium.org>
 <20240315143621.v2.4.Ia5dd755f81d7cc9a4393c43f77b9be4ed2278ee3@changeid>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 18 Mar 2024 12:26:27 -0700
Message-ID: <CAE-0n51baqN8cEubSqDegqDwL7O6=iEfN5Ho2OykqjmkjQDcvQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] drm/msm/dp: Fix typo in static function (ststus =>
 status)
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, Rob Clark <robdclark@gmail.com>
Cc: Bjorn Andersson <quic_bjorande@quicinc.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@gmail.com>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Douglas Anderson (2024-03-15 14:36:32)
> This is a no-op change to just fix a typo in the name of a static function.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> Changes in v2:
> - ("Fix typo in static function (ststus => status)") new for v2.

This was sent at
https://lore.kernel.org/r/20240306193515.455388-1-quic_abhinavk@quicinc.com
