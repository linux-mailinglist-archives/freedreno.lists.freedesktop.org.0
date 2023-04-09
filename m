Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7DC6DC231
	for <lists+freedreno@lfdr.de>; Mon, 10 Apr 2023 02:46:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67DBF10E21D;
	Mon, 10 Apr 2023 00:46:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
X-Greylist: delayed 589 seconds by postgrey-1.36 at gabe;
 Sun, 09 Apr 2023 23:42:00 UTC
Received: from ixit.cz (ip-89-177-23-149.bb.vodafone.cz [89.177.23.149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF70E10E059;
 Sun,  9 Apr 2023 23:42:00 +0000 (UTC)
Received: from newone.lan (unknown [10.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by ixit.cz (Postfix) with ESMTPSA id A26B416181D;
 Mon, 10 Apr 2023 01:32:06 +0200 (CEST)
From: David Heidelberg <david.heidelberg@collabora.com>
To: konrad.dybcio@linaro.org
Date: Mon, 10 Apr 2023 01:31:55 +0200
Message-Id: <20230409233154.135495-1-david.heidelberg@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230321213557.1737905-1-konrad.dybcio@linaro.org>
References: <20230321213557.1737905-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 10 Apr 2023 00:46:24 +0000
Subject: Re: [Freedreno] [PATCH] dt-bindings: display: msm: sm8350-mdss: Fix
 DSI compatible
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
Cc: sean@poorly.run, devicetree@vger.kernel.org, rfoss@kernel.org,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_abhinavk@quicinc.com, robh+dt@kernel.org, agross@kernel.org,
 David Heidelberg <david@ixit.cz>, krzysztof.kozlowski+dt@linaro.org,
 dmitry.baryshkov@linaro.org, marijn.suijten@somainline.org,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Reviewed-by: David Heidelberg <david@ixit.cz>
