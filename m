Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kB2DAd7DeGmltAEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Tue, 27 Jan 2026 14:55:42 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF1695309
	for <lists+freedreno@lfdr.de>; Tue, 27 Jan 2026 14:55:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ACDF10E577;
	Tue, 27 Jan 2026 13:55:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nidPd3j1";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FBC010E578
 for <freedreno@lists.freedesktop.org>; Tue, 27 Jan 2026 13:55:39 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id
 ffacd0b85a97d-43591b55727so5455027f8f.3
 for <freedreno@lists.freedesktop.org>; Tue, 27 Jan 2026 05:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769522138; x=1770126938; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=/kgLI7MhizMgsKZU+Aw847BhJRGZNY1cPGvaWvEvDlk=;
 b=nidPd3j1RZBGpcUeU7zu6AfodyFtyiKHqoLblePh0mjuLuSpt7IxcOHVNBKfu8CcvU
 GbMal9awOCsdks7rS3+B2JLKE6wb03wCmDmr2jjVvncPkQmtsXEzMG6X30iIi9J99WHx
 e8T4Z3EZWiunSyHloGGnyPYy6vxPBRUL67kENyVorx/YEH2asUUgJC0WAuwsbXVdo/cS
 BFzz5bqLe1MDjSs9UiQDG3ySMl72lIYxV7uzXZ8x29hWdjMcP8QKi1oNhBd561V/dz0i
 K2zAWZUzmtHQbHwhM3b5FBscil2gbCm2A7bqSd0+6kMGEN0M5Z/wIaeAHc8cINJmEZRU
 rhlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769522138; x=1770126938;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/kgLI7MhizMgsKZU+Aw847BhJRGZNY1cPGvaWvEvDlk=;
 b=bUW/v2wW149oB8BQBuQcf+fsuKnrgeonN9U/+/5XJq0FbVusCfj6tUh467RmeB0vBg
 3AwBm8IerD/kymuLhXforfghcEoJv9E0QK2GXQmTCYSMqJoRGs+0vxZC0I8XuAEvHj8Z
 QsWRIMuplmh1llYIYjgU6csf5JJ8+Xx0Ul6+ZCp7fyKycYnUHahyOaYFdiHV/H2QfzVc
 uTsh1vWocQGAEBtpR5jpvh6ZKlIvDr2ISSOoKHLuezNb8cq4T+vQgRAeFOJ7elUvrLI/
 Yrr1pZQvtsWQCarJlFnADcicoaYPZkFDfCafNDvgTIUHYSpfmpXgnYFWIiJB6XaY7wFk
 aaEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOdLq4Nf5OJ8SYRVR0lPOdwzoNKGDfGVdU/L553n7xhZ5tawmj57dP5FxIxXrFVLzQS0lQLmnVHKg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw0qPPuejOdwQVk1gQQNa/0Q+Uh4TzLTpOIVob+fo1xHgjXZT/q
 2a9l8RQBsg5Bqy41LsOdeNv4RkTfJiK5NN96VTho9nKf5/j72gedt3uBhri8w3veT20=
X-Gm-Gg: AZuq6aKIzHlffPST627PW3Hj3Mpkfy9dBH9xKHGsvfQWUxElznky4jAnagByhEIwSE3
 ZY8wd/2UM7qRp8hV5v87uHvHDKIDvOGwdb+O2ET9NpczIlsgClhXpHzNTVQ21E6DfC2GrnwHrc3
 zbsT6Xz6RyldGo2ntY7+NPxRGreH/1NS/KlvywFO1FPn9DGt2FmL3rgjQlGDpnySW6kaj24NJ4W
 5rrazwDKhfDD9T1Z7x9RovIowzWjCOtKseoaO+D+veGXhy4j8HumoFJLY8DNYSv8IvAJBA5jY19
 48tpkSqdb4nbo/mUfP1x66LkPWljy0aXemO0CWlMGIP0Pz7y7C3apm1WAtSMugHxL9Q739PoNIZ
 BnSimzqIAjnG0MCOEvM4ZDifdlLEfLBqfOz/QWYNTg8jWUT5QARDRnQmUTuluLj92JlsdK7KhhU
 /BgGmItJGiSxrb+lyMkXpr1ReBdLKleieVQ0caO25oMl4A6qWqjNEcKnTaxxLdEZBkpIcCA/KN3
 w==
