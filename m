Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 172F876315C
	for <lists+freedreno@lfdr.de>; Wed, 26 Jul 2023 11:12:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC10B10E43D;
	Wed, 26 Jul 2023 09:12:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [5.144.164.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37A2C10E43D
 for <freedreno@lists.freedesktop.org>; Wed, 26 Jul 2023 09:12:32 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 2B6DF3F094;
 Wed, 26 Jul 2023 11:12:29 +0200 (CEST)
Date: Wed, 26 Jul 2023 11:12:27 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <7yjwlgxtavrlk4vnzhlclri6znofmwill6ubne5qrlmb2hf7sj@m3sc6zdde6rk>
References: <20230725101610.75122-1-krzysztof.kozlowski@linaro.org>
 <5w2hvzmwzqm4ffopzewveaviebq2ig7awimeo6ipcehx5a43ae@mlwffkf2ctn5>
 <11eca956-9e91-f645-9cc7-4c9f534d9821@linaro.org>
 <5576059f-ba53-1096-396e-ccfb5f9d86f1@linaro.org>
 <6cdef93d-85af-f12c-0782-da31728809df@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6cdef93d-85af-f12c-0782-da31728809df@linaro.org>
Subject: Re: [Freedreno] [PATCH] dt-bindings: display: msm: sm6125-mdss:
 drop unneeded status from examples
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
Cc: freedreno@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, David Airlie <airlied@gmail.com>,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2023-07-26 10:42:24, Dmitry Baryshkov wrote:
> On 26/07/2023 10:31, Krzysztof Kozlowski wrote:
> > On 26/07/2023 09:27, Krzysztof Kozlowski wrote:
> >> On 25/07/2023 13:46, Marijn Suijten wrote:
> >>> On 2023-07-25 12:16:10, Krzysztof Kozlowski wrote:
> >>>> Example DTS should not have 'status' property.
> >>>>
> >>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>>> ---
> >>>>   .../devicetree/bindings/display/msm/qcom,sm6125-mdss.yaml   | 6 ------
> >>>
> >>> This is not needed: it has already been corrected in v3 and v4 of the
> >>> respective series (among other changes) and the patches were only picked
> >>> to a preliminary (draft) pull to get an overview of the outstanding work
> >>> for this subsystem.  That branch happens to be included in regular -next
> >>> releases though.
> >>>
> >>> 6.6 drm/msm display pull: https://gitlab.freedesktop.org/drm/msm/-/merge_requests/69
> >>> v3: https://lore.kernel.org/linux-arm-msm/20230718-sm6125-dpu-v3-0-6c5a56e99820@somainline.org/
> >>> v4: https://lore.kernel.org/linux-arm-msm/20230723-sm6125-dpu-v4-0-a3f287dd6c07@somainline.org/
> >>
> >> What do you mean? The old code (one I am fixing) is in current next...
> >>
> >> If this was fixed, why next gets some outdated branches of drm next?
> >> Each maintainers next tree is supposed to be fed into the next, without
> >> delays.
> >>
> > 
> > Ah, I think I understood - some work in progress was applied to
> > work-in-progress branch of drm/msm and this somehow got pushed to
> > linux-next? How anyone is supposed to work on next branches if they are
> > outdated or have stuff known to be incomplete?
> 
> The drm/msm & bindings parts were considered final, but then I failed to 
> send 'applied' series for some reason. And then it was natural for 
> Marijn to send an updated revision.

There were comments on some of the patches that would have an effect on
the binding parts (including the examples).

- Marijn
