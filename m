Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1082837FE83
	for <lists+freedreno@lfdr.de>; Thu, 13 May 2021 22:02:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A3746EDD3;
	Thu, 13 May 2021 20:02:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDDAC6EDD3
 for <freedreno@lists.freedesktop.org>; Thu, 13 May 2021 20:02:33 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id c10so10876087qtx.10
 for <freedreno@lists.freedesktop.org>; Thu, 13 May 2021 13:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=ewu1r/oNW8lHuJD19Ho/qTJSRsGm88k3kzphBGVqNFI=;
 b=nDp552xOkxqdtWhGHuP3+3tQxuUhA0Sd5BdSEM7pqmtc0eYNSV3S6w+/kBULaQmylW
 YZ686yUiwQvwUgPEFxZkWdsxtWX+vB+Il8TIU4KB1WAVORnlvwkQukBMfvzLnCVMUqo3
 ov58RRpFk5EoDvVN1018r16nO0Iji/OPGJwzScJ4aKl9RYccxxtOblQ8assPbglK7Bj8
 +sVdmtd4ZbeO2Rplh2WQIb41GBxwjE/yA34dE+aQ+73Zu39rQC12ZPpMF++5kysmIU6a
 HJdz+4msHnNBy8CcFTiH2evqOxU6jqov/XdllN4Y0tmJHz8bCnOIPuI6R+LKg3V+txIT
 2CWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ewu1r/oNW8lHuJD19Ho/qTJSRsGm88k3kzphBGVqNFI=;
 b=Y+eSCiiE4/UYRKlCBwxS2aEUM7RBJWo6X7NE4p4HVRWbguBCptlg82hFuf6yeau+Jp
 xxNOdziM5XnG0UB3zBYVTNKnOPypvIQGBoOqvt4ZIj+d1dtDutKnN6WqR166jNeSEmOK
 VKkx08kY+55vuFjYUaRdcXuueeqr5xeUjstumOVnx+Xg3fIrZjzvLF7ZFXcI8EfkYt4O
 HxdjKZVBaRgmbvPGoNHAVvOxXcgep7Yv1RSZ0xJqhqeG+DydHyEh8tCAshURL+DolO+t
 pf6SbZKcI2OY/qjYjXJSmQmgrHmBpuYDcRuN/mQ5nwbkjKbFjtUaGRwtDgpb1cbJ9NAp
 sSlA==
X-Gm-Message-State: AOAM533UH0m2Aa9kAtdk/CLSATqgH8QUOTy01f8M7nSAkinKhkSef4bM
 QYWyc0V4PSocaL3OCmsO6EhJuWUbMU/JUVHs
X-Google-Smtp-Source: ABdhPJxlu4qrLe3hkNDJS4+j8IeNNRkTUIoFlIT/GDX1XkxOddF7Y7FXAKRlWcmwxRTKEy/6bBFH6w==
X-Received: by 2002:ac8:6bc9:: with SMTP id b9mr34256814qtt.116.1620936152298; 
 Thu, 13 May 2021 13:02:32 -0700 (PDT)
Received: from [192.168.0.189] (modemcable068.184-131-66.mc.videotron.ca.
 [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id g6sm2957911qkm.120.2021.05.13.13.02.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 May 2021 13:02:31 -0700 (PDT)
To: Alexey Minnekhanov <alexeymin@postmarketos.org>,
 freedreno@lists.freedesktop.org
References: <20210513003811.29578-1-jonathan@marek.ca>
 <20210513003811.29578-2-jonathan@marek.ca>
 <50e39f47-519c-b04e-b686-f476982eaad7@postmarketos.org>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <89ab0655-9776-eff2-4524-acd08e47cc0c@marek.ca>
Date: Thu, 13 May 2021 16:02:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <50e39f47-519c-b04e-b686-f476982eaad7@postmarketos.org>
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

There isn't much to explain, these fields just aren't used anymore 
(except for the icc_put() calls which this patch removes). a3xx is using 
devm_of_icc_get() and only sets the bandwidth once on init.

On 5/13/21 7:37 AM, Alexey Minnekhanov wrote:
> 13.05.2021 03:37, Jonathan Marek:
>> These aren't used by anything anymore.
>>
> 
> Hi, I feel like this needs a bit more explanation, otherwise it looks 
> like just removing support for older hardware. Where and how msm8974's 
> ocmem and icc is handled, and how it should work?
> 
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
