Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1EAD663568
	for <lists+freedreno@lfdr.de>; Tue, 10 Jan 2023 00:36:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64A5110E0CF;
	Mon,  9 Jan 2023 23:36:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2153910E0BE
 for <freedreno@lists.freedesktop.org>; Mon,  9 Jan 2023 23:36:15 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id g13so15591177lfv.7
 for <freedreno@lists.freedesktop.org>; Mon, 09 Jan 2023 15:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fbCC4/NAEi7QL8GVYq6w9KKB1sHLRdN0BAnnJp4jmt8=;
 b=QUKkUjDYxkCANV7FXFWAUCbtNdYq7o1JAGSF4bdCRRd+7kq/ye4HIqfKqFkbneK00c
 BymCCO9DjFleTxh1kCUZWRJ5Hr+MJPLl0o1QA9RWghyCoG+3jV9foyHNvqaV4Z7kzPIL
 M6hWDW2Qta7LfB4uv0UMyrjdCRSdR6Fm+Pa+mbRkvCDxR6Tx63ihqBvWRcOJzQ+PXRoI
 WJHjYhSO7bqZYzEFL0aKbfO5aFs3K7AEdMNxyYJ7zOIsf2uXabjIyuDj2HIQB/xuGikh
 qQw+/j8VXo8/cwOponk2G9YKEssaKTA3BVqo8efaRfd5bRYnXjgRFMRq9PYq1jTjCmRQ
 9yDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fbCC4/NAEi7QL8GVYq6w9KKB1sHLRdN0BAnnJp4jmt8=;
 b=WWgCU63+UqBuSWFXTOIR3k+0lWSgBnI1sjXCiV3KIbKRm8TMR11XvWozg3Z6YrlHbA
 lKseS+eI7nf15R25K8/Z3ADQ+frOzkO041lY6T3q+hj7Peqvnd+467p2akI3fhUhuQMy
 yi/798ZT65fOOfMlJ9PrB13z7DJc1AqmKfY7Xb55d9mdSM007rJr6nbyTcVG0k1WiMfp
 xVuAaaArckHFm/r1dBEoWEKRoWhgccTB7Ndqe8SdeIGR4wuAEgYn3hHjjcmqjGHEIgP7
 mWwnS9Toqips3FFhErVM4ka4Z4LFThUKbqn92vS/PTFkP857M3bMslFT2Mffp9asYuok
 kjYw==
X-Gm-Message-State: AFqh2kr1/sFIzxRZTRGp9aRGcwDKBAWJDnLPlS51eRcvrKTWqGpiTzqB
 k3heOzgb2SrdWuwfP51eGxi/Ww==
X-Google-Smtp-Source: AMrXdXvXjSjyrWinT0Qx1C/ylFYva16KNvkPkx496D30fxTHNGVyv8d6IUO8gZU9xBTAzAKNI4S9pg==
X-Received: by 2002:a05:6512:32d2:b0:4cc:8375:701d with SMTP id
 f18-20020a05651232d200b004cc8375701dmr1559796lfg.44.1673307373497; 
 Mon, 09 Jan 2023 15:36:13 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 4-20020ac25f44000000b00492e3a8366esm1841307lfz.9.2023.01.09.15.36.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 15:36:12 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 10 Jan 2023 01:36:12 +0200
Message-Id: <167330637780.615458.8361646864456567493.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109214309.586130-1-dmitry.baryshkov@linaro.org>
References: <20230109214309.586130-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: disable DSC blocks for SM8350
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, 09 Jan 2023 23:43:09 +0200, Dmitry Baryshkov wrote:
> SM8350 has newer version of DSC blocks, which are not supported by the
> driver yet. Remove them for now until these blocks are supported by the
> driver.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: disable DSC blocks for SM8350
      https://gitlab.freedesktop.org/lumag/msm/-/commit/3b2551eaeac3

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
