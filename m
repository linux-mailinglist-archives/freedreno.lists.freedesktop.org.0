Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C006573F60B
	for <lists+freedreno@lfdr.de>; Tue, 27 Jun 2023 09:50:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89C8B10E02F;
	Tue, 27 Jun 2023 07:49:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [5.144.164.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 957CB10E02F
 for <freedreno@lists.freedesktop.org>; Tue, 27 Jun 2023 07:49:57 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 4ABD92013B;
 Tue, 27 Jun 2023 09:49:54 +0200 (CEST)
Date: Tue, 27 Jun 2023 09:49:52 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <3nnk4xvmpnum2q6g6c6crjlqq3ra7j2z5zis53xcqbvevymuhz@mkffvs45n6ut>
References: <55b0ca89-8f2e-5383-59d4-6809e813abf8@linaro.org>
 <vnp263d43flny2ibt3n7fbloyi26enqrejnobogplfu5fcj6l3@s7zkxrsi2rde>
 <52c57cab-10cf-2e7e-2c1d-fa6506786d45@linaro.org>
 <jmtjuya4c423rmdlo4ubvvqndbxvgapal5otjqnejdpdd25izp@kewbjmqdu2xs>
 <6311f26f-79ee-c471-649f-5e0b4629cfcc@linaro.org>
 <uuy5prkjhhs66te7h6z3pu4lzj2cfbiqk6ftjijwoeqpw573av@ogs6cboanvzc>
 <ziykmixskqkgheigefvyo4q3katbc4uix6jtcg7mncs25z4tj5@5gykrfgns4bm>
 <16731023-7dc7-d43d-1b16-fda44c0948ed@linaro.org>
 <yofju7jp7vmv33x7dzvzoelpumfsz3fjqy2ozakfphsuysunon@pglt2wzlsjex>
 <683a6f7e-bf1a-aff2-070b-472fb14e0353@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <683a6f7e-bf1a-aff2-070b-472fb14e0353@linaro.org>
Subject: Re: [Freedreno] [PATCH 03/15] dt-bindings: clock: qcom,
 dispcc-sm6125: Require GCC PLL0 DIV clock
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
 dri-devel@lists.freedesktop.org, Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@gmail.com>, linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, Andy Gross <agross@kernel.org>,
 Lux Aliaga <they@mint.lgbt>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2023-06-27 09:29:53, Krzysztof Kozlowski wrote:
> On 27/06/2023 08:54, Marijn Suijten wrote:
> > On 2023-06-27 08:24:41, Krzysztof Kozlowski wrote:
> >> On 26/06/2023 20:53, Marijn Suijten wrote:
> >>> On 2023-06-26 20:51:38, Marijn Suijten wrote:
> >>> <snip>
> >>>>> Not really, binding also defines the list of clocks - their order and
> >>>>> specific entries. This changes.
> >>>>
> >>>> And so it does in "dt-bindings: clock: qcom,dispcc-sm6125: Remove unused
> >>>> GCC_DISP_AHB_CLK"?
> >>>
> >>> Never mind: it is the last item so the order of the other items doesn't
> >>> change.  The total number of items decreases though, which sounds like
> >>> an ABI-break too?
> >>
> >> How does it break? Old DTS works exactly the same, doesn't it?
> > 
> > So deleting a new item at the end does not matter.  But what if I respin
> > this patch to add the new clock _at the end_, which will then be at the
> > same index as the previous GCC_DISP_AHB_CLK?
> 
> I think you know the answer, right? What do you want to prove? That two
> independent changes can have together negative effect? We know this.

The question is whether this is allowed?

- Marijn
