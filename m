Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD8E22F9B0
	for <lists+freedreno@lfdr.de>; Mon, 27 Jul 2020 21:59:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3044989F6B;
	Mon, 27 Jul 2020 19:59:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D0F389F6B;
 Mon, 27 Jul 2020 19:59:04 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id o18so18281371eje.7;
 Mon, 27 Jul 2020 12:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=djQ21RTJ93c9kqwB25zIQ/ST+ogHMsSV3nZHz/8ca38=;
 b=heONYTvaIXjisXfWesNdZBH3HR8Goezr0M9/B4pi218SoZAhRizIbEnlpbiqZJYMa3
 CymQT7ZTt7ccvP9R1yW4XYJ8IGQ/8EWsv9QTUTnNbBj7inBMYkRpsKQiO/fhVISer/Pq
 0vYdTkQ2Qn829HoEkOgIN9H5M2pqiH+EgUH86glh+ZWkp3u7ZgS83Ma4NJuxLHsMv0XT
 5URHnSmWVFfrEeMA03efn6TKDJetxsRmfy+VJcdXh3h6WYjImIxnOMfDwI8sXEU0c836
 81anQIl0wlW5GrrZ7zpqqgJMiU5UyaCEmqUOFHnDHEu/yIyTXgsYKrdQhA8yOZSRXJIP
 onpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=djQ21RTJ93c9kqwB25zIQ/ST+ogHMsSV3nZHz/8ca38=;
 b=D7cunOGzR1sQ7roErA2SB1zRk0RYazq9tD6zkVcwbwmk6+LsZahgJJJfpTAIambWMu
 2aJdSO3eg9vOHMauuM3kRlQPEt/15P0jYLi64EXr1cOX7huBe0PsjZatV0OZVua2U8NL
 EeJVwOAh482QYSntt62c7NO348vKnoTGGK2P2YgVfd9BbXVURIIU6Oc89qOFEoI7UPmP
 Los6/8P0H3xuqQN/moanQ/ceYsDPElx7lo5/AMBV3/G4Fx3QSLyS6bNsyIfGU2IkJR5F
 deOjWAgltbznd6Fc6RdpOQnnOr5e47GRQXdaFnrjg/6ymiH5f+onZnb9BuSSco+hj6t2
 Jf0w==
X-Gm-Message-State: AOAM531l63Z4PVB8/1XG7F4+/jcTM/aSgEc1DuGC9IWzk6po0xrslO9p
 fDJi4XS9fxWKq7L5K0xs9TVHNsvGWvRC51YkySs=
X-Google-Smtp-Source: ABdhPJwfVv71IAplhkO3yFPYokjDknujpfGl4Qc8owyxPo/klfQMtQ6qhz4AzI9gvxqd9KqcUezDTWMXq2Y5KwAMqsI=
X-Received: by 2002:a17:906:365a:: with SMTP id
 r26mr18823220ejb.52.1595879943063; 
 Mon, 27 Jul 2020 12:59:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200726111215.22361-1-konradybcio@gmail.com>
 <20200726111215.22361-2-konradybcio@gmail.com>
 <159587899589.1360974.4403082749390843157@swboyd.mtv.corp.google.com>
In-Reply-To: <159587899589.1360974.4403082749390843157@swboyd.mtv.corp.google.com>
From: Konrad Dybcio <konradybcio@gmail.com>
Date: Mon, 27 Jul 2020 21:58:27 +0200
Message-ID: <CAMS8qEXRJxKTqyiB9f7YeKr7_Mcik96BM=K5WLUf2fbALsAALQ@mail.gmail.com>
To: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [Freedreno] [PATCH 1/9] clk: qcom: gcc-sdm660: Add missing
 modem reset
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
Cc: Krzysztof Wilczynski <kw@linux.com>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, devic <etree@vger.kernel.org>,
 Rob Clark <robdclark@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>,
 Martin Botka <martin.botka1@gmail.com>, Andy Gross <agross@kernel.org>,
 Brian Masney <masneyb@onstation.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-clk@vger.kernel.org,
 Xiaozhe Shi <xiaozhes@codeaurora.org>, Jordan Crouse <jcrouse@codeaurora.org>,
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>,
 Ben Dooks <ben.dooks@codethink.co.uk>, Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Harigovindan P <harigovi@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 zhengbin <zhengbin13@huawei.com>, Manu Gautam <mgautam@codeaurora.org>,
 Vinod Koul <vkoul@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Shawn Guo <shawn.guo@linaro.org>, freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Fixes: f2a76a2955c0 (clk: qcom: Add Global Clock controller (GCC)
driver for SDM660)
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
