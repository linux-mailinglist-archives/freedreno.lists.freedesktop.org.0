Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6C66635A2
	for <lists+freedreno@lfdr.de>; Tue, 10 Jan 2023 00:44:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DAB210E525;
	Mon,  9 Jan 2023 23:44:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F2F010E517
 for <freedreno@lists.freedesktop.org>; Mon,  9 Jan 2023 23:44:07 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id g13so15614866lfv.7
 for <freedreno@lists.freedesktop.org>; Mon, 09 Jan 2023 15:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=pymBsysiRj4PWzpdrYvrGh6WCe9aRMDyVw4Cchu5q1Q=;
 b=THWK7AP+s7+Zb1Lq2jA9fh9HZw2EhVfxFT9lw68Jun80sZouyMv0hzuBM4gUSFOQ8b
 O8J2qNrkf/y2btAeA92LsJoQYXEofkK873PwSsO86R4oAkO260Pb+7OE6SJ3Z6fSSXwF
 bEWBIrH2Ci3XCDoNGojzGKodmmhv/1eG2gpWMC0lu+V/9raJSrPjt7qWkRzmotTEmjDx
 SeDMrcmbJx1FUi5TH273GJenI6PFeTM7Klvx4gmys/rqfMXSVu6p6Xhne82PpODMcy5n
 cSpJgCVFsEHWOM5hHFCT6VoJ4sAcjHH+2YE3tAuaqgoIogt6uAmNzW8nxnwKhrhUoM+n
 B70A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pymBsysiRj4PWzpdrYvrGh6WCe9aRMDyVw4Cchu5q1Q=;
 b=T+lHCqKq2TJrSZdR/wRLSjGL2vHGPxBZC4i7SikMZJukFPou0il1SS7yrtrgkUX1zQ
 TDMWlc288ruhMhIQMrFRyH9hPQ2MUqxf88EQLjlBRA9Yfd2ULmNENVkeVl3K/HH9t/I7
 Y/R9157YvGKIgLhf0BPJo7jQ5NJbF7JyJOT6iHCuXH7RxiVV1lacL6Oj2i2FtguXPBUE
 9UmsbGIpayuudik0ZpvRXeQBuoghaq/1QMZVNVBtJG+WHogJfGxFzLgDMuax8eKSWE7U
 9yzfsAFOi5ntJsk+CjTObBtgfbRa9+yXHAj7NjmqC0srDC/VFif3Xm5iqZLqCdjDTCJR
 fcPA==
X-Gm-Message-State: AFqh2kqHqC99QM540O/RRG9ZVyoq9WLbefQLzXnf4iWLq2WdDXo/Nfar
 BPrQrUPtmW3HJhgHBOvnrkvg0Q==
X-Google-Smtp-Source: AMrXdXtIVvzkj4fVEFNF2MrIz3KR+4VgtYza83XbuyEDgYfxykegrPPYtCARasfAXCCWjObpRzqQhg==
X-Received: by 2002:ac2:5454:0:b0:4cc:8985:b565 with SMTP id
 d20-20020ac25454000000b004cc8985b565mr216605lfn.30.1673307847139; 
 Mon, 09 Jan 2023 15:44:07 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 s9-20020a056512214900b004b5a4cf69dfsm1835255lfr.261.2023.01.09.15.44.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 15:44:06 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Del Regno <angelogioacchino.delregno@somainline.org>,
 Loic Poulain <loic.poulain@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 10 Jan 2023 01:43:51 +0200
Message-Id: <167330408778.609993.10640569681810813503.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221225115925.55337-1-krzysztof.kozlowski@linaro.org>
References: <20221225115925.55337-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH 1/2] dt-bindings: display: msm: drop
 redundant part of title
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


On Sun, 25 Dec 2022 12:59:24 +0100, Krzysztof Kozlowski wrote:
> The Devicetree bindings document does not have to say in the title that
> contains "DT properties", but instead just describe the hardware.
> 
> 

Applied, thanks!

[1/2] dt-bindings: display: msm: drop redundant part of title
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e90c380ea283
[2/2] dt-bindings: display: msm: drop unneeded list for single compatible
      https://gitlab.freedesktop.org/lumag/msm/-/commit/7ad6586652fa

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
