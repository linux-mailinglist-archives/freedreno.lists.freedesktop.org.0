Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF8A565ACC
	for <lists+freedreno@lfdr.de>; Mon,  4 Jul 2022 18:16:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3167110E5E5;
	Mon,  4 Jul 2022 16:14:35 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B30710E06A
 for <freedreno@lists.freedesktop.org>; Sun,  3 Jul 2022 03:57:10 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id u9so8876132oiv.12
 for <freedreno@lists.freedesktop.org>; Sat, 02 Jul 2022 20:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LhPnorymh1jvOB7TuRgrf27dj9dMZpl5MtOAOoxse7Q=;
 b=eEiwobWbp3rB79bESggf6L8eZjsRwL5Kfh0BeylWl2sFwzRtP5Fu4yAcchqMcbm7h1
 O5qniSz0j7QPaQKXyr+nKFXFy2aKRg4dyyzrmcIm4snTK8HU65MnX0xIfWeHXEvL7Urn
 TE7CWRXd/EeTsMh1JEugP0+y9140ZfcZlGrHFsGmVbkZzZD1Odm5SrnwwefyfijDtkSY
 39Od2PlpdDjT2k0K3BGe/K++Vj0daNa1EEAEmCIUUtLGca71BpxnAGAXloxnAuUojkUp
 mOwIGJPVzCIfWTzM5fwEp+h0Y9iFo4dU3TKltahDym0eqwV4n3/8uZZpFYR7k6SsAOl4
 Mcqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LhPnorymh1jvOB7TuRgrf27dj9dMZpl5MtOAOoxse7Q=;
 b=SF/pSBIwXp/zddg1vmDiIEmYIllwtReg4FCRcAbDqktmntTTioHFybi+KWld0YIOjN
 B3qxFuI6EkVJHBgap0qnnLjRyMBLVxhHG0NVNPGLDdyCMCBI+3tnWvZXnwuIU0lFdi/U
 feA+wVV/evpRSeNf+fDuZmSFO0Sgi9/eJ3o87wLD3k1M3p3jXz2NXehU9BbVg3AnJ2vJ
 6qbepTRHYjbtREF+lb9DpOuo/1w9HqfY26IkDSjBTsZfdzyTwrmTXvVO41e3oA20M8Or
 gioK/8W19pg1vfWxC9LpePcuT7QYRfkifFaqpGsVqwnOFPLn8UmVwPKvmj0C1Yy/4ViM
 /5yA==
X-Gm-Message-State: AJIora9Rpp+VmBYD7HvubNBl4/ssJcQDj+4mHtd6/Aev0RBGiBahVEiU
 sDPFAumrJYZbYM0vFqC+xI/dpA==
X-Google-Smtp-Source: AGRyM1uiQEQpmXE7A4Lmwz5n9N1cJ6ML0u9fvD79JZTeeTOg6S9eoryUgxyktPz3gR/qdNIonRmiOQ==
X-Received: by 2002:a05:6808:14c4:b0:337:a9d2:404c with SMTP id
 f4-20020a05680814c400b00337a9d2404cmr3405112oiw.146.1656820629317; 
 Sat, 02 Jul 2022 20:57:09 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186]) by smtp.gmail.com with ESMTPSA id
 25-20020aca0f19000000b0032e5d0b5d5fsm12965910oip.58.2022.07.02.20.57.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Jul 2022 20:57:08 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat,  2 Jul 2022 22:56:05 -0500
Message-Id: <165682055972.445910.896659081667687802.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220617103652.606250-1-dmitry.baryshkov@linaro.org>
References: <20220617103652.606250-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] (subset) [PATCH] arm64: dts: qcom: msm8996: add
 second DSI interface
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
Cc: devicetree@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, 17 Jun 2022 13:36:52 +0300, Dmitry Baryshkov wrote:
> Add device nodes for the DSI1, second DSI interface found on
> MSM8996/APQ8096 platforms. For example on db820c it is routed to the
> secondary HS expansion connector.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: msm8996: add second DSI interface
      commit: 2752bb7d9b58accbaa15bcfc50de0e41e84990d5

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
