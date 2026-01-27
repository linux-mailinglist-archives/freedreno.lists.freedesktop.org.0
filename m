Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LeGOHupeGl9rwEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Tue, 27 Jan 2026 13:03:07 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3322793F92
	for <lists+freedreno@lfdr.de>; Tue, 27 Jan 2026 13:03:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CB2310E55C;
	Tue, 27 Jan 2026 12:03:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com
 [209.85.219.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55B9110E565
 for <freedreno@lists.freedesktop.org>; Tue, 27 Jan 2026 12:03:04 +0000 (UTC)
Received: by mail-qv1-f68.google.com with SMTP id
 6a1803df08f44-894676e6863so62443906d6.2
 for <freedreno@lists.freedesktop.org>; Tue, 27 Jan 2026 04:03:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769515383; x=1770120183;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h95kKSGuxlIi6DsiBy3i3OTVnWNnI1FQj5Fv8XU8C14=;
 b=KZsEM/DNYEeBUGVNpt4BUKpVdpuDMWsoCrNkOhrXReb9kTLzTsDZrG5dw5TMcb8Uoz
 YIem0vUM8dDgEW3BDE3jib8KFZzivz6rJMykEkrEyAcag3rX1n6JXKkbojqrZsf2RrOi
 VH3VVlJODyeUy1iWEpGLPJFDIGDQyoH8gF2mgZhpMMbC3UmwC6rr4AD0y3xuM5AIhm85
 WUnxjgm+tC6/MzhCvA5jERqwas5GMES0BRrA0UP2tmHgxFleI3LnTUQ/U+Vf/kAeZVmX
 XBhVAPMmuUicUhHOIpv/bZDSgT/d789jTnf2xrE+/frXDsIeCgQROF8/E41CwudJDKSG
 GxpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYibhSXquVUZPJ47a18XIHCcST6bNoNnukfGzDEE6OtarcbfJB5MY22sf9dl8z6j2Kal55PWFWYC4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1QKN9U74/09XTWGFQ8vNRxsFY+MjxlIDhX5zqjDgQpt/87i7t
 RcZoHglfP9YBkUVbJ9f5L6ZlQzU0oybtMK8YtIiM7+sYYkMhq5x1LVOyQ8CqwqH7aNU=
X-Gm-Gg: AZuq6aIhSEIKIY9j3h3WEDU+aXknwLcB8eX5svSNAAdBmgRlFoohAAg77rpE5Jq3VIQ
 OwGC7chbIbPvnB7z3/futJtHhL2NZzeacr2sMS7lKNNKWn5vamY1kwQpI5PW9vMshFeKGt9QbEV
 rJ25ex5vtHupv5KgbZJ3L13CMaAx98fOySydEPB0jTweZiOz9B7PFitFemrbMVPnkFfNu/pT/z/
 SoRBv4xU4/ifv3k/jMjlo9kPzarqTo2yxRW9tdjnLBwhwXWfhIsG9arfVDOqSx0i41noHOmKVf6
 0SYiYuAQrjuC/8Bi96cHLpbHHFi9RF0sRNlc6euulnxm4Yeq9uvf2GjT9zfGkAFwAPw74PqbhjH
 qA5/jhQ9l4QNHtfLQZ54MR9o6DR+lUhKiDhbDEjTESFGLQFxCxp8wipomNJmfS9Ub+PpUR90FhG
 5l6ckeoGdTV4tkDKKSfDUR+sjyPR6LLSWsbzKCEQRwSUd5S9ka
X-Received: by 2002:a05:6102:4429:b0:5ef:a1ec:fbb0 with SMTP id
 ada2fe7eead31-5f7237ab385mr660550137.30.1769509271153; 
 Tue, 27 Jan 2026 02:21:11 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com.
 [209.85.222.41]) by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-9483864e44fsm2151824241.0.2026.01.27.02.21.10
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jan 2026 02:21:10 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id
 a1e0cc1a2514c-93f69720a7cso2908491241.1
 for <freedreno@lists.freedesktop.org>; Tue, 27 Jan 2026 02:21:10 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXMk4OuU+oxdVcVBvQta9dNul5nBAAFkQau3U1Ysw4tIncYDS0LsaR8aw2cVPNs8YOYIWg/d+QplfE=@lists.freedesktop.org
