Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7294E37776A
	for <lists+freedreno@lfdr.de>; Sun,  9 May 2021 17:42:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19B2E6E213;
	Sun,  9 May 2021 15:42:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B46089ECB
 for <freedreno@lists.freedesktop.org>; Sun,  9 May 2021 15:39:10 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 z6-20020a17090a1706b0290155e8a752d8so8675274pjd.4
 for <freedreno@lists.freedesktop.org>; Sun, 09 May 2021 08:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fex-emu.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oj0cxtHt4k2QsOXZJ1mqPuS+LtZjL33yvcuTzOU4i9s=;
 b=iPAkYy0A4N8s4fD0pZoq7FzyT0D+8DjZXwCk6RYtKFLK7vSjHvVnOIk+ObDRKyOj50
 tSp4hbp0MFDRo4U5V5RjC0lJEhqmUhidM34nw1H7TTDHJR3lsbgzdrb86iUWYsekbGoA
 IjlqnNTtyNj3z2m3qndB7GPdKpB6Uirek398l58yxQdH667l3ySPwwKs+ER37NXLZtqC
 f2Xyzakp4dd+55nb7onMffwEfH1/NxuCWefIj3hJ+u6HLcVBWxZKEuHI+/5txKXomSz4
 wo3ORaUiHQ/DnKM8g+YJfNB0mQx3KRG9yKYxbgcP3Z4l2e75E5edYfzZyz6SyM8G5RmA
 Pj6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oj0cxtHt4k2QsOXZJ1mqPuS+LtZjL33yvcuTzOU4i9s=;
 b=FiUSZV0x+j+osIqrznoasPntTiI5Q9ni8O+h5Ls815PEJJJuObilPLfkA1ga0kTsZV
 szj55b6DxFtz035geXh8KH+5njbOpU5fCT+vhzP3+2TcBPqcQhYhx9iVPa6TMjrOOzzs
 reMUwvTquGovpkH5aMZEkx4pZJ9K3rBI+LfZqf7qXGPruR7JQyyFinBnBm/fmRlDoDva
 bd9zWlNDIaUYrDdwzyWcSgl9gyLr9G5Ho46JPbMo8vsfchgm/gaIGWrrUPT6+MFVyVjO
 yZZMf7uJ6jPV01GuIR8Uba+xpLgGJXZzibmGtQBNOLJjnFsAbUDs3qtWU6nhiptTc+II
 2hYQ==
X-Gm-Message-State: AOAM531h7W18o7MHdtNBOrPH6OQQ8whsPFCJsH9HLkbPMwkH3gwfSuNe
 NpTy8G7R21GV1yGX7873VHyAog==
X-Google-Smtp-Source: ABdhPJzuLvXgVXIw+/LHFTPK/5u6YP6h1gj2+taNgTrrzE8i9b7+EhMUEJXEeJqGgSCKFtZKjzuPGg==
X-Received: by 2002:a17:902:7c94:b029:e6:e1d7:62b7 with SMTP id
 y20-20020a1709027c94b02900e6e1d762b7mr20240359pll.29.1620574750226; 
 Sun, 09 May 2021 08:39:10 -0700 (PDT)
Received: from localhost.localdomain
 (76-242-91-105.lightspeed.sntcca.sbcglobal.net. [76.242.91.105])
 by smtp.gmail.com with ESMTPSA id x27sm9505403pfo.216.2021.05.09.08.39.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 May 2021 08:39:09 -0700 (PDT)
From: houdek.ryan@fex-emu.org
X-Google-Original-From: Houdek.Ryan@fex-emu.org
To: robdclark@gmail.com
Date: Sun,  9 May 2021 08:38:42 -0700
Message-Id: <20210509153842.124974-1-Houdek.Ryan@fex-emu.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210508195641.397198-3-robdclark@gmail.com>
References: <20210508195641.397198-3-robdclark@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 09 May 2021 15:42:54 +0000
Subject: [Freedreno] Tested
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
Cc: robdclark@chromium.org, Ryan Houdek <Houdek.Ryan@fex-emu.org>,
 airlied@linux.ie, linux-arm-msm@vger.kernel.org, yaohongbo@huawei.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, sean@poorly.run, miaoqinglang@huawei.com,
 abhinavk@codeaurora.org, kalyan_t@codeaurora.org,
 freedreno@lists.freedesktop.org, maxime@cerno.tech
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

I have tested this on my end and it resolves the 120hz problem.

Tested-By: Ryan Houdek <Houdek.Ryan@fex-emu.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
