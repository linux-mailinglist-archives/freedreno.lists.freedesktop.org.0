Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B16C86C4B74
	for <lists+freedreno@lfdr.de>; Wed, 22 Mar 2023 14:15:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E9C410E380;
	Wed, 22 Mar 2023 13:15:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from devico.uberspace.de (devico.uberspace.de [185.26.156.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAB5E10E380
 for <freedreno@lists.freedesktop.org>; Wed, 22 Mar 2023 13:15:07 +0000 (UTC)
Received: (qmail 5468 invoked by uid 990); 22 Mar 2023 13:15:05 -0000
Authentication-Results: devico.uberspace.de;
	auth=pass (plain)
MIME-Version: 1.0
Date: Wed, 22 Mar 2023 13:15:04 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Leonard Lausen" <leonard@lausen.nl>
Message-ID: <6e41758333fd0084a93fcae93df1589e8d60d139@lausen.nl>
TLS-Required: No
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
In-Reply-To: <6f33219dc848ccd7122bce6933338033aa18c33c@lausen.nl>
References: <6f33219dc848ccd7122bce6933338033aa18c33c@lausen.nl>
X-Rspamd-Bar: -
X-Rspamd-Report: BAYES_HAM(-1.395246) MIME_GOOD(-0.1)
X-Rspamd-Score: -1.495246
Received: from unknown (HELO unkown) (::1)
 by devico.uberspace.de (Haraka/3.0.1) with ESMTPSA;
 Wed, 22 Mar 2023 14:15:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lausen.nl; s=uberspace;
 h=from; bh=AEQY0DcdG8KWL7TDzHCMKPYORxGJzOAPBuX1xZq+Ejw=;
 b=QOiW0KrQviA8D6sBjmdu2zJV4pi3hCA72EThHI3mU3FpDIxfmr/VT9F3SyUhLNHVP29TcCtRyg
 RXpR7odyqfemS8gOCQXgP1jcb0mIVmFU+x6qpSSbs7UWmwjjqwBCt5UeH47lyMS3rR0hK+xr9Cp4
 daGCmtMESlirb43eiI9km/hEoHs4oGM6DOkZFDNTUlThtiW6GCzGO7gwiA15sOYWSkKCciTEsfXJ
 8xpLZvfB+v1BuBGTtmxP/9QgZpphfiAz2ntvxiQsNCFjHwwCaux71m89P+oHl5Cal8PP/le7Th6e
 qrnyFaR6op+oWRiKL+YSgy6LgmD37d9ogRYn6Fe2xXUq94l6Xp9qrd3yP0y+LanY16N15UT25EgS
 CmH9/9acvrt8Yc9uCgbr2L72pWpWGCKS1MBZcQC9bhALmMeueil0dmSruvk8Vn3S4M5SjJj4VDwj
 /nMi8yHBFKXipPqheWfHGR5Y8xCFbyCw3rIxcEaVy/+bhhNS8sBcqxdei8RJsy99HrvVA/wJJAmj
 t7igw8S3V1bZNRHy9s5cjYLGQMFZPf/DDMySrjQk+wTv8RH8n8ZAHp/z9IxTIHPi342BrobSAYYJ
 8C0fo3g+zw+kh41eucwb+QcFoVNVvNMJoP6Vez84k1/PauIDgcUbIEeU0GRnjpVkG3HZOJrxfSnl
 Q=
Subject: Re: [Freedreno] [PATCH v2] drm/msm/dpu: Add support for AR30 format
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

V2 adds missing AR30 swizzles in dpu_format_map_ubwc to avoid the followi=
ng errors:

[drm:dpu_get_dpu_format_ext:1044] [dpu error]unsupported fmt: AR30 modifi=
er 0x500000000000001
msm_dpu ae01000.display-controller: [drm:msm_framebuffer_init] *ERROR* un=
supported pixel format: AR30