X-Received: by 2002:a05:6102:32c4:b0:5db:ca9e:b57d with SMTP id
 ada2fe7eead31-5f72368a7cbmr661077137.19.1769509270640; Tue, 27 Jan 2026
 02:21:10 -0800 (PST)
MIME-Version: 1.0
References: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-0-c55ec1b5d8bf@linaro.org>
 <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-1-c55ec1b5d8bf@linaro.org>
In-Reply-To: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-1-c55ec1b5d8bf@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Jan 2026 11:20:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU9HcK3xX=itqe2di1HS1SJvV6=ySqKyrtj7Yr1yXyuqQ@mail.gmail.com>
X-Gm-Features: AZwV_QgWv7FB_90Ca_fAZmW1VQjnUFaVdHL_S5QmJWKKvUrnnNh7whB0F4bfOtQ
Message-ID: <CAMuHMdU9HcK3xX=itqe2di1HS1SJvV6=ySqKyrtj7Yr1yXyuqQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] dt-bindings: usb: document the Renesas
 UPD720201/UPD720202 USB 3.0 xHCI Host Controller
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-usb@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:gregkh@linuxfoundation.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:brgl@kernel.org,m:mani@kernel.org,m:bhelgaas@google.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-usb@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-pci@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,freedreno-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linuxfoundation.org,glider.be,google.com,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[freedreno,dt,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: 3322793F92
X-Rspamd-Action: no action

Hi Neil,

On Tue, 27 Jan 2026 at 10:57, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> Document the Renesas UPD720201/UPD720202 USB 3.0 xHCI Host Controller,
> which connects over PCIe and requires specific power supplies to

Here: "requires"...

> start up.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../bindings/usb/renesas,upd720201-pci.yaml        | 55 ++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/usb/renesas,upd720201-pci.yaml b/Documentation/devicetree/bindings/usb/renesas,upd720201-pci.yaml
> new file mode 100644
> index 000000000000..df3cdcf44747
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/renesas,upd720201-pci.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/renesas,upd720201-pci.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: UPD720201/UPD720202 USB 3.0 xHCI Host Controller (PCIe)
> +
> +maintainers:
> +  - Neil Armstrong <neil.armstrong@linaro.org>
> +
> +description:
> +  UPD720201 USB 3.0 xHCI Host Controller via PCIe x1 Gen2 interface.
> +  The UPD720202 up to two downstream ports, while UPD720201 supports up to
> +  four downstream USB 3.0 rev1.0 ports.
> +
> +properties:
> +  compatible:
> +    const: pci1912,0014

Just wondering: how does having a new driver
drivers/pci/pwrctrl/pci-pwrctrl-upd720201.c matching against this
compatible play well with normal PCI discovery and probing of
drivers/usb/host/xhci-pci-renesas.c?

> +
> +  reg:
> +    maxItems: 1
> +
> +  avdd33-supply:
> +    description: +3.3 V power supply for analog circuit
> +
> +  vdd10-supply:
> +    description: +1.05 V power supply
> +
> +  vdd33-supply:
> +    description: +3.3 V power supply
> +
> +required:
> +  - compatible
> +  - reg

... but no power supplies are listed here? ...

> +
> +allOf:
> +  - $ref: usb-xhci.yaml
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pcie@0 {
> +        reg = <0x0 0x1000>;
> +        ranges = <0x02000000 0x0 0x100000 0x10000000 0x0 0x0>;
> +        #address-cells = <3>;
> +        #size-cells = <2>;
> +        device_type = "pci";
> +
> +        usb@0 {

The actual DTS uses "usb-controller".

> +            compatible = "pci1912,0014";
> +            reg = <0x0 0x0 0x0 0x0 0x0>;

... also not in the example?

> +        };
> +    };
>
> --
> 2.34.1

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
