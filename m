Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6887EE913
	for <lists+freedreno@lfdr.de>; Thu, 16 Nov 2023 23:01:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E342610E6FB;
	Thu, 16 Nov 2023 22:01:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 882C510E6FC
 for <freedreno@lists.freedesktop.org>; Thu, 16 Nov 2023 22:01:04 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-5afbdbf3a19so14487097b3.2
 for <freedreno@lists.freedesktop.org>; Thu, 16 Nov 2023 14:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700172063; x=1700776863; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XrDfTqC4kCNkXvqk06JZuMHZ8F1CQgx8Er0ge2sMlCI=;
 b=xcTKoTSYuL7iRAcauFlCa9cKPnQa61+U14PELs7RCmnSoF0/3uiBKgqwtW6rTT43QC
 m0hs6lsuzmlDECBZZ5WtSEJNaWE6nmjRCwweo46er3AHZY9558Qmt2Yozc1sHyNmtGGZ
 7xLGdFyVpbnfD2qCa7LUKvmZhyVf1CskWGXMemSEdLLv1ARc66Ia71bsD/0x4jToKLe7
 lB47xz2XmV6fkaf5hIz22dUfc/czBc2w6hC0ZeZmVN1qKUR0eB9S5RZwB6C+ft11GrIe
 sy4FmqyeG30u2v4vygOSczkQ5VHfDEjzK24GGkzZPoOUryW1DV5+DrqZGJmNKOVy+fP0
 izvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700172063; x=1700776863;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XrDfTqC4kCNkXvqk06JZuMHZ8F1CQgx8Er0ge2sMlCI=;
 b=NUHfWHn1PyrY4aOsvKa65iiLUPamkMWWhHBi4EcMwFY6CfCdRAUMuBVAXzdtHIk9sY
 rHKR4Z1oeiuASJx6W09D1gt0TOxJcL6cTs162ITErGvCgqxx+FKBYlqlNrCkm2IxBEak
 MoCO4ONuLIUMilGA9Ht03BQ72FvmierszGn3nxSEylUzkh4glJqlr1ptH8i9ivzeKKoB
 6hckeglQluV1vfq6zWkOBGyYyT/E1qTVCPWShEafJFB7xA0XZ+QXMHjGTlg2jtf8ZPXx
 AFS5cGQC3NkvU0J2RcjN/WiDG8lrjym4JKKa+xG+aXIulvdjwCDTaGM6uLh6FKmAWJbi
 AwAA==
X-Gm-Message-State: AOJu0YzjvWRsLmMZ64zTPI0rfIgL1xe1MSQc21AroaA02uU7Jh9E4o1g
 2hKnBvGmCrr3euNweNRCKEowrBoV4SCNoJpRNTdixQ==
X-Google-Smtp-Source: AGHT+IFar8dbn8tWGRc5Du9nzxi2agmew03+it+BDi75j3YNagGC4edoDYvKPdFZlty1Nzek7YOPn3SS7ZFTZyvb9QY=
X-Received: by 2002:a05:690c:a87:b0:5c1:8075:5a7d with SMTP id
 ci7-20020a05690c0a8700b005c180755a7dmr18665864ywb.39.1700172063677; Thu, 16
 Nov 2023 14:01:03 -0800 (PST)
MIME-Version: 1.0
References: <20231115224409.240935-1-robdclark@gmail.com>
 <6107757c-1217-1759-8bcf-7dbce6f2e730@quicinc.com>
In-Reply-To: <6107757c-1217-1759-8bcf-7dbce6f2e730@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 17 Nov 2023 00:00:52 +0200
Message-ID: <CAA8EJpqUBTMnkcR_dmvRCaBGNCn6x-mvnna4qVkzCVqQKBFyJQ@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/gpu: Move gpu devcore's to gpu
 device
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 16 Nov 2023 at 00:58, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 11/15/2023 2:44 PM, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > The dpu devcore's are already associated with the dpu device.  So we
> > should associate the gpu devcore's with the gpu device, for easier
> > classification.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
