Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 610BD6DB746
	for <lists+freedreno@lfdr.de>; Sat,  8 Apr 2023 01:37:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33FB210E842;
	Fri,  7 Apr 2023 23:37:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80F7710E00B;
 Fri,  7 Apr 2023 23:37:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 62DD765569;
 Fri,  7 Apr 2023 23:37:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2751C433EF;
 Fri,  7 Apr 2023 23:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680910640;
 bh=9lRQMr3cD4EktQp1jtnbJwqKQHZthfjyKhpfZ3x8Log=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=u9RZlNMAaUe42lB8EburJ7Av6z9hRvOOgjZVLfvI3FqmNRrW7l9avZAvX6wQcTd4a
 P95fHa73ATVAXSBaA71/0ErkhkXsdQfQ7xAqa5FYdT5mIOFQpQgZQFd4+Uh+DBQ9eK
 zjo80c5geRi9d1lACluUnJyfu+sLn1HjGPsAJeroaGhHrobIhllDBJmZsqZ7cwELD2
 IzygGf6QeNvjzedk7Cua8egZt+gEseUghTYB5peygIr8I9W+oukxgzUAUowj8nv09s
 76KZ+hzD4fo9EV2KynIdw8bMbXoAyiDhqtByddfXkQ/9Fwu6PF4nhIajFiP7ryVfQt
 KWuj39wtjyGXQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sean Paul <sean@poorly.run>, Andy Gross <agross@kernel.org>
Date: Fri,  7 Apr 2023 16:40:05 -0700
Message-Id: <168091080212.2759405.6835118297861894893.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230331-topic-konahana_speedbin-v3-0-2dede22dd7f7@linaro.org>
References: <20230331-topic-konahana_speedbin-v3-0-2dede22dd7f7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] (subset) [PATCH v3 0/5] SM8[12]50 GPU speedbin
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
Cc: devicetree@vger.kernel.org, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, 31 Mar 2023 03:14:48 +0200, Konrad Dybcio wrote:
> This series brings SM8[12]50 (A6[45]0) speedbin support along with a
> touch-up for 8150, allowing Adreno to cooperate with the display hw.
> 
> Tested on Xperia 5 II (SM8250 Edo PDX206) and Xperia 5 (SM8150 Kumano
> Bahamut).
> 
> v2 -> v3:
> - Don't swap speedbin 2 (with fuse val 3) and speedbin 3 (with fuse val 2)
>   on SM8250 (no functional change, this is all a software construct but
>   let's stick with the official mapping) [2/5], [5/5]
> 
> [...]

Applied, thanks!

[3/5] arm64: dts: qcom: sm8150: Don't start Adreno in headless mode
      commit: 1642ab96efa427f88e8a54c11b01b1b333ce58bd
[4/5] arm64: dts: qcom: sm8150: Add GPU speedbin support
      commit: b53ae6b63181f4575fc62cd0efb341c8151b0a74
[5/5] arm64: dts: qcom: sm8250: Add GPU speedbin support
      commit: 2a50d1a038be17972220a810c28e9b777cdfcb22

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
