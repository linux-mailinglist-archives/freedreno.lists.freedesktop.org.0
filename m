Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F36917CDE2
	for <lists+freedreno@lfdr.de>; Sat,  7 Mar 2020 12:41:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEE966E19A;
	Sat,  7 Mar 2020 11:40:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1959D6E19A;
 Sat,  7 Mar 2020 11:40:58 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id CFB902002D;
 Sat,  7 Mar 2020 12:40:55 +0100 (CET)
Date: Sat, 7 Mar 2020 12:40:54 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Krishna Manikandan <mkrishn@codeaurora.org>
Message-ID: <20200307114054.GA564@ravnborg.org>
References: <1583494560-25336-1-git-send-email-mkrishn@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1583494560-25336-1-git-send-email-mkrishn@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=LpQP-O61AAAA:8
 a=gEfo2CItAAAA:8 a=nY4iuGU7CXqHoBgY49wA:9 a=UqWAcN0MMYTXwVMZ:21
 a=A81lDmqo7XWCXIhH:21 a=CjuIK1q_8ugA:10 a=pioyyrs4ZptJ924tMmac:22
 a=sptkURWiP4Gy88Gu7hUp:22
Subject: Re: [Freedreno] [v1] dt-bindings: msm: disp: add yaml schemas for
 DPU and DSI bindings
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 seanpaul@chromium.org, kalyan_t@codeaurora.org, hoegsberg@chromium.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi Krishna.

Thanks for these bindings files.

On Fri, Mar 06, 2020 at 05:06:00PM +0530, Krishna Manikandan wrote:
> MSM Mobile Display Subsytem(MDSS) encapsulates sub-blocks
> like DPU display controller, DSI etc. Add YAML schema
> for the device tree bindings for the same.
> 
> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
> ---
>  .../bindings/display/msm/dpu-sc7180.yaml           | 269 +++++++++++++++
>  .../bindings/display/msm/dpu-sdm845.yaml           | 265 +++++++++++++++
>  .../bindings/display/msm/dsi-sc7180.yaml           | 369 +++++++++++++++++++++
>  .../bindings/display/msm/dsi-sdm845.yaml           | 369 +++++++++++++++++++++
>  4 files changed, 1272 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-sc7180.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-sdm845.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
> new file mode 100644
> index 0000000..3d1d9b8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
> @@ -0,0 +1,269 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Description of Qualcomm Display Dpu dt properties.

Try to be cossistent in capitilization of Dpu versus DPU

> +
> +maintainers:
> + - Krishna Manikandan <mkrishn@codeaurora.org>
> +
> +description: |
> + Device tree bindings for MSM Mobile Display Subsytem(MDSS) that encapsulates
> + sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
> + bindings of MDSS and DPU are mentioned for SC7180 target.

Bindings should use an indent of two spaces.
This is what is used in the example schema and the de-facto standard.
One space indent makes it very hard to follow the indent.

For examples the indent varies. From 2 spaces to 8 spaces.
I often use 4 spaces as 2 spaces is not enough when it spans several
lines. But there is nothing fixed there.

> +
> +properties:
> + "mdss":
> +  type: object
> +  description: |
> +   Node containing MDSS that encapsulated sub-blocks like DPU, DSI and DP
> +   interfaces.
> +
> +  properties:
> +   compatible:
> +    items:
> +     - const: qcom,sc7180-mdss
> +   reg:
> +    description: |
> +     Physical base address and length of controller's registers.
Add empty line between properties (empty line before reg:).

> +
> +   reg-names:
> +    description: |
> +     Names for different register regions defined above. The required region
> +     is mentioned below.
> +    items:
> +     - const: mdss
> +
> +   power-domains:
> +    description: |
> +     A power domain consumer specifier according to
> +     Documentation/devicetree/bindings/power/power_domain.txt.
Should this be power-domain.yaml?


> +
> +   clocks:
> +    description: |
> +     List of clock specifiers for clocks needed by the device.
Do not use "|" unless required. Fine to have text on same line as
description: .


	Sam
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
