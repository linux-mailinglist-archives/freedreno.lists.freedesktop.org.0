Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC3A802D8C
	for <lists+freedreno@lfdr.de>; Mon,  4 Dec 2023 09:50:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1114B10E2D4;
	Mon,  4 Dec 2023 08:50:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FA1010E2CE;
 Mon,  4 Dec 2023 08:49:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 53B27CE0E00;
 Mon,  4 Dec 2023 08:49:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FAC1C433C7;
 Mon,  4 Dec 2023 08:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701679794;
 bh=uG10quNAaJD23Flc15bDB89K/G4XtxgxZ8Ig/bMsvwg=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=Z9/YXd2FuWQfC8SXxbmvuad2BsQzC8grc2YLa+GPJ9JTXbwydLMq7kC3vFMhd70yo
 4O83uHoCRZoBgTGTXAZOQoDlC+xFt3t0RXEa1FA7Glgsa5AEGCBrmGws3Qjgkp9znB
 Mdz3alfvFgkPbN/LLj5W7cHkE4HPPzN0azApR3Hug5B3aGkZnrh7LssoEnSsfAmFoJ
 ZzJQrW632grwyeq03MA/ZGZ6MR3LtXSl/aOtSDGnAgRXcIcEFrDfE6W77KMvL7n2gC
 gsxFVmQFJoxEmHDM52t/rrrMG5YP/0qIR5+/SU7rV8gNKjwfYVF3WpATtGcO/Ye9Fo
 YcIv0PIw+JfjQ==
Message-ID: <335240cdb8b6b980c2380bdc25fb2833.mripard@kernel.org>
Date: Mon, 04 Dec 2023 08:49:52 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
In-Reply-To: <20231203000532.1290480-2-dmitry.baryshkov@linaro.org>
References: <20231203000532.1290480-2-dmitry.baryshkov@linaro.org>
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH RESEND 1/5] drm/atomic: add private obj
 state to state dump
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
Cc: freedreno@lists.freedesktop.org, Thomas
 Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Abhinav
 Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, Maxime
 Ripard <mripard@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, David
 Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sun, 3 Dec 2023 03:05:28 +0300, Dmitry Baryshkov wrote:
> The drm_atomic_print_new_state() already prints private object state via
> drm_atomic_private_obj_print_state(). Add private object state dumping
> to __drm_state_dump(), so that it is also included into drm_state_dump()
> output and into debugfs/dri/N/state file.
> 
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
