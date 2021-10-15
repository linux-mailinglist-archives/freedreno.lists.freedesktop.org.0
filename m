Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F404842FC68
	for <lists+freedreno@lfdr.de>; Fri, 15 Oct 2021 21:46:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91BA56EDE4;
	Fri, 15 Oct 2021 19:46:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0BB96EDE4;
 Fri, 15 Oct 2021 19:46:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7C3BC61151;
 Fri, 15 Oct 2021 19:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634327172;
 bh=y5NvtyQVgG6QCNLgc1vxaPVFW+j4a+/4JE5OpWKI4L4=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=rEnWvsAa26MFiEuPkWhAGCZ+XJ5zDOPTBRoRPLfKH6BDIBeKG5KrAvAl83uTqFID5
 JVv24VckJUvNs20wZA8jpu0GvPTcbfLDEtakxQcsIqDiMo+z7h7BearaYeyGWonagp
 wgwJJM4fVOlnHLht4omwTgZiyOK0AqD1yi1r5fpJEs3dfZ4P6sF43i2Ye3X8Rc/xDl
 1Q+RZokciCYECIi+Wo5qoVSl+HVNG2vSsoMjNu0QT3NGRUxKt8H0YJSiecMMmkG/Kg
 N3WEHry8VEXRrVKxbt13vWwfTOVKkTGtmZJsrkqLF863Dgo7/W7pDn+rnBnoSXLLFu
 kbrHwgTPweV6Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211015001100.4193241-1-dmitry.baryshkov@linaro.org>
References: <20211015001100.4193241-1-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <sboyd@kernel.org>
Cc: Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
To: Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Date: Fri, 15 Oct 2021 12:46:11 -0700
Message-ID: <163432717127.1688384.833170430556788483@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Subject: Re: [Freedreno] [PATCH 1/2] drm/msm/hdmi: use bulk regulator API
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

Quoting Dmitry Baryshkov (2021-10-14 17:10:59)
> Switch to using bulk regulator API instead of hand coding loops.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
