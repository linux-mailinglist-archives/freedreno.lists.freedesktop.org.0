Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 138CB67ED0F
	for <lists+freedreno@lfdr.de>; Fri, 27 Jan 2023 19:10:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D410110E188;
	Fri, 27 Jan 2023 18:10:43 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
X-Greylist: delayed 481 seconds by postgrey-1.36 at gabe;
 Fri, 27 Jan 2023 18:10:41 UTC
Received: from mail-4327.protonmail.ch (mail-4327.protonmail.ch [185.70.43.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1F2810E188
 for <freedreno@lists.freedesktop.org>; Fri, 27 Jan 2023 18:10:41 +0000 (UTC)
Date: Fri, 27 Jan 2023 18:02:23 +0000
Authentication-Results: mail-4321.protonmail.ch;
 dkim=pass (2048-bit key) header.d=emersion.fr header.i=@emersion.fr
 header.b="nZ7r7awS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1674842549; x=1675101749;
 bh=G3N1dUBCoS3HUBukvqJJ/tzvPtsoCbWhZtyZKVUf/Uw=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=nZ7r7awSwyh0CWD7LR7Uo8G18yAuRzK/BHVOCsJCTwZuLv48eWgTHHODREcaEqVRK
 4AXYVehhR7ffzpiV0nx/eZr78rXRozRr0v/oesPTBuYDgRQWKbeNtHuJJ8Dhtcl+yq
 y1jTt0yuURsHGOb3B3g7RllVa45/XyiDsRJ4MUtfXuKVUsJ5dY3lOU5D2qogZ3dAtv
 W6MNwOP0Z/DjpodbcuRWJlESPN7PEsXsW3U0QVJcYZZHCmcALXzXOdlp37/vksAC73
 XST6c/9eEfZnB1QQXH/PSZsAce7Gnkf39/x2odP6Gs5mYjDdWFzskWx2sqgGtGk6Qf
 3orddiMWiXAAA==
To: Thomas Zimmermann <tzimmermann@suse.de>
From: Simon Ser <contact@emersion.fr>
Message-ID: <tc_igyYrgA_B5xJ15j6H2fQ00aA6vzd4nuQ8XusqeJqWWNZDJx8fFRgBAWoWOV8L5BEhjFDMYgANfdKXLqJZ0DMcsZfy8OUHDRatj36oOXo=@emersion.fr>
In-Reply-To: <20230125200415.14123-2-tzimmermann@suse.de>
References: <20230125200415.14123-1-tzimmermann@suse.de>
 <20230125200415.14123-2-tzimmermann@suse.de>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Freedreno] [PATCH v3 01/10] drm/client: Test for connectors
 before sending hotplug event
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
Cc: freedreno@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
 javierm@redhat.com, mripard@kernel.org, dri-devel@lists.freedesktop.org,
 daniel@ffwll.ch, linux-tegra@vger.kernel.org, airlied@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wednesday, January 25th, 2023 at 21:04, Thomas Zimmermann <tzimmermann@s=
use.de> wrote:

> Not having connectors indicates a driver bug.

Is it? What if all connectors are of the DP-MST type, ie. they are
created on-the-fly?