X-Received: by 2002:a05:6000:2dc9:b0:432:5b81:480 with SMTP id
 ffacd0b85a97d-435dd06a466mr2267894f8f.24.1769522137688; 
 Tue, 27 Jan 2026 05:55:37 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:53a6:bd3c:8e65:509d?
 ([2a01:e0a:3d9:2080:53a6:bd3c:8e65:509d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435b1e717cbsm38798477f8f.24.2026.01.27.05.55.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jan 2026 05:55:37 -0800 (PST)
Message-ID: <6e8c3d6b-8cba-42da-bafa-28becfa15d60@linaro.org>
Date: Tue, 27 Jan 2026 14:55:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 1/7] dt-bindings: usb: document the Renesas
 UPD720201/UPD720202 USB 3.0 xHCI Host Controller
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-pci@vger.kernel.org
References: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-0-c55ec1b5d8bf@linaro.org>
 <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-1-c55ec1b5d8bf@linaro.org>
 <CAMuHMdU9HcK3xX=itqe2di1HS1SJvV6=ySqKyrtj7Yr1yXyuqQ@mail.gmail.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <CAMuHMdU9HcK3xX=itqe2di1HS1SJvV6=ySqKyrtj7Yr1yXyuqQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:gregkh@linuxfoundation.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:brgl@kernel.org,m:mani@kernel.org,m:bhelgaas@google.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-usb@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-pci@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,freedreno-bounces@lists.freedesktop.org];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linuxfoundation.org,glider.be,google.com,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:replyto,linaro.org:mid,0.0.0.0:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,devicetree.org:url,linux-m68k.org:email];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,freedreno-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[freedreno,dt,renesas];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 6FF1695309
X-Rspamd-Action: no action

Hi,

On 1/27/26 11:20, Geert Uytterhoeven wrote:
> Hi Neil,
> 
> On Tue, 27 Jan 2026 at 10:57, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>> Document the Renesas UPD720201/UPD720202 USB 3.0 xHCI Host Controller,
>> which connects over PCIe and requires specific power supplies to
> 
> Here: "requires"...

Sorry I don't understand

> 
>> start up.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   .../bindings/usb/renesas,upd720201-pci.yaml        | 55 ++++++++++++++++++++++
>>   1 file changed, 55 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/renesas,upd720201-pci.yaml b/Documentation/devicetree/bindings/usb/renesas,upd720201-pci.yaml
>> new file mode 100644
>> index 000000000000..df3cdcf44747
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/usb/renesas,upd720201-pci.yaml
>> @@ -0,0 +1,55 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/usb/renesas,upd720201-pci.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: UPD720201/UPD720202 USB 3.0 xHCI Host Controller (PCIe)
>> +
>> +maintainers:
>> +  - Neil Armstrong <neil.armstrong@linaro.org>
>> +
>> +description:
>> +  UPD720201 USB 3.0 xHCI Host Controller via PCIe x1 Gen2 interface.
>> +  The UPD720202 up to two downstream ports, while UPD720201 supports up to
>> +  four downstream USB 3.0 rev1.0 ports.
>> +
>> +properties:
>> +  compatible:
>> +    const: pci1912,0014
> 
> Just wondering: how does having a new driver
> drivers/pci/pwrctrl/pci-pwrctrl-upd720201.c matching against this
> compatible play well with normal PCI discovery and probing of
> drivers/usb/host/xhci-pci-renesas.c?

In Linux, power control is implemented as a platform device driver,
so it doesn't collide with the pci driver.

The pci driver won't probe until the device shows up on the bus anyway,
so he power control will attach as platform for this purpose.

> 
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  avdd33-supply:
>> +    description: +3.3 V power supply for analog circuit
>> +
>> +  vdd10-supply:
>> +    description: +1.05 V power supply
>> +
>> +  vdd33-supply:
>> +    description: +3.3 V power supply
>> +
>> +required:
>> +  - compatible
>> +  - reg
> 
> ... but no power supplies are listed here? ...

None are stricly required, they can be supplied directly without
a passive regulator. Not sure they should be required

> 
>> +
>> +allOf:
>> +  - $ref: usb-xhci.yaml
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    pcie@0 {
>> +        reg = <0x0 0x1000>;
>> +        ranges = <0x02000000 0x0 0x100000 0x10000000 0x0 0x0>;
>> +        #address-cells = <3>;
>> +        #size-cells = <2>;
>> +        device_type = "pci";
>> +
>> +        usb@0 {
> 
> The actual DTS uses "usb-controller".
> 
>> +            compatible = "pci1912,0014";
>> +            reg = <0x0 0x0 0x0 0x0 0x0>;
> 
> ... also not in the example?
> 
>> +        };
>> +    };
>>
>> --
>> 2.34.1
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds

Thanks,
Neil
