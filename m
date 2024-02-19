Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9356285A344
	for <lists+freedreno@lfdr.de>; Mon, 19 Feb 2024 13:31:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CECC010E3AB;
	Mon, 19 Feb 2024 12:30:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HxGESP66";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB88710E3A7
 for <freedreno@lists.freedesktop.org>; Mon, 19 Feb 2024 12:30:52 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-512bb2ed1f7so600166e87.3
 for <freedreno@lists.freedesktop.org>; Mon, 19 Feb 2024 04:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708345851; x=1708950651; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TpAohRwTwYbAuMyXNWeiGCD6UdiTEgdchbEGaanHYJ8=;
 b=HxGESP66vILPA77K36XLwSoFuSs6OYz0moz7vVSdi0fm4naKGZwlhYmfwaV9DX3R6J
 /oyvp6R1KLeyPzikNBYDWYq8O4oTZAVdHdBeaFp6aroCi8rrGZQBG8VTGZiByBAziS+Z
 RW6zy8a65BBjpfzBf1VU/+5i0QlcCiTvp3arNfMUgqydO+S6GNKTecRIZFrNs0B5JIp/
 2yZDvOlBvZ6rjo8/yGkvffAtnWa0FGO8BGkF9WHC0zWWgQUDnh9tGtbdyA4pJLgbI2Mp
 NliU8KEjz/f5jfMnxUkK3AK0WTH01UGlcXhq8Xlprf2OPteZ8oxF0mCOfsWi0Ir4gf8o
 bw9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708345851; x=1708950651;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TpAohRwTwYbAuMyXNWeiGCD6UdiTEgdchbEGaanHYJ8=;
 b=p4Aqax3TBQsiQrL1RP3A5OJQcycXbsHb3xLf9w1h1CgTLGBZQBplfWamCDjDXeYU0d
 xR++Es3pbGT7h0htT19iXYZjo8D8R84gtcDk0fT6DKDLgJ4cDESY2tU58cywzGRZtg9Y
 K30xHojK80Y8HkB8w9aSxO+Kya3YzfjQN1JRlA02suIQf4JZhNLnGdin4aod3Rn2IUd1
 Zjxil5HgcIUxPRzfVO/yH9Qym1GtBApM5U505/Tw3cI1kU5nlQ2KKasuK0iINkvZhuJb
 s1sEHNee5CDE64gngt6gLD7WpcP64eTe5j9tAUmfa7+rBxHwtHd4kEnTdrXn1yCPRP1o
 zf3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9+D8uu4Qo4iDfb42dQsC/TXELe0lDQ3zCyMKAEy1SrlqF4Ui2cn1NIrXqGza+Nmxekm5ksrvNt7ACFXYVqBNqIXk9dgzLNJxBlzFge+wX
X-Gm-Message-State: AOJu0YyjVUGG0XRbC/UtW6LxHAmS7UL8Obdo6U5M3buDdSRrZxIOIgE3
 L7iwaH2gC8dqtcmRTbAANV79TEeAw7oQfHaUkz5j2p3qpUtRGRkSDOu3vfanRjU=
X-Google-Smtp-Source: AGHT+IFlu6VTSkvuiYZTha+WVDfU9F1rby9AFqQIs6ooFgMJwGVOj+HHMKyt94DNvUTyn3MOK1rWAg==
X-Received: by 2002:ac2:489a:0:b0:511:5f38:76e with SMTP id
 x26-20020ac2489a000000b005115f38076emr7448667lfc.1.1708345850792; 
 Mon, 19 Feb 2024 04:30:50 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 i6-20020ac25226000000b00512bde4cddfsm90466lfl.148.2024.02.19.04.30.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 04:30:50 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Vinod Koul <vkoul@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Luca Weiss <luca.weiss@fairphone.com>
Subject: Re: [PATCH] drm/msm/dpu: Only enable DSC_MODE_MULTIPLEX if dsc_merge
 is enabled
Date: Mon, 19 Feb 2024 14:30:38 +0200
Message-Id: <170834569503.2610898.6715741555434645771.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240204-dpu-dsc-multiplex-v1-1-080963233c52@somainline.org>
References: <20240204-dpu-dsc-multiplex-v1-1-080963233c52@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Sun, 04 Feb 2024 18:45:27 +0100, Marijn Suijten wrote:
> When the topology calls for two interfaces on the current fixed topology
> of 2 DSC blocks, or uses 1 DSC block for a single interface (e.g. SC7280
> with only one DSC block), there should be no merging of DSC output.
> 
> This is already represented by the return value of
> dpu_encoder_use_dsc_merge(), but not yet used to correctly configure
> this flag.
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dpu: Only enable DSC_MODE_MULTIPLEX if dsc_merge is enabled
      https://gitlab.freedesktop.org/lumag/msm/-/commit/06267d22f9ee

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
