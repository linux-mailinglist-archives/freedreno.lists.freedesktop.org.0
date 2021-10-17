Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4202E430A15
	for <lists+freedreno@lfdr.de>; Sun, 17 Oct 2021 17:31:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 187976E5D5;
	Sun, 17 Oct 2021 15:31:26 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8806E6E5D5
 for <freedreno@lists.freedesktop.org>; Sun, 17 Oct 2021 15:31:24 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 l16-20020a9d6a90000000b0054e7ab56f27so2914559otq.12
 for <freedreno@lists.freedesktop.org>; Sun, 17 Oct 2021 08:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UFaKtGf2M9rTkoqS110bHbqzZ66MK1yJ16chK4hVUHA=;
 b=mt6U3RUy7HLlyDHFkboOEOzbsWq0i9ZreASbV2vwjoNHFyicMTfLYJYfXGc7eKC+F1
 KEEwJkVCm0gYvzxTQpqJ27h3mnYtEvGV0eQJ66+tMiL3ZKi6bsh8Ul7g2Uc4+L8RLUlY
 Q7EbesvEeUL7GOvPtp6653yrCshgL9uxpo7Zlk6sRITsDgMviKwlPISITpXDDHazBLlS
 9ne3CvZaDZdk0Rhurj5V2C59VT+Fm98co8zvutGfD3OyLf7H6UvlG7tGaUSrh7GoMc/3
 LSlpswI8ofcsZVpUbTc2WMwXQe+EbYKcmJEczdBRoeQTdhnKZwvLCbqjL9z5mSwuVG5O
 HBvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UFaKtGf2M9rTkoqS110bHbqzZ66MK1yJ16chK4hVUHA=;
 b=Kcn89kq4QXBzrKQEdklSkEG7fnVaPa6d9FB6hshesmOuzUhyc3/pym4F68POTIleo1
 qea9JSdglAam/wmdpOU5kdNO8gRsU4zn76aBMcHUuupg8K5/F+1zSWAMWdpk1VxfadgB
 WTbiOwaqNQHz+voX6XtOpW2R8X/lHiZqDdVDHO12y3j3FWytMk8jk8IVeqiSUKcPmmoo
 +vSm50K9ntfLm5RG6pYGusGvX0+9Xk7kak4HUX9kRtLoaiQVEpSF4al5GkaFa9clYntH
 RhEnfnZS5xRkt8lLVPrdPialhc0aLbzKBJFrPgqm7xm8YVjSYYLenlaUYxpU1ca2R2Wg
 vL/w==
X-Gm-Message-State: AOAM5323GxkLjS6hqmYARzNs4weMmzI1Qj9jdB22dzb4e2XBYhU5125P
 Dm+li7cBVBnCaJzJn8yjn6cqjQ==
X-Google-Smtp-Source: ABdhPJx3t/WpHKaJrg4yiVHwANKcQgG6EiyHAfCgVoeXcxw7Yg7y22Tb3Iwq2db5P9DTjKT6eQs7hg==
X-Received: by 2002:a9d:714b:: with SMTP id y11mr19170547otj.289.1634484683795; 
 Sun, 17 Oct 2021 08:31:23 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
 by smtp.gmail.com with ESMTPSA id x6sm2565698otp.49.2021.10.17.08.31.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Oct 2021 08:31:23 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Sean Paul <sean@poorly.run>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Date: Sun, 17 Oct 2021 10:31:09 -0500
Message-Id: <163448466185.410927.11756419943796079115.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211014214221.4173287-1-dmitry.baryshkov@linaro.org>
References: <20211014214221.4173287-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] (subset) [PATCH] ARM: dts: qcom-apq8064: stop using
 legacy clock names for HDMI
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

On Fri, 15 Oct 2021 00:42:21 +0300, Dmitry Baryshkov wrote:
> Stop using legacy clock names (with _clk suffix) for HDMI and HDMI PHY
> device tree nodes.
> 
> 

Applied, thanks!

[1/1] ARM: dts: qcom-apq8064: stop using legacy clock names for HDMI
      commit: 03d4e43fc5beded1aa67c12b7c7e6932ae9a40cc

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
