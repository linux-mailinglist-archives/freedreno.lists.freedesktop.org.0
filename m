Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3341280343E
	for <lists+freedreno@lfdr.de>; Mon,  4 Dec 2023 14:16:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC00810E1B0;
	Mon,  4 Dec 2023 13:16:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8880210E1C8
 for <freedreno@lists.freedesktop.org>; Mon,  4 Dec 2023 13:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1701695798; x=1701954998;
 bh=U0MZUFxkg3+UOPqNFrbWaEyCbKpVVLhO0H5Klvvg8Vk=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=oZ6O91idQA5+WxKNWJLeQSd8czUGS0X8g5gJ749ccwcGiXGpK09eQlmNWuaRM1hSE
 UOsHAXhsj2miXySJheA82U+pEPy95tc6sxzgSvg272KT1oAjPGi2wbuwhp0YNh2CC6
 2OGHIfiYTIRPCljGArK883GLI4GXsMdOSUp6MCkY7qa+KfNNBPjCUa79AOZ+bFpdXc
 ZfU91acURJ3cFCmvbhAXdVkSZt7pAvYlGe0QgqIB9DS0W9fDYx2+yiIFdLrx7fZNlZ
 /LjljgXr2StjuMq4C4ySI9gtGg6w+iEWO5I4nODnsEACIgy6ekeWJ4KytWFi8Bople
 7dpTIpAwet6yQ==
Date: Mon, 04 Dec 2023 13:16:24 +0000
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
From: Simon Ser <contact@emersion.fr>
Message-ID: <z05UmOrR9bE64r5nmj_Qk0MjSr94rHvCsssXxl9VLa3jUunEwBWjCN_Mdm7WYT1dsB5UuK47BbuVvguGpWEF2CXo9oPRkt-gqQB4-8Y7zGw=@emersion.fr>
In-Reply-To: <20231204131455.19023-1-dmitry.baryshkov@linaro.org>
References: <20231204131455.19023-1-dmitry.baryshkov@linaro.org>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Freedreno] [PATCH 0/7] drm: revert solid fill support
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
Cc: freedreno@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Maxime Ripard <mripard@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Acked-by: Simon Ser <contact@emersion.fr>
