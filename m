Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F112E37F704
	for <lists+freedreno@lfdr.de>; Thu, 13 May 2021 13:45:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A029F6ECF9;
	Thu, 13 May 2021 11:45:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
X-Greylist: delayed 435 seconds by postgrey-1.36 at gabe;
 Thu, 13 May 2021 11:45:05 UTC
Received: from vps5.brixit.nl (vps5.brixit.nl [192.81.221.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 838CB6ECF9
 for <freedreno@lists.freedesktop.org>; Thu, 13 May 2021 11:45:05 +0000 (UTC)
Received: from [192.168.20.2] (unknown [77.239.252.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by vps5.brixit.nl (Postfix) with ESMTPSA id 736F160768;
 Thu, 13 May 2021 11:37:48 +0000 (UTC)
To: freedreno@lists.freedesktop.org
References: <20210513003811.29578-1-jonathan@marek.ca>
 <20210513003811.29578-2-jonathan@marek.ca>
From: Alexey Minnekhanov <alexeymin@postmarketos.org>
Message-ID: <50e39f47-519c-b04e-b686-f476982eaad7@postmarketos.org>
Date: Thu, 13 May 2021 14:37:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210513003811.29578-2-jonathan@marek.ca>
Content-Language: en-US
Subject: Re: [Freedreno] [PATCH 1/5] drm/msm: remove unused
 icc_path/ocmem_icc_path
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

13.05.2021 03:37, Jonathan Marek:
> These aren't used by anything anymore.
> 

Hi, I feel like this needs a bit more explanation, otherwise it looks 
like just removing support for older hardware. Where and how msm8974's 
ocmem and icc is handled, and how it should work?

-- 
Regards,
Alexey Minnekhanov

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
