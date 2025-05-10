Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7989AB2418
	for <lists+freedreno@lfdr.de>; Sat, 10 May 2025 16:00:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 915F510E253;
	Sat, 10 May 2025 14:00:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0940610E010;
 Sat, 10 May 2025 12:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oldschoolsolutions.biz; s=s1-ionos; t=1746879138; x=1747483938;
 i=jens.glathe@oldschoolsolutions.biz;
 bh=bSuxazXqfTP5iuFomTlnu0dGI378IJ8AaIuRLhfJe8Q=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:From:Subject:To:
 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=MzgQTMJmJdkFH00SKVzesJx6/clB7s7AN4pLJeBSmL/8WxVIeDYFjkR2+4lo0/ZE
 Xk42eV878EVYOEJaa4lWie7WatK9lgZXvCXfmbYMl0hYsM60ArZscOKOl62l3aqyu
 U7hzaKVwTRzv5/KWqKd/lGztMH7XMJRCZQdZ2JaG0m0SB1GdFEDsnKlmDj0UlrSEM
 OrV2xlAhALW/xy0ZtU5FhnLHOZ/9YdSnPQOesLgKzSxxk6G6Oqj/ct/v9t4PXnCRM
 Kgd03x/YLAKRwBknGqzJAyMwxPYde2gK5ujWPDQKL3MoyrT+uoGoQnaPrmvPQwwre
 6PENcjgULFbLULjr8A==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.0.174] ([62.226.32.213]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MFbeC-1uEL1Q1R7e-00D8h7; Sat, 10 May 2025 14:12:18 +0200
Message-ID: <aeb8c8d5-9ce5-410d-8021-df30081697af@oldschoolsolutions.biz>
Date: Sat, 10 May 2025 14:12:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Subject: Re: [PATCH 00/45] drm/msm/dp: Add MST support for MSM chipsets
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Stephen Boyd <swboyd@chromium.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>,
 Guenter Roeck <groeck@chromium.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Vara Reddy <quic_varar@quicinc.com>, Rob Clark <robdclark@chromium.org>,
 Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Yongxing Mou <quic_yongmou@quicinc.com>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:GPqBAj8RWg+DoYyx8R1t6lIg4jvgYMTPH65CKeMaHkASHF0q/Da
 P4D1Yq8g10a4k39exwebeDK8fOwEJCKs/0TprlBbQ1kYuO3MnCr1DmalXK94nN5i7Nk43CP
 UR9gzuCZB7v5cF8dJ5+1ytQ0WsypvgUy2koy49Zfn4SgUruamViG603FablrI36oQl4sZ8n
 /0sqtGAasEj5JlTq6NHNg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:VQ+43owoB/g=;mRNw1K7JuvcW0TwZvDEm7vK1TW7
 6czjMLG4epiCnvlVPSGmyxL1qqzkB37YEhfjV91e0ZiYOf+avLBiFKjfey0XXQ+A0a/xB1LXF
 h1YFcNMjP3isIwcDdogBhsQCl2gKWkd3rWYqEIeWd82WTcMJ8VfwqfwpMiXdzJ9mPaQ4KUBhf
 Eg3WIWMyxrKWSvcNG2lsT+hJoWGEk2ZcDF2FXfxVbaw02+zoAc3ndLp7y9XdytE9FV1hcPk54
 QqcqmkmCayAShjmFZrqGacfkCEVtU9GFXcN02CIj9uWdMvb2BCp2ZzIX/27gPi6cYcPn+a38Z
 3qI2kT9jcenOcIhqTC7czAoMzYVd41xH7FoR4LiSdTnVaedqFj/fVB+dFrXqTAR+c2EqutAhB
 YG6/4arcsvFMtbc6V77xcQCcOkOd8kgq69uNPt7v2u/5SPl10GBcPjxFrom8DPvjYw75aSy6i
 hzT97KL/XolQFLgRTkojqoCnFPfTAs9GdudgUXXJoRjRf+p3Ijt/PF4lFaLWdxJd+tqms5jQM
 Mdv+Sw3tvP/bbQtCjPxkO0TZuUG1rs70917XpCRelRJh7PjhM7bJyVeW5xUCdb7bR07mLN/6c
 JHpKFhfdru9zXMLE5/+uCgXoW7XocArIetL+IagOHdjgB6T1i9FVUtR5kXw8bv3yLRK9glnJZ
 VNduvjA04gTkd8ZxF2eN1cdyL21AW725Yg4UyDkrhzQ33cgugtptM7saO11zGwDyjadxs3ASq
 tfXN1S0Hj1+3oIii3266uxOMimuTY0vGiBnZo8g3tI/wIraOyXt0cr8go8tgWOn33byGjxJ3J
 J0twunaljKCzpxIgH00gNV6w5V8oEatLCB8xvsRJvQL8mcEgFr+qgBEYhaIFKN0Hzq6PuaA6m
 eV8DNEYbNi2AEXjRK8PGWKdyvE4wtO2Ujr4t3/in5gAA7CU9NfWZ5aq476BiA0OQUFD5sfCgG
 72SOxdhsHn+euZcrRHXOmPHs4JagtNd55X8vj7eUUXPoVXKZUcGYrtVRd+QL9fDEDnfv3bUIT
 Y//CH0j/UTGyok5n70pt6A7wzYnlNsAUkYI02YaNT+SMiKr+4WnGj6v6MIrp/AdEYF4Da1Mym
 GsGB3Gkbv4fe2yLMXmZGR05AICJWlhri4JP4AUaKhDHWJq+X8DD/x3NqmX3tqDUuXXFYXPsI1
 huEod3ATUE677aYeY+3UyM3fT6UdkIqEHOMUQZs6M+m+92Cd+VimHd3r5VR8CcWxBCtErAYFF
 fcUEPkMqrwR0jjmMK2u9qX9TJ0bANdVC3HPbUyQbNNMVdtnTbqbQDHuhvKnkhCdhUYjNfWajz
 6mqZPm9PwuC4BwhjOXhM19D5VILMwpvbXtk0hWJngLCupArUCsMwrSNKdvz57mIZpCsWYETin
 ECovF04p6QiaW3Kun4m2hj/Qrzx/+LYXi/X/AUjlzWIxtfv7zT/8GRIAPv
X-Mailman-Approved-At: Sat, 10 May 2025 14:00:19 +0000
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

On 06.12.24 05:31, Abhinav Kumar wrote:
> base-commit: b166256c1e6ce356fa1404d4c8531830e6f100a8

Hi Abhinav,

I would like to test / play around with this patchset, unfortunately=20
this base commit is not easy to find. Trying to apply without gives lots=
=20
of conflicts. Can you please rebase?

with best regards

Jens

