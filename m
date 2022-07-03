Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BABD565AC5
	for <lists+freedreno@lfdr.de>; Mon,  4 Jul 2022 18:15:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7573210E57B;
	Mon,  4 Jul 2022 16:14:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16B9310E09B
 for <freedreno@lists.freedesktop.org>; Sun,  3 Jul 2022 03:57:14 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-101ec2d6087so8854058fac.3
 for <freedreno@lists.freedesktop.org>; Sat, 02 Jul 2022 20:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8pyUyqVKFfsPns6kkRYcl2oPKrKQVySYYiE4xgpYN7k=;
 b=sg0Mf81AA/jHMB1Cnn1hgvmo9Je2PEjby6cq8FtWMppDV0dwTUm//kJBHbv8pR4BwB
 j/FtBj4e+TRgW0b8LLpE75Wl/UfDgN709J3WOsfkzkGqFrIy564VLTVlm0+sHgOW5DKX
 MSChhovfWwB/MwOeg3N7teweUFs8YJabN58sYDuRd6ZkoX14s1xq1HxH6K3VyF0Bwjry
 i+veKmfxr+3s/KqsXC6tv8EpMERmtrqerMQkdN72RjBqsfbB4eGnIPTLngTx4y1hItZk
 pcd18M4XQ7uT8kIY6cHEz++jthJoe+kJSmxLt8i7cpOKc53OBfjFf7+CQSb5Ufla3+Re
 QOrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8pyUyqVKFfsPns6kkRYcl2oPKrKQVySYYiE4xgpYN7k=;
 b=ZCSpT/iIFS5l2405YBCNWtCAj0l+v3rHNhG2+ttyui4rY0PII+T5Gw9cFj9xC8l00o
 g++Qxw9ETueg0Bf66FFXLfklGNwXowNGmoa+n6A5i8Syaqpz7CA/et+cN5NYf9oWb0eo
 6HTvLmsKFFCxPIFeGq7rBzRyVIVjqyXK7hY3Vj9rtCw3YTRDB4U2IzblDEgrA9crHRxw
 6bf/Fc/5KSoaKWJu1ocKPiOWUIBqjZS3xa1Wn++cRwCtB0g1OnjR7lczp015VKsNcWQE
 ds8CeGOAYlsTu+vg2r+BxlVdtGfwbTwxK301ReZ31KJvC8XutBkyaVZ98iMDm5+ljk4T
 uIkQ==
X-Gm-Message-State: AJIora+UprmOfWLu8YA0yYzMDoTunT+tcyT1/5vVQuKWf7hHDyjAWcTv
 4TbqNjookReORIrVKireLrthGA==
X-Google-Smtp-Source: AGRyM1uiElpgE5xH020B9DsxznQsQNmrJaanTne9n2tfx5H6+oy7R6pbP02jWzluWtfowxz9M4K1wQ==
X-Received: by 2002:a05:6870:8292:b0:101:c67e:1b4d with SMTP id
 q18-20020a056870829200b00101c67e1b4dmr14586983oae.88.1656820633300; 
 Sat, 02 Jul 2022 20:57:13 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186]) by smtp.gmail.com with ESMTPSA id
 25-20020aca0f19000000b0032e5d0b5d5fsm12965910oip.58.2022.07.02.20.57.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Jul 2022 20:57:12 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Will Deacon <will@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
 Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Jordan Crouse <jcrouse@codeaurora.org>, Emma Anholt <emma@anholt.net>,
 freedreno@lists.freedesktop.org
Date: Sat,  2 Jul 2022 22:56:09 -0500
Message-Id: <165682055971.445910.5959383973914812219.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220614230136.3726047-2-emma@anholt.net>
References: <20220614230136.3726047-1-emma@anholt.net>
 <20220614230136.3726047-2-emma@anholt.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] (subset) [PATCH 2/2] arm64: dts: qcom: sm8250:
 Enable per-process page tables.
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
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, 14 Jun 2022 16:01:36 -0700, Emma Anholt wrote:
> This is an SMMU for the adreno gpu, and adding this compatible lets
> the driver use per-fd page tables, which are required for security
> between GPU clients.
> 
> 

Applied, thanks!

[2/2] arm64: dts: qcom: sm8250: Enable per-process page tables.
      commit: 213d7368723709cf4567488e63dd667802378202

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
