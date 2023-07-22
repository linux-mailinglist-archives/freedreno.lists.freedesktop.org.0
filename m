Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C38075DB50
	for <lists+freedreno@lfdr.de>; Sat, 22 Jul 2023 11:24:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A85C710E107;
	Sat, 22 Jul 2023 09:24:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FB3710E089
 for <freedreno@lists.freedesktop.org>; Sat, 22 Jul 2023 09:24:52 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id E10EA2014D;
 Sat, 22 Jul 2023 11:24:48 +0200 (CEST)
Date: Sat, 22 Jul 2023 11:24:47 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <ntbi7qdmxznuof27qtbvhxct7ol3rdioabtaary4u4chprrnml@vx2d2ctq73gp>
References: <20230718-sm6125-dpu-v3-0-6c5a56e99820@somainline.org>
 <20230718-sm6125-dpu-v3-6-6c5a56e99820@somainline.org>
 <3ce19d8f-97d8-15b6-5148-78e200b112e9@linaro.org>
 <tpkiplw7l2mzdwekynkrg6dwm7svktwm2zooodb3c42btyvo3e@yjrpqem26wtx>
 <CAA8EJprHEes5T1z4-sxg_Xk+VjuyoTH0Ra-VyMnrWjTv7qG9EA@mail.gmail.com>
 <m425lafv5gvrnyhoarasqgkoumntgsxiqdpmsudcxrwspvf6ed@al5sr3t2mwec>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <m425lafv5gvrnyhoarasqgkoumntgsxiqdpmsudcxrwspvf6ed@al5sr3t2mwec>
Subject: Re: [Freedreno] [PATCH v3 06/15] dt-bindings: display/msm:
 sc7180-dpu: Describe SM6125
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
Cc: Michael Turquette <mturquette@baylibre.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, dri-devel@lists.freedesktop.org,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@gmail.com>, linux-clk@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Andy Gross <agross@kernel.org>, Lux Aliaga <they@mint.lgbt>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Loic Poulain <loic.poulain@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2023-07-20 21:10:52, Marijn Suijten wrote:
> On 2023-07-20 01:24:27, Dmitry Baryshkov wrote:
> > On Thu, 20 Jul 2023 at 01:09, Marijn Suijten
> > <marijn.suijten@somainline.org> wrote:
> > >
> > > On 2023-07-19 01:06:03, Dmitry Baryshkov wrote:
> > > > On 19/07/2023 00:24, Marijn Suijten wrote:
> > > > > SM6125 is identical to SM6375 except that while downstream also defines
> > > > > a throttle clock, its presence results in timeouts whereas SM6375
> > > > > requires it to not observe any timeouts.  This is represented by
> > > > > reducing the clock array length to 6 so that it cannot be passed.  Note
> > > > > that any SoC other than SM6375 (currently SC7180 and SM6350) are
> > > > > unconstrained and could either pass or leave out this "throttle" clock.
> > > >
> > > > Could you please describe, what kind of timeouts do you observe? Is this
> > > > the DSI underruns issue?
> > >
> > > Ping-pong timeouts and low(er) framerate.  However, they were previosuly
> > > not happening on a random boot out of tens... and now I can no longer
> > > reproduce the timeout on 4 consecutive boots after adding the throttle
> > > clock.  Could it perhaps be the power domains and opps that we added in
> > > v2 and v3?
> > 
> > Quite unlikely, but who knows. My main question is whether we should
> > continue skipping the throttle clocks or if it should be enabled now.
> 
> And that "main question" could ... drum roll please ... only be answered
> by knowing if this got "accidentally" fixed by providing the right PMs
> or some other change entirely while I changed base branch and defconfig.
> Or if this is just a fluke that persisted multiple boots but will fall
> apart in some time and/or when someone else runs this on their device?

I'm going to write this off as PEBKAC from my past self.  I went back to
an older branch where I recall adding this clock, added it to DT again,
and observed no timeouts or inexplicable behaviour on multiple boots.

Since downstream passes it as well, I'll revise this series for v4 to
require it in dt-bindings, and include it in DT.

- Marijn
