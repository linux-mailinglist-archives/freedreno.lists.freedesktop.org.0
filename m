Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45AF1A563D4
	for <lists+freedreno@lfdr.de>; Fri,  7 Mar 2025 10:30:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C5FB10EB26;
	Fri,  7 Mar 2025 09:30:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vepRDBUt";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CC5910EB32
 for <freedreno@lists.freedesktop.org>; Fri,  7 Mar 2025 09:30:54 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-43bbd711eedso12528055e9.3
 for <freedreno@lists.freedesktop.org>; Fri, 07 Mar 2025 01:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741339853; x=1741944653; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cWeDyXgdM9hubjOCKBZmiC1OcDCgIXm8CMskHHCrzsU=;
 b=vepRDBUt9YXbVQseOnAUDik2TELB/4XoposLetgHKuKbHeoGeb4hgkfyWFRvaSQCq2
 sXITsNTe54jB3g1sTt7SNvdE/Py8tt90n6IbBmO9s0KD62PWu3MXqzO3XEVHlmXk7/nK
 qn2APOQDM/mgVfuT3CUmWL0dYER0+DZJNwaNgTimv+r2hgLhtrma5vtjt7iIYlRxusS5
 JF2ooAgP2MZGGXwtMtKTnROzk25zo693leOTfECPfqjYIIfz/O8MjqYnd19lIOuk2j5y
 wfUk7XvXEbjMoUK144xIOH3svN+53mRYCNARhjUQFuqxRwR1xRxgUUSza7xINeq8UeRs
 aptA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741339853; x=1741944653;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cWeDyXgdM9hubjOCKBZmiC1OcDCgIXm8CMskHHCrzsU=;
 b=LPMkkV2UcGvneF3Ym0OXh4EWS5ud72KrBm3equFaW29Z4tNJOKuh58iI+GhZ8zb6X7
 zr9rWZo4tMArFHqsxrLTcNw/H5ZS+fEyhigJLML5pafNPOhzFcS5N9UQA8edCvCzvqLB
 Z3IkztcDVVZm/mtkrSExnZePQMI5QNaZW45EEZPR6aciuycRetNids4GC26gHYn6yIVu
 opZFnRCN5gOrNg7gBPE6q004O4abbCA6PLBksiADZwXRmnaBn2gxWgLzMBnKFIXqNMLZ
 RSMW2Gu2UAb8jJJEE5DAfIElj8oF231f07WGUun3DFvST4SI2jnkyEOoWR8YyiP+rALp
 nNkg==
X-Gm-Message-State: AOJu0YzmpYiJQNzrKWsdJp3u83FjfS23DsChRjR8GsFD3H+P005OVr+o
 rcHFtv3fYPp28zVPYp6cqGuwu/6tYZ8N9UtMyXLIte7C3k2JaL7ZV/quw5gQVOI=
X-Gm-Gg: ASbGncu42cRNjwR0XwPcQiBSGrqEcVPM0nbo6dqhDm95spC21UoJecQwD/dMcMWp18S
 Drg7L1mBY8MIhtcFlMdO4iFLmZw8qWReyVXIYOrTbSPVGuGUaOcetkv/JTdRj80fL/EMcIeyFjH
 zFThfmjq3gzGG+Xg3jvUSG9Ot/Z5DxKTd3XKgsP+iOKXTGYOYXq0R3KHyc1R6G7hEj3+gLpFZNR
 tLOQNN/mFWnUOkjc8jQ8liVse0feehv3kAegfVR6gkq3jAfeClZ+xAjkSNs2lSUSHvX77mbxs2/
 R8xZ80bmzABY3gsjyN2T8K/xOyD5j4UPQAtqv/tdi6+rpYQ4Gg==
X-Google-Smtp-Source: AGHT+IH6CU/bySlh4OV3OfPmWXUpozBNfLBAqdUz3u7EFMIMNivPuPX2v3k9lyc8xhBj5OEmDoLHbg==
X-Received: by 2002:a05:600c:46ca:b0:439:88bb:d002 with SMTP id
 5b1f17b1804b1-43c5a629b5bmr17283005e9.23.1741339852678; 
 Fri, 07 Mar 2025 01:30:52 -0800 (PST)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-43bd4293250sm74899315e9.16.2025.03.07.01.30.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 01:30:52 -0800 (PST)
Date: Fri, 7 Mar 2025 12:30:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: freedreno@lists.freedesktop.org
Subject: [bug report] drm/msm/dpu: Skip trigger flush and start for CWB
Message-ID: <19f0b5b4-6d27-4b25-9019-1fb44d05ea2c@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hello Jessica Zhang,

This is a semi-automatic email about new static checker warnings.

Commit 8144d17a81d9 ("drm/msm/dpu: Skip trigger flush and start for
CWB") from Feb 14, 2025, leads to the following Smatch complaint:

    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:1672 _dpu_encoder_trigger_start()
    warn: variable dereferenced before check 'phys' (see line 1670)

drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
  1669	{
  1670		struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(phys->parent);
                                                                       ^^^^^^^^^^^^
Dereference

  1671	
  1672		if (!phys) {
                    ^^^^^

  1673			DPU_ERROR("invalid argument(s)\n");
  1674			return;

drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:1814 _dpu_encoder_kickoff_phys()
error: we previously assumed 'dpu_enc->cur_master' could be null (see line 1807)

drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
  1805  
  1806          /* for split flush, combine pending flush masks and send to master */
  1807          if (pending_flush && dpu_enc->cur_master) {
                                     ^^^^^^^^^^^^^^^^^^^
Check for NULL

  1808                  _dpu_encoder_trigger_flush(
  1809                                  &dpu_enc->base,
  1810                                  dpu_enc->cur_master,
  1811                                  pending_flush);
  1812          }
  1813  
  1814          _dpu_encoder_trigger_start(dpu_enc->cur_master);
                                           ^^^^^^^^^^^^^^^^^^^
Unchecked dereference.  Although, I guess this will go away if we
fix the first warning.

  1815  

regards,
dan carpenter
